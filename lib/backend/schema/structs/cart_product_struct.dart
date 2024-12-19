// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CartProductStruct extends FFFirebaseStruct {
  CartProductStruct({
    DocumentReference? productRef,
    String? name,
    String? image,
    double? price,
    String? color,
    String? size,
    int? count,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productRef = productRef,
        _name = name,
        _image = image,
        _price = price,
        _color = color,
        _size = size,
        _count = count,
        super(firestoreUtilData);

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  set productRef(DocumentReference? val) => _productRef = val;

  bool hasProductRef() => _productRef != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  set color(String? val) => _color = val;

  bool hasColor() => _color != null;

  // "size" field.
  String? _size;
  String get size => _size ?? '';
  set size(String? val) => _size = val;

  bool hasSize() => _size != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  static CartProductStruct fromMap(Map<String, dynamic> data) =>
      CartProductStruct(
        productRef: data['product_ref'] as DocumentReference?,
        name: data['name'] as String?,
        image: data['image'] as String?,
        price: castToType<double>(data['price']),
        color: data['color'] as String?,
        size: data['size'] as String?,
        count: castToType<int>(data['count']),
      );

  static CartProductStruct? maybeFromMap(dynamic data) => data is Map
      ? CartProductStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'product_ref': _productRef,
        'name': _name,
        'image': _image,
        'price': _price,
        'color': _color,
        'size': _size,
        'count': _count,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product_ref': serializeParam(
          _productRef,
          ParamType.DocumentReference,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'color': serializeParam(
          _color,
          ParamType.String,
        ),
        'size': serializeParam(
          _size,
          ParamType.String,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
      }.withoutNulls;

  static CartProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartProductStruct(
        productRef: deserializeParam(
          data['product_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['product'],
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.String,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.String,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CartProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartProductStruct &&
        productRef == other.productRef &&
        name == other.name &&
        image == other.image &&
        price == other.price &&
        color == other.color &&
        size == other.size &&
        count == other.count;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([productRef, name, image, price, color, size, count]);
}

CartProductStruct createCartProductStruct({
  DocumentReference? productRef,
  String? name,
  String? image,
  double? price,
  String? color,
  String? size,
  int? count,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartProductStruct(
      productRef: productRef,
      name: name,
      image: image,
      price: price,
      color: color,
      size: size,
      count: count,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartProductStruct? updateCartProductStruct(
  CartProductStruct? cartProduct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartProduct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartProductStructData(
  Map<String, dynamic> firestoreData,
  CartProductStruct? cartProduct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartProduct == null) {
    return;
  }
  if (cartProduct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartProduct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartProductData =
      getCartProductFirestoreData(cartProduct, forFieldValue);
  final nestedData =
      cartProductData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cartProduct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartProductFirestoreData(
  CartProductStruct? cartProduct, [
  bool forFieldValue = false,
]) {
  if (cartProduct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartProduct.toMap());

  // Add any Firestore field values
  cartProduct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartProductListFirestoreData(
  List<CartProductStruct>? cartProducts,
) =>
    cartProducts?.map((e) => getCartProductFirestoreData(e, true)).toList() ??
    [];
