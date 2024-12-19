import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "dateOfBirth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "Gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "pinCodeEnabled" field.
  bool? _pinCodeEnabled;
  bool get pinCodeEnabled => _pinCodeEnabled ?? false;
  bool hasPinCodeEnabled() => _pinCodeEnabled != null;

  // "biometricEnabled" field.
  bool? _biometricEnabled;
  bool get biometricEnabled => _biometricEnabled ?? false;
  bool hasBiometricEnabled() => _biometricEnabled != null;

  // "onboardingFinished" field.
  bool? _onboardingFinished;
  bool get onboardingFinished => _onboardingFinished ?? false;
  bool hasOnboardingFinished() => _onboardingFinished != null;

  // "pin_code" field.
  String? _pinCode;
  String get pinCode => _pinCode ?? '';
  bool hasPinCode() => _pinCode != null;

  // "products_liked" field.
  List<DocumentReference>? _productsLiked;
  List<DocumentReference> get productsLiked => _productsLiked ?? const [];
  bool hasProductsLiked() => _productsLiked != null;

  // "isSupportAgent" field.
  bool? _isSupportAgent;
  bool get isSupportAgent => _isSupportAgent ?? false;
  bool hasIsSupportAgent() => _isSupportAgent != null;

  // "wallet" field.
  DocumentReference? _wallet;
  DocumentReference? get wallet => _wallet;
  bool hasWallet() => _wallet != null;

  // "default_shipping_address" field.
  DocumentReference? _defaultShippingAddress;
  DocumentReference? get defaultShippingAddress => _defaultShippingAddress;
  bool hasDefaultShippingAddress() => _defaultShippingAddress != null;

  // "promo_codes" field.
  List<DocumentReference>? _promoCodes;
  List<DocumentReference> get promoCodes => _promoCodes ?? const [];
  bool hasPromoCodes() => _promoCodes != null;

  // "cart_ref" field.
  DocumentReference? _cartRef;
  DocumentReference? get cartRef => _cartRef;
  bool hasCartRef() => _cartRef != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userName = snapshotData['userName'] as String?;
    _dateOfBirth = snapshotData['dateOfBirth'] as DateTime?;
    _gender = snapshotData['Gender'] as String?;
    _pinCodeEnabled = snapshotData['pinCodeEnabled'] as bool?;
    _biometricEnabled = snapshotData['biometricEnabled'] as bool?;
    _onboardingFinished = snapshotData['onboardingFinished'] as bool?;
    _pinCode = snapshotData['pin_code'] as String?;
    _productsLiked = getDataList(snapshotData['products_liked']);
    _isSupportAgent = snapshotData['isSupportAgent'] as bool?;
    _wallet = snapshotData['wallet'] as DocumentReference?;
    _defaultShippingAddress =
        snapshotData['default_shipping_address'] as DocumentReference?;
    _promoCodes = getDataList(snapshotData['promo_codes']);
    _cartRef = snapshotData['cart_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? userName,
  DateTime? dateOfBirth,
  String? gender,
  bool? pinCodeEnabled,
  bool? biometricEnabled,
  bool? onboardingFinished,
  String? pinCode,
  bool? isSupportAgent,
  DocumentReference? wallet,
  DocumentReference? defaultShippingAddress,
  DocumentReference? cartRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'userName': userName,
      'dateOfBirth': dateOfBirth,
      'Gender': gender,
      'pinCodeEnabled': pinCodeEnabled,
      'biometricEnabled': biometricEnabled,
      'onboardingFinished': onboardingFinished,
      'pin_code': pinCode,
      'isSupportAgent': isSupportAgent,
      'wallet': wallet,
      'default_shipping_address': defaultShippingAddress,
      'cart_ref': cartRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userName == e2?.userName &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.gender == e2?.gender &&
        e1?.pinCodeEnabled == e2?.pinCodeEnabled &&
        e1?.biometricEnabled == e2?.biometricEnabled &&
        e1?.onboardingFinished == e2?.onboardingFinished &&
        e1?.pinCode == e2?.pinCode &&
        listEquality.equals(e1?.productsLiked, e2?.productsLiked) &&
        e1?.isSupportAgent == e2?.isSupportAgent &&
        e1?.wallet == e2?.wallet &&
        e1?.defaultShippingAddress == e2?.defaultShippingAddress &&
        listEquality.equals(e1?.promoCodes, e2?.promoCodes) &&
        e1?.cartRef == e2?.cartRef;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.userName,
        e?.dateOfBirth,
        e?.gender,
        e?.pinCodeEnabled,
        e?.biometricEnabled,
        e?.onboardingFinished,
        e?.pinCode,
        e?.productsLiked,
        e?.isSupportAgent,
        e?.wallet,
        e?.defaultShippingAddress,
        e?.promoCodes,
        e?.cartRef
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
