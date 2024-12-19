import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'biometric_set_widget.dart' show BiometricSetWidget;
import 'package:flutter/material.dart';

class BiometricSetModel extends FlutterFlowModel<BiometricSetWidget> {
  ///  State fields for stateful widgets in this page.

  bool biometricEnabled = false;
  // Model for Header component.
  late HeaderModel headerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
  }
}
