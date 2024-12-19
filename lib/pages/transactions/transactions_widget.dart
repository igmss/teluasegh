import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_widget.dart';
import '/components/header/header_widget.dart';
import '/components/transaction_history_item/transaction_history_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'transactions_model.dart';
export 'transactions_model.dart';

class TransactionsWidget extends StatefulWidget {
  const TransactionsWidget({
    super.key,
    required this.walletRef,
  });

  final DocumentReference? walletRef;

  @override
  State<TransactionsWidget> createState() => _TransactionsWidgetState();
}

class _TransactionsWidgetState extends State<TransactionsWidget> {
  late TransactionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionsModel());
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
                  title: FFLocalizations.of(context).getText(
                    '8sx1aoam' /* Transaction History */,
                  ),
                  showBackButton: true,
                ),
              ),
              Expanded(
                child: PagedListView<DocumentSnapshot<Object?>?,
                    TransactionRecord>.separated(
                  pagingController: _model.setListViewController(
                    TransactionRecord.collection
                        .where(
                          'user_ref',
                          isEqualTo: currentUserReference,
                        )
                        .where(
                          'wallet_ref',
                          isEqualTo: widget.walletRef,
                        )
                        .orderBy('date', descending: true),
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
                  builderDelegate: PagedChildBuilderDelegate<TransactionRecord>(
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
                      title: 'No Transaction',
                      customAction: () async {},
                    ),
                    itemBuilder: (context, _, listViewIndex) {
                      final listViewTransactionRecord = _model
                          .listViewPagingController!.itemList![listViewIndex];
                      return Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: TransactionHistoryItemWidget(
                          key: Key(
                              'Keys9j_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                          amount: listViewTransactionRecord.amount,
                          isExpense: listViewTransactionRecord.isExpense,
                          isTopUp: listViewTransactionRecord.isATopUp,
                          isRefund: listViewTransactionRecord.isRefund,
                          date: listViewTransactionRecord.date!,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
