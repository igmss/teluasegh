import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardsRecord extends FirestoreRecord {
  CardsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "card_number" field.
  String? _cardNumber;
  String get cardNumber => _cardNumber ?? '';
  bool hasCardNumber() => _cardNumber != null;

  // "expire" field.
  String? _expire;
  String get expire => _expire ?? '';
  bool hasExpire() => _expire != null;

  // "cvv" field.
  String? _cvv;
  String get cvv => _cvv ?? '';
  bool hasCvv() => _cvv != null;

  // "wallet_ref" field.
  DocumentReference? _walletRef;
  DocumentReference? get walletRef => _walletRef;
  bool hasWalletRef() => _walletRef != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _displayName = snapshotData['display_name'] as String?;
    _cardNumber = snapshotData['card_number'] as String?;
    _expire = snapshotData['expire'] as String?;
    _cvv = snapshotData['cvv'] as String?;
    _walletRef = snapshotData['wallet_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cards');

  static Stream<CardsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CardsRecord.fromSnapshot(s));

  static Future<CardsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CardsRecord.fromSnapshot(s));

  static CardsRecord fromSnapshot(DocumentSnapshot snapshot) => CardsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CardsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CardsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CardsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CardsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCardsRecordData({
  DocumentReference? userRef,
  String? displayName,
  String? cardNumber,
  String? expire,
  String? cvv,
  DocumentReference? walletRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'display_name': displayName,
      'card_number': cardNumber,
      'expire': expire,
      'cvv': cvv,
      'wallet_ref': walletRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CardsRecordDocumentEquality implements Equality<CardsRecord> {
  const CardsRecordDocumentEquality();

  @override
  bool equals(CardsRecord? e1, CardsRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.displayName == e2?.displayName &&
        e1?.cardNumber == e2?.cardNumber &&
        e1?.expire == e2?.expire &&
        e1?.cvv == e2?.cvv &&
        e1?.walletRef == e2?.walletRef;
  }

  @override
  int hash(CardsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.displayName,
        e?.cardNumber,
        e?.expire,
        e?.cvv,
        e?.walletRef
      ]);

  @override
  bool isValidKey(Object? o) => o is CardsRecord;
}
