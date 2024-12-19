import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wish_l_ist_widget.dart' show WishLIstWidget;
import 'package:flutter/material.dart';

class WishLIstModel extends FlutterFlowModel<WishLIstWidget> {
  ///  State fields for stateful widgets in this page.

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
