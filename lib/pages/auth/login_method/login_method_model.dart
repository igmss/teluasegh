import '/components/divider_text/divider_text_widget.dart';
import '/components/signinwith_google/signinwith_google_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_method_widget.dart' show LoginMethodWidget;
import 'package:flutter/material.dart';

class LoginMethodModel extends FlutterFlowModel<LoginMethodWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SigninwithGoogle component.
  late SigninwithGoogleModel signinwithGoogleModel1;
  // Model for SigninwithGoogle component.
  late SigninwithGoogleModel signinwithGoogleModel2;
  // Model for DividerText.
  late DividerTextModel dividerTextModel;

  @override
  void initState(BuildContext context) {
    signinwithGoogleModel1 =
        createModel(context, () => SigninwithGoogleModel());
    signinwithGoogleModel2 =
        createModel(context, () => SigninwithGoogleModel());
    dividerTextModel = createModel(context, () => DividerTextModel());
  }

  @override
  void dispose() {
    signinwithGoogleModel1.dispose();
    signinwithGoogleModel2.dispose();
    dividerTextModel.dispose();
  }
}
