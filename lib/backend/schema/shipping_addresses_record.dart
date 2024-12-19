import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShippingAddressesRecord extends FirestoreRecord {
  ShippingAddressesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "zip_code" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  bool hasZipCode() => _zipCode != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "location_string" field.
  String? _locationString;
  String get locationString => _locationString ?? '';
  bool hasLocationString() => _locationString != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "addressName" field.
  String? _addressName;
  String get addressName => _addressName ?? '';
  bool hasAddressName() => _addressName != null;

  // "isDefaultAddress" field.
  bool? _isDefaultAddress;
  bool get isDefaultAddress => _isDefaultAddress ?? false;
  bool hasIsDefaultAddress() => _isDefaultAddress != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  void _initializeFields() {
    _address = snapshotData['address'] as String?;
    _country = snapshotData['country'] as String?;
    _zipCode = snapshotData['zip_code'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _locationString = snapshotData['location_string'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _addressName = snapshotData['addressName'] as String?;
    _isDefaultAddress = snapshotData['isDefaultAddress'] as bool?;
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shippingAddresses');

  static Stream<ShippingAddressesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShippingAddressesRecord.fromSnapshot(s));

  static Future<ShippingAddressesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ShippingAddressesRecord.fromSnapshot(s));

  static ShippingAddressesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ShippingAddressesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShippingAddressesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShippingAddressesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShippingAddressesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShippingAddressesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShippingAddressesRecordData({
  String? address,
  String? country,
  String? zipCode,
  LatLng? location,
  String? locationString,
  DocumentReference? userRef,
  String? addressName,
  bool? isDefaultAddress,
  String? city,
  String? state,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'address': address,
      'country': country,
      'zip_code': zipCode,
      'location': location,
      'location_string': locationString,
      'user_ref': userRef,
      'addressName': addressName,
      'isDefaultAddress': isDefaultAddress,
      'city': city,
      'state': state,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShippingAddressesRecordDocumentEquality
    implements Equality<ShippingAddressesRecord> {
  const ShippingAddressesRecordDocumentEquality();

  @override
  bool equals(ShippingAddressesRecord? e1, ShippingAddressesRecord? e2) {
    return e1?.address == e2?.address &&
        e1?.country == e2?.country &&
        e1?.zipCode == e2?.zipCode &&
        e1?.location == e2?.location &&
        e1?.locationString == e2?.locationString &&
        e1?.userRef == e2?.userRef &&
        e1?.addressName == e2?.addressName &&
        e1?.isDefaultAddress == e2?.isDefaultAddress &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state;
  }

  @override
  int hash(ShippingAddressesRecord? e) => const ListEquality().hash([
        e?.address,
        e?.country,
        e?.zipCode,
        e?.location,
        e?.locationString,
        e?.userRef,
        e?.addressName,
        e?.isDefaultAddress,
        e?.city,
        e?.state
      ]);

  @override
  bool isValidKey(Object? o) => o is ShippingAddressesRecord;
}
