import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => RootPageContext.wrap(
        appStateNotifier.loggedIn ? const HomeWidget() : const StartWidget(),
        errorRoute: state.uri.toString(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => RootPageContext.wrap(
            appStateNotifier.loggedIn ? const HomeWidget() : const StartWidget(),
          ),
        ),
        FFRoute(
          name: 'Start',
          path: '/start',
          builder: (context, params) => const StartWidget(),
        ),
        FFRoute(
          name: 'LoginMethod',
          path: '/loginMethod',
          builder: (context, params) => const LoginMethodWidget(),
        ),
        FFRoute(
          name: 'OnBoarding',
          path: '/onBoarding',
          builder: (context, params) => const OnBoardingWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'onBoard_Profile',
          path: '/onBoardProfile',
          requireAuth: true,
          builder: (context, params) => const OnBoardProfileWidget(),
        ),
        FFRoute(
          name: 'pinCodeSet',
          path: '/pinCodeSet',
          builder: (context, params) => const PinCodeSetWidget(),
        ),
        FFRoute(
          name: 'BiometricSet',
          path: '/biometricSet',
          builder: (context, params) => const BiometricSetWidget(),
        ),
        FFRoute(
          name: 'ForgotPass',
          path: '/forgotPass',
          builder: (context, params) => ForgotPassWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Home',
          path: '/home',
          requireAuth: true,
          builder: (context, params) => const HomeWidget(),
        ),
        FFRoute(
          name: 'Cart',
          path: '/cart',
          requireAuth: true,
          builder: (context, params) => const CartWidget(),
        ),
        FFRoute(
          name: 'Notifications',
          path: '/notifications',
          requireAuth: true,
          builder: (context, params) => const NotificationsWidget(),
        ),
        FFRoute(
          name: 'WishLIst',
          path: '/wishLIst',
          requireAuth: true,
          builder: (context, params) => const WishLIstWidget(),
        ),
        FFRoute(
          name: 'SpecialOffers',
          path: '/specialOffers',
          requireAuth: true,
          builder: (context, params) => const SpecialOffersWidget(),
        ),
        FFRoute(
          name: 'Products',
          path: '/products',
          requireAuth: true,
          asyncParams: {
            'specialOffer':
                getDoc(['specialOffer'], SpecialOfferRecord.fromSnapshot),
          },
          builder: (context, params) => ProductsWidget(
            pageTitle: params.getParam(
              'pageTitle',
              ParamType.String,
            ),
            specialOffer: params.getParam(
              'specialOffer',
              ParamType.Document,
            ),
            showMostPopular: params.getParam(
              'showMostPopular',
              ParamType.bool,
            ),
            showSpecialOffer: params.getParam(
              'showSpecialOffer',
              ParamType.bool,
            ),
            showActiveCategory: params.getParam(
              'showActiveCategory',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Search',
          path: '/search',
          requireAuth: true,
          builder: (context, params) => const SearchWidget(),
        ),
        FFRoute(
          name: 'Detail',
          path: '/detail',
          requireAuth: true,
          asyncParams: {
            'product': getDoc(['product'], ProductRecord.fromSnapshot),
          },
          builder: (context, params) => DetailWidget(
            product: params.getParam(
              'product',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Reviews',
          path: '/reviews',
          requireAuth: true,
          asyncParams: {
            'product': getDoc(['product'], ProductRecord.fromSnapshot),
          },
          builder: (context, params) => ReviewsWidget(
            product: params.getParam(
              'product',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'CheckOut',
          path: '/checkOut',
          requireAuth: true,
          builder: (context, params) => CheckOutWidget(
            orderRef: params.getParam(
              'orderRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['order'],
            ),
          ),
        ),
        FFRoute(
          name: 'ShippingMethods',
          path: '/shippingMethods',
          requireAuth: true,
          builder: (context, params) => const ShippingMethodsWidget(),
        ),
        FFRoute(
          name: 'LoginSecure',
          path: '/loginSecure',
          requireAuth: true,
          builder: (context, params) => LoginSecureWidget(
            securityType: params.getParam(
              'securityType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'OrderHistory',
          path: '/orderHistory',
          requireAuth: true,
          builder: (context, params) => const OrderHistoryWidget(),
        ),
        FFRoute(
          name: 'Wallet',
          path: '/wallet',
          requireAuth: true,
          builder: (context, params) => const WalletWidget(),
        ),
        FFRoute(
          name: 'TrackOrder',
          path: '/trackOrder',
          requireAuth: true,
          asyncParams: {
            'order': getDoc(['order'], OrderRecord.fromSnapshot),
          },
          builder: (context, params) => TrackOrderWidget(
            order: params.getParam(
              'order',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'TopUp',
          path: '/topUp',
          requireAuth: true,
          asyncParams: {
            'wallet': getDoc(['wallet'], WalletRecord.fromSnapshot),
          },
          builder: (context, params) => TopUpWidget(
            wallet: params.getParam(
              'wallet',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Transactions',
          path: '/transactions',
          requireAuth: true,
          builder: (context, params) => TransactionsWidget(
            walletRef: params.getParam(
              'walletRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['wallet'],
            ),
          ),
        ),
        FFRoute(
          name: 'E-Receipt',
          path: '/eReceipt',
          requireAuth: true,
          asyncParams: {
            'order': getDoc(['order'], OrderRecord.fromSnapshot),
          },
          builder: (context, params) => EReceiptWidget(
            order: params.getParam(
              'order',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          requireAuth: true,
          builder: (context, params) => const ProfileWidget(),
        ),
        FFRoute(
          name: 'ProfileEdit',
          path: '/profileEdit',
          requireAuth: true,
          builder: (context, params) => const ProfileEditWidget(),
        ),
        FFRoute(
          name: 'Address',
          path: '/address',
          requireAuth: true,
          builder: (context, params) => AddressWidget(
            shipitem: params.getParam(
              'shipitem',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SettingNotification',
          path: '/settingNotification',
          requireAuth: true,
          builder: (context, params) => const SettingNotificationWidget(),
        ),
        FFRoute(
          name: 'PaymentMethods',
          path: '/paymentMethods',
          requireAuth: true,
          builder: (context, params) => const PaymentMethodsWidget(),
        ),
        FFRoute(
          name: 'NewCard',
          path: '/newCard',
          requireAuth: true,
          builder: (context, params) => const NewCardWidget(),
        ),
        FFRoute(
          name: 'Security',
          path: '/security',
          requireAuth: true,
          builder: (context, params) => const SecurityWidget(),
        ),
        FFRoute(
          name: 'Language',
          path: '/language',
          requireAuth: true,
          builder: (context, params) => const LanguageWidget(),
        ),
        FFRoute(
          name: 'PrivacyPolicy',
          path: '/privacyPolicy',
          builder: (context, params) => const PrivacyPolicyWidget(),
        ),
        FFRoute(
          name: 'InviteContacts',
          path: '/inviteContacts',
          requireAuth: true,
          builder: (context, params) => InviteContactsWidget(
            listitem: params.getParam(
              'listitem',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'HelpCenter',
          path: '/helpCenter',
          requireAuth: true,
          builder: (context, params) => const HelpCenterWidget(),
        ),
        FFRoute(
          name: 'CustomerSupport',
          path: '/customerSupport',
          requireAuth: true,
          builder: (context, params) => const CustomerSupportWidget(),
        ),
        FFRoute(
          name: 'Signup',
          path: '/signup',
          builder: (context, params) => const SignupWidget(),
        ),
        FFRoute(
          name: 'SecurityChoice',
          path: '/securityChoice',
          builder: (context, params) => const SecurityChoiceWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/start';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primaryText,
                  child: Image.asset(
                    'assets/images/0_1_(8).jpeg',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.scale,
        alignment: Alignment.bottomCenter,
        duration: Duration(milliseconds: 200),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
