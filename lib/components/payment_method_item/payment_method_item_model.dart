import '/components/chech_box_icon/chech_box_icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_method_item_widget.dart' show PaymentMethodItemWidget;
import 'package:flutter/material.dart';

class PaymentMethodItemModel extends FlutterFlowModel<PaymentMethodItemWidget> {
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
