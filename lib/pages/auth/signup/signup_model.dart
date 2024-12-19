import '/components/divider_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'signup_widget.dart' show SignupWidget;
import 'package:flutter/material.dart';

class SignupModel extends FlutterFlowModel<SignupWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for email_tf widget.
  FocusNode? emailTfFocusNode;
  TextEditingController? emailTfTextController;
  String? Function(BuildContext, String?)? emailTfTextControllerValidator;
  String? _emailTfTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ysut8ogx' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for password_tf widget.
  FocusNode? passwordTfFocusNode;
  TextEditingController? passwordTfTextController;
  late bool passwordTfVisibility;
  String? Function(BuildContext, String?)? passwordTfTextControllerValidator;
  String? _passwordTfTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yha59gtw' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for repassword_tf widget.
  FocusNode? repasswordTfFocusNode;
  TextEditingController? repasswordTfTextController;
  late bool repasswordTfVisibility;
  String? Function(BuildContext, String?)? repasswordTfTextControllerValidator;
  String? _repasswordTfTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6nugwj54' /* Field is required */,
      );
    }

    return null;
  }

  // Model for Divider component.
  late DividerModel dividerModel;
  // Model for Header component.
  late HeaderModel headerModel;

  @override
  void initState(BuildContext context) {
    emailTfTextControllerValidator = _emailTfTextControllerValidator;
    passwordTfVisibility = false;
    passwordTfTextControllerValidator = _passwordTfTextControllerValidator;
    repasswordTfVisibility = false;
    repasswordTfTextControllerValidator = _repasswordTfTextControllerValidator;
    dividerModel = createModel(context, () => DividerModel());
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    emailTfFocusNode?.dispose();
    emailTfTextController?.dispose();

    passwordTfFocusNode?.dispose();
    passwordTfTextController?.dispose();

    repasswordTfFocusNode?.dispose();
    repasswordTfTextController?.dispose();

    dividerModel.dispose();
    headerModel.dispose();
  }
}
