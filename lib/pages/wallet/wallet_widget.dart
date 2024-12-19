import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_widget.dart';
import '/components/money_card_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/transaction_history_item/transaction_history_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'wallet_model.dart';
export 'wallet_model.dart';

class WalletWidget extends StatefulWidget {
  const WalletWidget({super.key});

  @override
  State<WalletWidget> createState() => _WalletWidgetState();
}

class _WalletWidgetState extends State<WalletWidget> {
  late WalletModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalletModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<WalletRecord>(
        stream: WalletRecord.getDocument(currentUserDocument!.wallet!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: EmptyWidget(
                customAction: () async {},
              ),
            );
          }

          final walletWalletRecord = snapshot.data!;

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
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'h22regvw' /* My E-Wallet */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        wrapWithModel(
                                          model: _model.moneyCardModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: MoneyCardWidget(
                                            displayName: currentUserDisplayName,
                                            cardNumber: '-',
                                            balance: walletWalletRecord.balance,
                                            showTopUp: true,
                                            expireDate: '-',
                                            cvv: '-',
                                            topUpAction: () async {
                                              context.pushNamed(
                                                'TopUp',
                                                queryParameters: {
                                                  'wallet': serializeParam(
                                                    walletWalletRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'wallet': walletWalletRecord,
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'Transactions',
                                                queryParameters: {
                                                  'walletRef': serializeParam(
                                                    walletWalletRecord
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'rc1yod64' /* Transaction History */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: const BoxDecoration(),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'wfy9x3xk' /* See all */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        FutureBuilder<List<TransactionRecord>>(
                                          future: queryTransactionRecordOnce(
                                            queryBuilder: (transactionRecord) =>
                                                transactionRecord
                                                    .where(
                                                      'user_ref',
                                                      isEqualTo:
                                                          currentUserReference,
                                                    )
                                                    .where(
                                                      'wallet_ref',
                                                      isEqualTo:
                                                          walletWalletRecord
                                                              .reference,
                                                    )
                                                    .orderBy('date',
                                                        descending: true),
                                            limit: 7,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 44.0,
                                                  height: 44.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<TransactionRecord>
                                                listViewTransactionRecordList =
                                                snapshot.data!;
                                            if (listViewTransactionRecordList
                                                .isEmpty) {
                                              return EmptyWidget(
                                                body: 'No transactions',
                                                customAction: () async {},
                                              );
                                            }

                                            return ListView.separated(
                                              padding: const EdgeInsets.fromLTRB(
                                                0,
                                                24.0,
                                                0,
                                                24.0,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewTransactionRecordList
                                                      .length,
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(height: 16.0),
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewTransactionRecord =
                                                    listViewTransactionRecordList[
                                                        listViewIndex];
                                                return TransactionHistoryItemWidget(
                                                  key: Key(
                                                      'Keyzva_${listViewIndex}_of_${listViewTransactionRecordList.length}'),
                                                  date:
                                                      listViewTransactionRecord
                                                          .date!,
                                                  amount:
                                                      listViewTransactionRecord
                                                          .amount,
                                                  isExpense:
                                                      listViewTransactionRecord
                                                          .isExpense,
                                                  isTopUp:
                                                      listViewTransactionRecord
                                                          .isATopUp,
                                                  isRefund:
                                                      listViewTransactionRecord
                                                          .isRefund,
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ].addToStart(const SizedBox(height: 24.0)),
                                    ),
                                  ),
                                ].addToEnd(const SizedBox(height: 100.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: wrapWithModel(
                          model: _model.navBarModel,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: NavBarWidget(
                            activePage: FFLocalizations.of(context).getText(
                              'iub39qmr' /* Wallet */,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
