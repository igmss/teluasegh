import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'special_offers_widget.dart' show SpecialOffersWidget;
import 'package:flutter/material.dart';

class SpecialOffersModel extends FlutterFlowModel<SpecialOffersWidget> {
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
