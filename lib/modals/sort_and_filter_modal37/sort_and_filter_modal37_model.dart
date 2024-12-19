import '/components/item_button/item_button_widget.dart';
import '/components/rating_item_button/rating_item_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sort_and_filter_modal37_widget.dart' show SortAndFilterModal37Widget;
import 'package:flutter/material.dart';

class SortAndFilterModal37Model
    extends FlutterFlowModel<SortAndFilterModal37Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for ItemButton component.
  late ItemButtonModel itemButtonModel1;
  // Model for ItemButton component.
  late ItemButtonModel itemButtonModel2;
  // Model for ItemButton component.
  late ItemButtonModel itemButtonModel3;
  // Model for RatingItemButton component.
  late RatingItemButtonModel ratingItemButtonModel;

  @override
  void initState(BuildContext context) {
    itemButtonModel1 = createModel(context, () => ItemButtonModel());
    itemButtonModel2 = createModel(context, () => ItemButtonModel());
    itemButtonModel3 = createModel(context, () => ItemButtonModel());
    ratingItemButtonModel = createModel(context, () => RatingItemButtonModel());
  }

  @override
  void dispose() {
    itemButtonModel1.dispose();
    itemButtonModel2.dispose();
    itemButtonModel3.dispose();
    ratingItemButtonModel.dispose();
  }
}
