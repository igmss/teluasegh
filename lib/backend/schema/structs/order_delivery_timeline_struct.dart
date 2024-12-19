// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class OrderDeliveryTimelineStruct extends FFFirebaseStruct {
  OrderDeliveryTimelineStruct({
    DateTime? date,
    String? description,
    String? currentAddressOfPackage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _description = description,
        _currentAddressOfPackage = currentAddressOfPackage,
        super(firestoreUtilData);

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "CurrentAddressOfPackage" field.
  String? _currentAddressOfPackage;
  String get currentAddressOfPackage => _currentAddressOfPackage ?? '';
  set currentAddressOfPackage(String? val) => _currentAddressOfPackage = val;

  bool hasCurrentAddressOfPackage() => _currentAddressOfPackage != null;

  static OrderDeliveryTimelineStruct fromMap(Map<String, dynamic> data) =>
      OrderDeliveryTimelineStruct(
        date: data['date'] as DateTime?,
        description: data['description'] as String?,
        currentAddressOfPackage: data['CurrentAddressOfPackage'] as String?,
      );

  static OrderDeliveryTimelineStruct? maybeFromMap(dynamic data) => data is Map
      ? OrderDeliveryTimelineStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'description': _description,
        'CurrentAddressOfPackage': _currentAddressOfPackage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'CurrentAddressOfPackage': serializeParam(
          _currentAddressOfPackage,
          ParamType.String,
        ),
      }.withoutNulls;

  static OrderDeliveryTimelineStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      OrderDeliveryTimelineStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        currentAddressOfPackage: deserializeParam(
          data['CurrentAddressOfPackage'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OrderDeliveryTimelineStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderDeliveryTimelineStruct &&
        date == other.date &&
        description == other.description &&
        currentAddressOfPackage == other.currentAddressOfPackage;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([date, description, currentAddressOfPackage]);
}

OrderDeliveryTimelineStruct createOrderDeliveryTimelineStruct({
  DateTime? date,
  String? description,
  String? currentAddressOfPackage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderDeliveryTimelineStruct(
      date: date,
      description: description,
      currentAddressOfPackage: currentAddressOfPackage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrderDeliveryTimelineStruct? updateOrderDeliveryTimelineStruct(
  OrderDeliveryTimelineStruct? orderDeliveryTimeline, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    orderDeliveryTimeline
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrderDeliveryTimelineStructData(
  Map<String, dynamic> firestoreData,
  OrderDeliveryTimelineStruct? orderDeliveryTimeline,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orderDeliveryTimeline == null) {
    return;
  }
  if (orderDeliveryTimeline.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      orderDeliveryTimeline.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderDeliveryTimelineData = getOrderDeliveryTimelineFirestoreData(
      orderDeliveryTimeline, forFieldValue);
  final nestedData =
      orderDeliveryTimelineData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      orderDeliveryTimeline.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrderDeliveryTimelineFirestoreData(
  OrderDeliveryTimelineStruct? orderDeliveryTimeline, [
  bool forFieldValue = false,
]) {
  if (orderDeliveryTimeline == null) {
    return {};
  }
  final firestoreData = mapToFirestore(orderDeliveryTimeline.toMap());

  // Add any Firestore field values
  orderDeliveryTimeline.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderDeliveryTimelineListFirestoreData(
  List<OrderDeliveryTimelineStruct>? orderDeliveryTimelines,
) =>
    orderDeliveryTimelines
        ?.map((e) => getOrderDeliveryTimelineFirestoreData(e, true))
        .toList() ??
    [];
