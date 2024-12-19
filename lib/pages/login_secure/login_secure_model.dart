import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_secure_widget.dart' show LoginSecureWidget;
import 'package:flutter/material.dart';

class LoginSecureModel extends FlutterFlowModel<LoginSecureWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    headerModel.dispose();
    pinCodeController?.dispose();
  }
}
