import '/components/header/header_widget.dart';
import '/components/special_offer_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'products_widget.dart' show ProductsWidget;
import 'package:flutter/material.dart';

class ProductsModel extends FlutterFlowModel<ProductsWidget> {
  ///  Local state fields for this page.

  String categori = 'All';

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for SpecialOfferCard component.
  late SpecialOfferCardModel specialOfferCardModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    specialOfferCardModel = createModel(context, () => SpecialOfferCardModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    specialOfferCardModel.dispose();
  }
}
