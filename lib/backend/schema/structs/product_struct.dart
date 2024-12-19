// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductStruct extends FFFirebaseStruct {
  ProductStruct({
    String? name,
    String? description,
    double? price,
    bool? discounted,
    double? discountAmount,
    double? rate,
    int? sold,
    String? productCover,
    List<String>? productImages,
    List<String>? sizes,
    List<String>? colors,
    int? numberOfReviews,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _description = description,
        _price = price,
        _discounted = discounted,
        _discountAmount = discountAmount,
        _rate = rate,
        _sold = sold,
        _productCover = productCover,
        _productImages = productImages,
        _sizes = sizes,
        _colors = colors,
        _numberOfReviews = numberOfReviews,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "discounted" field.
  bool? _discounted;
  bool get discounted => _discounted ?? false;
  set discounted(bool? val) => _discounted = val;

  bool hasDiscounted() => _discounted != null;

  // "discount_amount" field.
  double? _discountAmount;
  double get discountAmount => _discountAmount ?? 0.0;
  set discountAmount(double? val) => _discountAmount = val;

  void incrementDiscountAmount(double amount) =>
      discountAmount = discountAmount + amount;

  bool hasDiscountAmount() => _discountAmount != null;

  // "rate" field.
  double? _rate;
  double get rate => _rate ?? 0.0;
  set rate(double? val) => _rate = val;

  void incrementRate(double amount) => rate = rate + amount;

  bool hasRate() => _rate != null;

  // "sold" field.
  int? _sold;
  int get sold => _sold ?? 0;
  set sold(int? val) => _sold = val;

  void incrementSold(int amount) => sold = sold + amount;

  bool hasSold() => _sold != null;

  // "product_cover" field.
  String? _productCover;
  String get productCover => _productCover ?? '';
  set productCover(String? val) => _productCover = val;

  bool hasProductCover() => _productCover != null;

  // "product_images" field.
  List<String>? _productImages;
  List<String> get productImages => _productImages ?? const [];
  set productImages(List<String>? val) => _productImages = val;

  void updateProductImages(Function(List<String>) updateFn) {
    updateFn(_productImages ??= []);
  }

  bool hasProductImages() => _productImages != null;

  // "sizes" field.
  List<String>? _sizes;
  List<String> get sizes => _sizes ?? const [];
  set sizes(List<String>? val) => _sizes = val;

  void updateSizes(Function(List<String>) updateFn) {
    updateFn(_sizes ??= []);
  }

  bool hasSizes() => _sizes != null;

  // "colors" field.
  List<String>? _colors;
  List<String> get colors => _colors ?? const [];
  set colors(List<String>? val) => _colors = val;

  void updateColors(Function(List<String>) updateFn) {
    updateFn(_colors ??= []);
  }

  bool hasColors() => _colors != null;

  // "number_of_reviews" field.
  int? _numberOfReviews;
  int get numberOfReviews => _numberOfReviews ?? 0;
  set numberOfReviews(int? val) => _numberOfReviews = val;

  void incrementNumberOfReviews(int amount) =>
      numberOfReviews = numberOfReviews + amount;

  bool hasNumberOfReviews() => _numberOfReviews != null;

  static ProductStruct fromMap(Map<String, dynamic> data) => ProductStruct(
        name: data['name'] as String?,
        description: data['description'] as String?,
        price: castToType<double>(data['price']),
        discounted: data['discounted'] as bool?,
        discountAmount: castToType<double>(data['discount_amount']),
        rate: castToType<double>(data['rate']),
        sold: castToType<int>(data['sold']),
        productCover: data['product_cover'] as String?,
        productImages: getDataList(data['product_images']),
        sizes: getDataList(data['sizes']),
        colors: getDataList(data['colors']),
        numberOfReviews: castToType<int>(data['number_of_reviews']),
      );

  static ProductStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProductStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'description': _description,
        'price': _price,
        'discounted': _discounted,
        'discount_amount': _discountAmount,
        'rate': _rate,
        'sold': _sold,
        'product_cover': _productCover,
        'product_images': _productImages,
        'sizes': _sizes,
        'colors': _colors,
        'number_of_reviews': _numberOfReviews,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'discounted': serializeParam(
          _discounted,
          ParamType.bool,
        ),
        'discount_amount': serializeParam(
          _discountAmount,
          ParamType.double,
        ),
        'rate': serializeParam(
          _rate,
          ParamType.double,
        ),
        'sold': serializeParam(
          _sold,
          ParamType.int,
        ),
        'product_cover': serializeParam(
          _productCover,
          ParamType.String,
        ),
        'product_images': serializeParam(
          _productImages,
          ParamType.String,
          isList: true,
        ),
        'sizes': serializeParam(
          _sizes,
          ParamType.String,
          isList: true,
        ),
        'colors': serializeParam(
          _colors,
          ParamType.String,
          isList: true,
        ),
        'number_of_reviews': serializeParam(
          _numberOfReviews,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        discounted: deserializeParam(
          data['discounted'],
          ParamType.bool,
          false,
        ),
        discountAmount: deserializeParam(
          data['discount_amount'],
          ParamType.double,
          false,
        ),
        rate: deserializeParam(
          data['rate'],
          ParamType.double,
          false,
        ),
        sold: deserializeParam(
          data['sold'],
          ParamType.int,
          false,
        ),
        productCover: deserializeParam(
          data['product_cover'],
          ParamType.String,
          false,
        ),
        productImages: deserializeParam<String>(
          data['product_images'],
          ParamType.String,
          true,
        ),
        sizes: deserializeParam<String>(
          data['sizes'],
          ParamType.String,
          true,
        ),
        colors: deserializeParam<String>(
          data['colors'],
          ParamType.String,
          true,
        ),
        numberOfReviews: deserializeParam(
          data['number_of_reviews'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductStruct &&
        name == other.name &&
        description == other.description &&
        price == other.price &&
        discounted == other.discounted &&
        discountAmount == other.discountAmount &&
        rate == other.rate &&
        sold == other.sold &&
        productCover == other.productCover &&
        listEquality.equals(productImages, other.productImages) &&
        listEquality.equals(sizes, other.sizes) &&
        listEquality.equals(colors, other.colors) &&
        numberOfReviews == other.numberOfReviews;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        description,
        price,
        discounted,
        discountAmount,
        rate,
        sold,
        productCover,
        productImages,
        sizes,
        colors,
        numberOfReviews
      ]);
}

ProductStruct createProductStruct({
  String? name,
  String? description,
  double? price,
  bool? discounted,
  double? discountAmount,
  double? rate,
  int? sold,
  String? productCover,
  int? numberOfReviews,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductStruct(
      name: name,
      description: description,
      price: price,
      discounted: discounted,
      discountAmount: discountAmount,
      rate: rate,
      sold: sold,
      productCover: productCover,
      numberOfReviews: numberOfReviews,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductStruct? updateProductStruct(
  ProductStruct? product, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    product
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductStructData(
  Map<String, dynamic> firestoreData,
  ProductStruct? product,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (product == null) {
    return;
  }
  if (product.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && product.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productData = getProductFirestoreData(product, forFieldValue);
  final nestedData = productData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = product.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductFirestoreData(
  ProductStruct? product, [
  bool forFieldValue = false,
]) {
  if (product == null) {
    return {};
  }
  final firestoreData = mapToFirestore(product.toMap());

  // Add any Firestore field values
  product.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductListFirestoreData(
  List<ProductStruct>? products,
) =>
    products?.map((e) => getProductFirestoreData(e, true)).toList() ?? [];
