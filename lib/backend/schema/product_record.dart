import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductRecord extends FirestoreRecord {
  ProductRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "product_information" field.
  ProductStruct? _productInformation;
  ProductStruct get productInformation =>
      _productInformation ?? ProductStruct();
  bool hasProductInformation() => _productInformation != null;

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "popular" field.
  bool? _popular;
  bool get popular => _popular ?? false;
  bool hasPopular() => _popular != null;

  // "special_offer" field.
  bool? _specialOffer;
  bool get specialOffer => _specialOffer ?? false;
  bool hasSpecialOffer() => _specialOffer != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "special_offer_ref" field.
  DocumentReference? _specialOfferRef;
  DocumentReference? get specialOfferRef => _specialOfferRef;
  bool hasSpecialOfferRef() => _specialOfferRef != null;

  // "users_liked" field.
  List<DocumentReference>? _usersLiked;
  List<DocumentReference> get usersLiked => _usersLiked ?? const [];
  bool hasUsersLiked() => _usersLiked != null;

  // "usersReviewed" field.
  List<DocumentReference>? _usersReviewed;
  List<DocumentReference> get usersReviewed => _usersReviewed ?? const [];
  bool hasUsersReviewed() => _usersReviewed != null;

  // "userBought" field.
  List<DocumentReference>? _userBought;
  List<DocumentReference> get userBought => _userBought ?? const [];
  bool hasUserBought() => _userBought != null;

  void _initializeFields() {
    _productInformation = snapshotData['product_information'] is ProductStruct
        ? snapshotData['product_information']
        : ProductStruct.maybeFromMap(snapshotData['product_information']);
    _productId = snapshotData['product_id'] as String?;
    _popular = snapshotData['popular'] as bool?;
    _specialOffer = snapshotData['special_offer'] as bool?;
    _category = snapshotData['category'] as String?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _specialOfferRef = snapshotData['special_offer_ref'] as DocumentReference?;
    _usersLiked = getDataList(snapshotData['users_liked']);
    _usersReviewed = getDataList(snapshotData['usersReviewed']);
    _userBought = getDataList(snapshotData['userBought']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product');

  static Stream<ProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductRecord.fromSnapshot(s));

  static Future<ProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductRecord.fromSnapshot(s));

  static ProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductRecordData({
  ProductStruct? productInformation,
  String? productId,
  bool? popular,
  bool? specialOffer,
  String? category,
  int? quantity,
  DocumentReference? specialOfferRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product_information': ProductStruct().toMap(),
      'product_id': productId,
      'popular': popular,
      'special_offer': specialOffer,
      'category': category,
      'quantity': quantity,
      'special_offer_ref': specialOfferRef,
    }.withoutNulls,
  );

  // Handle nested data for "product_information" field.
  addProductStructData(
      firestoreData, productInformation, 'product_information');

  return firestoreData;
}

class ProductRecordDocumentEquality implements Equality<ProductRecord> {
  const ProductRecordDocumentEquality();

  @override
  bool equals(ProductRecord? e1, ProductRecord? e2) {
    const listEquality = ListEquality();
    return e1?.productInformation == e2?.productInformation &&
        e1?.productId == e2?.productId &&
        e1?.popular == e2?.popular &&
        e1?.specialOffer == e2?.specialOffer &&
        e1?.category == e2?.category &&
        e1?.quantity == e2?.quantity &&
        e1?.specialOfferRef == e2?.specialOfferRef &&
        listEquality.equals(e1?.usersLiked, e2?.usersLiked) &&
        listEquality.equals(e1?.usersReviewed, e2?.usersReviewed) &&
        listEquality.equals(e1?.userBought, e2?.userBought);
  }

  @override
  int hash(ProductRecord? e) => const ListEquality().hash([
        e?.productInformation,
        e?.productId,
        e?.popular,
        e?.specialOffer,
        e?.category,
        e?.quantity,
        e?.specialOfferRef,
        e?.usersLiked,
        e?.usersReviewed,
        e?.userBought
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductRecord;
}
