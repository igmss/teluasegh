import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionRecord extends FirestoreRecord {
  TransactionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "wallet_ref" field.
  DocumentReference? _walletRef;
  DocumentReference? get walletRef => _walletRef;
  bool hasWalletRef() => _walletRef != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "isATopUp" field.
  bool? _isATopUp;
  bool get isATopUp => _isATopUp ?? false;
  bool hasIsATopUp() => _isATopUp != null;

  // "isExpense" field.
  bool? _isExpense;
  bool get isExpense => _isExpense ?? false;
  bool hasIsExpense() => _isExpense != null;

  // "isRefund" field.
  bool? _isRefund;
  bool get isRefund => _isRefund ?? false;
  bool hasIsRefund() => _isRefund != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _walletRef = snapshotData['wallet_ref'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _amount = castToType<double>(snapshotData['amount']);
    _isATopUp = snapshotData['isATopUp'] as bool?;
    _isExpense = snapshotData['isExpense'] as bool?;
    _isRefund = snapshotData['isRefund'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transaction');

  static Stream<TransactionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionRecord.fromSnapshot(s));

  static Future<TransactionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionRecord.fromSnapshot(s));

  static TransactionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionRecordData({
  DocumentReference? userRef,
  DocumentReference? walletRef,
  DateTime? date,
  double? amount,
  bool? isATopUp,
  bool? isExpense,
  bool? isRefund,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'wallet_ref': walletRef,
      'date': date,
      'amount': amount,
      'isATopUp': isATopUp,
      'isExpense': isExpense,
      'isRefund': isRefund,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionRecordDocumentEquality implements Equality<TransactionRecord> {
  const TransactionRecordDocumentEquality();

  @override
  bool equals(TransactionRecord? e1, TransactionRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.walletRef == e2?.walletRef &&
        e1?.date == e2?.date &&
        e1?.amount == e2?.amount &&
        e1?.isATopUp == e2?.isATopUp &&
        e1?.isExpense == e2?.isExpense &&
        e1?.isRefund == e2?.isRefund;
  }

  @override
  int hash(TransactionRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.walletRef,
        e?.date,
        e?.amount,
        e?.isATopUp,
        e?.isExpense,
        e?.isRefund
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionRecord;
}
