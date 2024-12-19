import '/components/order_item/order_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'remove_from_card_confirm_widget.dart' show RemoveFromCardConfirmWidget;
import 'package:flutter/material.dart';

class RemoveFromCardConfirmModel
    extends FlutterFlowModel<RemoveFromCardConfirmWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for OrderItem component.
  late OrderItemModel orderItemModel;

  @override
  void initState(BuildContext context) {
    orderItemModel = createModel(context, () => OrderItemModel());
  }

  @override
  void dispose() {
    orderItemModel.dispose();
  }
}
