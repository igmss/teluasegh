import '/backend/backend.dart';
import '/components/empty_widget.dart';
import '/components/header/header_widget.dart';
import '/components/product_search_item/product_search_item_widget.dart';
import '/components/review/review_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'reviews_model.dart';
export 'reviews_model.dart';

class ReviewsWidget extends StatefulWidget {
  const ReviewsWidget({
    super.key,
    required this.product,
  });

  final ProductRecord? product;

  @override
  State<ReviewsWidget> createState() => _ReviewsWidgetState();
}

class _ReviewsWidgetState extends State<ReviewsWidget> {
  late ReviewsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              wrapWithModel(
                model: _model.headerModel,
                updateCallback: () => safeSetState(() {}),
                child: HeaderWidget(
                  title: '${formatNumber(
                    widget.product?.productInformation.rate,
                    formatType: FormatType.custom,
                    format: '#.#',
                    locale: '',
                  )} ( ${formatNumber(
                    widget.product?.productInformation.numberOfReviews,
                    formatType: FormatType.compact,
                  )} review)',
                  showBackButton: true,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.productSearchItemModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ProductSearchItemWidget(
                        name: valueOrDefault<String>(
                          widget.product?.productInformation.name,
                          'Name',
                        ),
                        category: widget.product!.category,
                        price: widget.product!.productInformation.price,
                        descriptions:
                            widget.product!.productInformation.description,
                        quantity: widget.product!.quantity,
                        rate: widget.product!.productInformation.rate,
                        cover: widget.product!.productInformation.productCover,
                        productRef: widget.product!.reference,
                      ),
                    ),
                    Expanded(
                      child: PagedListView<DocumentSnapshot<Object?>?,
                          ReviewRecord>.separated(
                        pagingController: _model.setListViewController(
                          ReviewRecord.collection.where(
                            'product_ref',
                            isEqualTo: widget.product?.reference,
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          24.0,
                          0,
                          24.0,
                        ),
                        shrinkWrap: true,
                        reverse: false,
                        scrollDirection: Axis.vertical,
                        separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                        builderDelegate:
                            PagedChildBuilderDelegate<ReviewRecord>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 44.0,
                              height: 44.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                          // Customize what your widget looks like when it's loading another page.
                          newPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 44.0,
                              height: 44.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                          noItemsFoundIndicatorBuilder: (_) => EmptyWidget(
                            body: 'This product has no review.',
                            customAction: () async {},
                          ),
                          itemBuilder: (context, _, listViewIndex) {
                            final listViewReviewRecord = _model
                                .listViewPagingController!
                                .itemList![listViewIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: ReviewWidget(
                                key: Key(
                                    'Keyoo4_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                date: listViewReviewRecord
                                    .reviewInformation.date!,
                                userAvatar: listViewReviewRecord
                                    .reviewInformation.user.avatar,
                                userName: listViewReviewRecord
                                    .reviewInformation.user.name,
                                reviewNumber: listViewReviewRecord
                                    .reviewInformation.number,
                                reviewFeedback: listViewReviewRecord
                                    .reviewInformation.feedback,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
