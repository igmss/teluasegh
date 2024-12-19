import '/components/choose_shipping_item/choose_shipping_item_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shipping_methods_widget.dart' show ShippingMethodsWidget;
import 'package:flutter/material.dart';

class ShippingMethodsModel extends FlutterFlowModel<ShippingMethodsWidget> {
  ///  Local state fields for this page.

  String shippingMethod = '';

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for ChooseShippingItem component.
  late ChooseShippingItemModel chooseShippingItemModel1;
  // Model for ChooseShippingItem component.
  late ChooseShippingItemModel chooseShippingItemModel2;
  // Model for ChooseShippingItem component.
  late ChooseShippingItemModel chooseShippingItemModel3;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    chooseShippingItemModel1 =
        createModel(context, () => ChooseShippingItemModel());
    chooseShippingItemModel2 =
        createModel(context, () => ChooseShippingItemModel());
    chooseShippingItemModel3 =
        createModel(context, () => ChooseShippingItemModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    chooseShippingItemModel1.dispose();
    chooseShippingItemModel2.dispose();
    chooseShippingItemModel3.dispose();
  }
}
