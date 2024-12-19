import '/components/header/header_widget.dart';
import '/components/payment_method_item/payment_method_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_methods_widget.dart' show PaymentMethodsWidget;
import 'package:flutter/material.dart';

class PaymentMethodsModel extends FlutterFlowModel<PaymentMethodsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for PaymentMethodItem component.
  late PaymentMethodItemModel paymentMethodItemModel1;
  // Model for PaymentMethodItem component.
  late PaymentMethodItemModel paymentMethodItemModel2;
  // Model for PaymentMethodItem component.
  late PaymentMethodItemModel paymentMethodItemModel3;
  // Model for PaymentMethodItem component.
  late PaymentMethodItemModel paymentMethodItemModel4;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    paymentMethodItemModel1 =
        createModel(context, () => PaymentMethodItemModel());
    paymentMethodItemModel2 =
        createModel(context, () => PaymentMethodItemModel());
    paymentMethodItemModel3 =
        createModel(context, () => PaymentMethodItemModel());
    paymentMethodItemModel4 =
        createModel(context, () => PaymentMethodItemModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    paymentMethodItemModel1.dispose();
    paymentMethodItemModel2.dispose();
    paymentMethodItemModel3.dispose();
    paymentMethodItemModel4.dispose();
  }
}
