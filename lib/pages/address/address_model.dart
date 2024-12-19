import '/components/header/header_widget.dart';
import '/components/shipping_item_radio_b_tn/shipping_item_radio_b_tn_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'address_widget.dart' show AddressWidget;
import 'package:flutter/material.dart';

class AddressModel extends FlutterFlowModel<AddressWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Models for ShippingItemRadioBTn dynamic component.
  late FlutterFlowDynamicModels<ShippingItemRadioBTnModel>
      shippingItemRadioBTnModels;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    shippingItemRadioBTnModels =
        FlutterFlowDynamicModels(() => ShippingItemRadioBTnModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    shippingItemRadioBTnModels.dispose();
  }
}
