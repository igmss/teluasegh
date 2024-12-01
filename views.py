from datetime import datetime
from decimal import Decimal

from django.contrib.auth import authenticate, login, logout, get_user_model
from django.contrib.auth.decorators import login_required, user_passes_test
from django.core.paginator import Paginator
from django.db.models import Q
from django.http import JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.template.defaultfilters import register
from django.utils.decorators import method_decorator
from django.views import View
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_POST
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView

from .custom_filters import abs_value
from .forms import (
    SignUpForm,
    LoginForm,
    UserEditForm,
    CategoryForm,
    ProductForm,
)
from .models import (
    Wallet,
    Transaction,
    Order,
    CartItem,
    Product,
    Category,
)

User = get_user_model()


class IndexView(APIView):
    """renders index page"""

    def get(self, request):
        """get function"""
        return render(request, "index.html")


class SignUpView(APIView):
    """renders signup page"""

    def get(self, request):
        """get function"""
        form = SignUpForm()
        return render(request, "signup.html", {"form": form})

    def post(self, request):
        """post fucntion"""
        form = SignUpForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.user_type = "customer"
            user.save()
            return render(
                request, "signup_success.html", {"username": user.username}
            )
        return render(request, "signup.html", {"form": form})


class LoginView(APIView):
    """renders login page"""

    def get(self, request):
        """gets the login form"""
        form = LoginForm()
        # Get the 'next' parameter from the request
        next_url = request.GET.get("next")
        return render(request, "login.html", {"form": form, "next": next_url})

    def post(self, request):
        """logins"""
        form = LoginForm(request.POST)
        if form.is_valid():
            user = authenticate(
                username=form.cleaned_data["username"],
                password=form.cleaned_data["password"],
            )
            if user:
                login(request, user)
                # Redirect to the 'next' URL if it exists, otherwise redirect to 'index'
                next_url = request.GET.get("next")
                if next_url:
                    return redirect(next_url)
                else:
                    return redirect("index")
        return render(
            request,
            "login.html",
            {"form": form, "error": "Invalid credentials"},
        )


class LogoutView(APIView):
    """renders logout page"""

    permission_classes = [IsAuthenticated]

    def get(self, request):
        """logout request"""
        logout(request)
        return redirect("index")


@method_decorator(login_required, name="get")
class ProfileView(APIView):
    """renders profile page"""

    def get(self, request):
        """get request"""
        return render(request, "profile.html")
def is_superadmin(user):
    """authenticates superadmin"""
    return user.is_authenticated and user.is_superuser


@method_decorator(user_passes_test(is_superadmin), name="dispatch")
class SuperAdminDashboardView(APIView):
    """renders superadmin dashboard"""

    def get(self, request):
        """dashboard view"""
        users = User.objects.all()
        return render(request, "superadmin/dashboard.html", {"users": users})


@method_decorator(user_passes_test(is_superadmin), name="dispatch")
class SuperAdminAddAdminView(APIView):
    """renders addadmin page"""

    def get(self, request):
        """get request"""
        form = SignUpForm()
        return render(request, "superadmin/add_admin.html", {"form": form})

    def post(self, request):
        """post request"""
        form = SignUpForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.user_type = "admin"
            user.is_staff = True
            user.save()
            return redirect("superadmin_dashboard")
        return render(request, "superadmin/add_admin.html", {"form": form})


@method_decorator(user_passes_test(is_superadmin), name="dispatch")
class SuperAdminUserDetailView(APIView):
    """renders user details page"""

    def get(self, request, user_id):
        """get request"""
        user = get_object_or_404(User, id=user_id)
        return render(request, "superadmin/user_detail.html", {"user": user})


@method_decorator(user_passes_test(lambda u: u.is_superuser), name="dispatch")
class SuperAdminEditUserView(APIView):
    """renders edit admin page"""

    def get(self, request, user_id):
        """get request"""
        user = get_object_or_404(User, id=user_id)
        form = UserEditForm(instance=user)
        return render(
            request, "superadmin/edit_user.html", {"form": form, "user": user}
        )

    def post(self, request, user_id):
        """post request"""
        user = get_object_or_404(User, id=user_id)
        form = UserEditForm(request.POST, instance=user)
        if form.is_valid():
            updated_user = form.save(commit=False)
            updated_user.save()
            return redirect("superadmin_dashboard")
        return render(
            request, "superadmin/edit_user.html", {"form": form, "user": user}
        )


