import '/components/colors_widget.dart';
import '/components/sizes_widget.dart';
import '/components/special_offer_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detail_widget.dart' show DetailWidget;
import 'package:flutter/material.dart';

class DetailModel extends FlutterFlowModel<DetailWidget> {
  ///  Local state fields for this page.

  bool liked = false;

  bool letUserGiveReview = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for SpecialOfferCard component.
  late SpecialOfferCardModel specialOfferCardModel;
  // Model for Sizes component.
  late SizesModel sizesModel;
  // Model for Colors component.
  late ColorsModel colorsModel;
  // State field(s) for CountController widget.
  int? countControllerValue;

  @override
  void initState(BuildContext context) {
    specialOfferCardModel = createModel(context, () => SpecialOfferCardModel());
    sizesModel = createModel(context, () => SizesModel());
    colorsModel = createModel(context, () => ColorsModel());
  }

  @override
  void dispose() {
    specialOfferCardModel.dispose();
    sizesModel.dispose();
    colorsModel.dispose();
  }
}
