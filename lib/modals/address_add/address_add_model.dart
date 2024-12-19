import '/backend/backend.dart';
import '/components/chech_box_icon/chech_box_icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'address_add_widget.dart' show AddressAddWidget;
import 'package:flutter/material.dart';

class AddressAddModel extends FlutterFlowModel<AddressAddWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  // Model for ChechBoxIcon component.
  late ChechBoxIconModel chechBoxIconModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ShippingAddressesRecord? addressCreated;

  @override
  void initState(BuildContext context) {
    chechBoxIconModel = createModel(context, () => ChechBoxIconModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    chechBoxIconModel.dispose();
  }
}