class SuperAdminDeleteUserView(APIView):
    """Deletes an admin user"""

    def post(self, request, user_id):
        """Deletes user and redirects to dashboard"""
        user = get_object_or_404(User, id=user_id)
        user.delete()
        return redirect("superadmin_dashboard")
def is_admin(user):
    """authenticates admin"""
    return user.is_authenticated and user.user_type == "admin"


@method_decorator(user_passes_test(is_admin), name="dispatch")
class AdminDashboardView(APIView):
    """Renders admin dashboard"""

    def get(self, request):
        """Uses paginators"""
        products = Product.objects.all().order_by("-id")
        paginator = Paginator(products, 4)
        page_number = request.GET.get("page")
        page_obj = paginator.get_page(page_number)
        return render(request, "admin/dashboard.html", {"page_obj": page_obj})


@method_decorator(user_passes_test(is_admin), name="dispatch")
class AdminManageCategoriesView(APIView):
    """Renders category page"""

    def get(self, request):
        """Displays all the categories"""
        categories = Category.objects.all()
        form = CategoryForm()
        return render(
            request,
            "admin/manage_categories.html",
            {"categories": categories, "form": form},
        )

    def post(self, request):
        """Saves the category"""
        form = CategoryForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("admin_manage_categories")
        categories = Category.objects.all()
        return render(
            request,
            "admin/manage_categories.html",
            {"categories": categories, "form": form},
        )


@method_decorator(user_passes_test(is_admin), name="dispatch")
class AdminDeleteCategoryView(APIView):
    """Renders delete category page"""

    def post(self, request, category_id):
        """Deletes the category"""
        category = get_object_or_404(Category, id=category_id)
        category.delete()
        return redirect("admin_manage_categories")


@method_decorator(user_passes_test(is_admin), name="dispatch")
class AdminProductDetailView(APIView):
    """renders product details"""

    def get(self, request, product_id):
        """get request"""
        product = get_object_or_404(Product, id=product_id)
        return render(request, "admin/product_detail.html", {"product": product})


@method_decorator(user_passes_test(is_admin), name="dispatch")
class AdminAddProductView(APIView):
    """adds product"""

    def get(self, request):
        """get request"""
        form = ProductForm()
        categories = Category.objects.all()
        return render(
            request,
            "admin/add_product.html",
            {"form": form, "categories": categories},
        )

    def post(self, request):
        """post request"""
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect("admin_dashboard")
        categories = Category.objects.all()
        return render(
            request,
            "admin/add_product.html",
            {"form": form, "categories": categories},
        )


@method_decorator(user_passes_test(is_admin), name="dispatch")
class AdminDeleteProductView(APIView):
    """deletes products"""

    def post(self, product_id):
        """deletes and redirects to dashboard"""
        product = get_object_or_404(Product, id=product_id)
        product.delete()
        return redirect("admin_dashboard")
@method_decorator(login_required, name="dispatch")
class CustomerDashboardView(View):
    """Renders customer dashboard page"""

    def get(self, request):
        """Gets wallet balance"""
        wallet, _ = Wallet.objects.get_or_create(user=request.user)
        recent_transactions = Transaction.objects.filter(wallet=wallet).order_by(
            "-timestamp"
        )[:5]
        context = {
            "balance": wallet.balance,
            "recent_transactions": recent_transactions,
        }
        return render(request, "customer/wallet_dashboard.html", context)


