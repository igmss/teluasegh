import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SupportMesagesRecord extends FirestoreRecord {
  SupportMesagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "supportSendThis" field.
  bool? _supportSendThis;
  bool get supportSendThis => _supportSendThis ?? false;
  bool hasSupportSendThis() => _supportSendThis != null;

  // "sendDate" field.
  DateTime? _sendDate;
  DateTime? get sendDate => _sendDate;
  bool hasSendDate() => _sendDate != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "hasAttachment" field.
  bool? _hasAttachment;
  bool get hasAttachment => _hasAttachment ?? false;
  bool hasHasAttachment() => _hasAttachment != null;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _image = snapshotData['image'] as String?;
    _audio = snapshotData['audio'] as String?;
    _video = snapshotData['video'] as String?;
    _sender = snapshotData['sender'] as DocumentReference?;
    _supportSendThis = snapshotData['supportSendThis'] as bool?;
    _sendDate = snapshotData['sendDate'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _hasAttachment = snapshotData['hasAttachment'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('supportMesages');

  static Stream<SupportMesagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SupportMesagesRecord.fromSnapshot(s));

  static Future<SupportMesagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SupportMesagesRecord.fromSnapshot(s));

  static SupportMesagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SupportMesagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SupportMesagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SupportMesagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SupportMesagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SupportMesagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSupportMesagesRecordData({
  String? message,
  String? image,
  String? audio,
  String? video,
  DocumentReference? sender,
  bool? supportSendThis,
  DateTime? sendDate,
  DocumentReference? userRef,
  bool? hasAttachment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'image': image,
      'audio': audio,
      'video': video,
      'sender': sender,
      'supportSendThis': supportSendThis,
      'sendDate': sendDate,
      'user_ref': userRef,
      'hasAttachment': hasAttachment,
    }.withoutNulls,
  );

  return firestoreData;
}

class SupportMesagesRecordDocumentEquality
    implements Equality<SupportMesagesRecord> {
  const SupportMesagesRecordDocumentEquality();

  @override
  bool equals(SupportMesagesRecord? e1, SupportMesagesRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.image == e2?.image &&
        e1?.audio == e2?.audio &&
        e1?.video == e2?.video &&
        e1?.sender == e2?.sender &&
        e1?.supportSendThis == e2?.supportSendThis &&
        e1?.sendDate == e2?.sendDate &&
        e1?.userRef == e2?.userRef &&
        e1?.hasAttachment == e2?.hasAttachment;
  }

  @override
  int hash(SupportMesagesRecord? e) => const ListEquality().hash([
        e?.message,
        e?.image,
        e?.audio,
        e?.video,
        e?.sender,
        e?.supportSendThis,
        e?.sendDate,
        e?.userRef,
        e?.hasAttachment
      ]);

  @override
  bool isValidKey(Object? o) => o is SupportMesagesRecord;
}
