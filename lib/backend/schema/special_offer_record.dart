import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpecialOfferRecord extends FirestoreRecord {
  SpecialOfferRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('specialOffer');

  static Stream<SpecialOfferRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpecialOfferRecord.fromSnapshot(s));

  static Future<SpecialOfferRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SpecialOfferRecord.fromSnapshot(s));

  static SpecialOfferRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SpecialOfferRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpecialOfferRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpecialOfferRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpecialOfferRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpecialOfferRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpecialOfferRecordData({
  String? title,
  String? description,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpecialOfferRecordDocumentEquality
    implements Equality<SpecialOfferRecord> {
  const SpecialOfferRecordDocumentEquality();

  @override
  bool equals(SpecialOfferRecord? e1, SpecialOfferRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image;
  }

  @override
  int hash(SpecialOfferRecord? e) =>
      const ListEquality().hash([e?.title, e?.description, e?.image]);

  @override
  bool isValidKey(Object? o) => o is SpecialOfferRecord;
}
