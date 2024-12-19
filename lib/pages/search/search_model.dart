import '/backend/backend.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  Local state fields for this page.

  List<ProductRecord> searchResult = [];
  void addToSearchResult(ProductRecord item) => searchResult.add(item);
  void removeFromSearchResult(ProductRecord item) => searchResult.remove(item);
  void removeAtIndexFromSearchResult(int index) => searchResult.removeAt(index);
  void insertAtIndexInSearchResult(int index, ProductRecord item) =>
      searchResult.insert(index, item);
  void updateSearchResultAtIndex(int index, Function(ProductRecord) updateFn) =>
      searchResult[index] = updateFn(searchResult[index]);

  String category = 'All';

  double priceBiggerThan = 0.0;

  double rateBiggerThan = 0.0;

  bool showFilter = false;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for tf_search widget.
  FocusNode? tfSearchFocusNode;
  TextEditingController? tfSearchTextController;
  String? Function(BuildContext, String?)? tfSearchTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for priceBigger widget.
  double? priceBiggerValue1;
  // State field(s) for priceBigger widget.
  double? priceBiggerValue2;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    tfSearchFocusNode?.dispose();
    tfSearchTextController?.dispose();
  }
}