@method_decorator(login_required, name="dispatch")
@method_decorator(csrf_exempt, name="dispatch")
class AddMoneyToWalletView(View):
    """Adds money to the wallet"""

    def post(self, request):
        """Add the money with the password"""
        amount = request.POST.get("amount")
        password = request.POST.get("password")

        if not amount or not password:
            return JsonResponse(
                {"error": "Amount and password are required"}, status=400
            )

        user = authenticate(username=request.user.username, password=password)
        if not user:
            return JsonResponse({"error": "Invalid password"}, status=401)

        try:
            amount = Decimal(amount)
        except ValueError:
            return JsonResponse({"error": "Invalid amount"}, status=400)

        if amount <= 0 or amount > 1000000:
            return JsonResponse(
                {"error": "Amount must be between 0 and 10,00,000"}, status=400
            )

        wallet, _ = Wallet.objects.get_or_create(user=request.user)
        if wallet.balance + amount > 1000000:
            return JsonResponse(
                {"error": "Total balance cannot exceed 10,00,000"}, status=400
            )
        wallet.balance += amount
        wallet.save()
        Transaction.objects.create(wallet=wallet, amount=amount)
        return JsonResponse(
            {"success": True, "new_balance": float(wallet.balance)}
        )


@register.filter(name="abs_value")
def abs_value_filter(value):
    """Absolute value filter"""
    return abs_value(value)


@method_decorator(login_required, name="dispatch")
class WalletDashboardView(View):
    """Renders the wallet page"""

    def get(self, request):
        """Displays the wallet amount and transactions"""
        wallet, _ = Wallet.objects.get_or_create(user=request.user)
        transactions = Transaction.objects.filter(wallet=wallet).order_by(
            "-timestamp"
        )
        from_date = request.GET.get("from_date")
        to_date = request.GET.get("to_date")
        if from_date and to_date:
            from_date = datetime.strptime(from_date, "%Y-%m-%d")
            to_date = datetime.strptime(to_date, "%Y-%m-%d")
            transactions = transactions.filter(
                timestamp__date__range=[from_date, to_date]
            )
        paginator = Paginator(transactions, 10)
        page_number = request.GET.get("page")
        page_obj = paginator.get_page(page_number)
        context = {
            "balance": wallet.balance,
            "page_obj": page_obj,
            "from_date": from_date,
            "to_date": to_date,
        }
        return render(request, "customer/wallet_dashboard.html", context)


class ProductDetailView(View):  # Removed login_required
    """lists the individual product detail"""

    def get(self, request, product_id):
        """renders the product detail page"""
        product = get_object_or_404(Product, id=product_id)
        return render(request, "customer/product_detail.html", {"product": product})


@method_decorator(login_required, name="dispatch")
class CheckoutView(View):
    """checks out the cart"""

    def get(self, request):
        """for get request"""
        cart_items = CartItem.objects.filter(user=request.user)
        total = sum(item.total_price() for item in cart_items)
        wallet = Wallet.objects.get(user=request.user)
        return render(
            request,
            "customer/checkout.html",
            {
                "cart_items": cart_items,
                "total": total,
                "wallet_balance": wallet.balance,
            },
        )

    def post(self, request):
        """for post request"""
        cart_items = CartItem.objects.filter(user=request.user)
        total = sum(item.total_price() for item in cart_items)
        wallet = Wallet.objects.get(user=request.user)
        password = request.POST.get("password")
        user = authenticate(username=request.user.username, password=password)
        if user is not None:
            if wallet.balance >= total:
                order = Order.objects.create(
                    user=request.user, total_price=total, status="completed"
                )
                order.items.set(cart_items)
                wallet.balance -= Decimal(total)
                wallet.save()
                Transaction.objects.create(wallet=wallet, amount=-total)
                cart_items.delete()
                return redirect("order_confirmation", order_id=order.id)
            else:
                return render(
                    request,
                    "customer/checkout.html",
                    {
                        "cart_items": cart_items,
                        "total": total,
                        "wallet_balance": wallet.balance,
                        "error": "Insufficient funds in your wallet.",
                    },
                )
        else:
            return render(
                request,
                "customer/checkout.html",
                {
                    "cart_items": cart_items,
                    "total": total,
                    "wallet_balance": wallet.balance,
                    "error": "Invalid password. Please try again.",
                },
            )


class ProductListView(View):  # Removed login_required
    """lists the products"""

    def get(self, request):
        """uses filters by category and brand"""
        products = Product.objects.all()