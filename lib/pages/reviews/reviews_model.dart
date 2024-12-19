import '/backend/backend.dart';
import '/components/header/header_widget.dart';
import '/components/product_search_item/product_search_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reviews_widget.dart' show ReviewsWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ReviewsModel extends FlutterFlowModel<ReviewsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for ProductSearchItem component.
  late ProductSearchItemModel productSearchItemModel;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ReviewRecord>? listViewPagingController;
  Query? listViewPagingQuery;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    productSearchItemModel =
        createModel(context, () => ProductSearchItemModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    productSearchItemModel.dispose();

    listViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, ReviewRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, ReviewRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ReviewRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryReviewRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 25,
          isStream: false,
        ),
      );
  }
}
