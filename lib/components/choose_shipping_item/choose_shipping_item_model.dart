import '/components/chech_box_icon/chech_box_icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'choose_shipping_item_widget.dart' show ChooseShippingItemWidget;
import 'package:flutter/material.dart';

class ChooseShippingItemModel
    extends FlutterFlowModel<ChooseShippingItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ChechBoxIcon component.
  late ChechBoxIconModel chechBoxIconModel;

  @override
  void initState(BuildContext context) {
    chechBoxIconModel = createModel(context, () => ChechBoxIconModel());
  }

  @override
  void dispose() {
    chechBoxIconModel.dispose();
  }
}
