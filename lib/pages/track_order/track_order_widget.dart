import '/backend/backend.dart';
import '/components/empty_widget.dart';
import '/components/header/header_widget.dart';
import '/components/order_ongoing_item/order_ongoing_item_widget.dart';
import '/components/order_status_details/order_status_details_widget.dart';
import '/components/track_show/track_show_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'track_order_model.dart';
export 'track_order_model.dart';

class TrackOrderWidget extends StatefulWidget {
  const TrackOrderWidget({
    super.key,
    required this.order,
  });

  final OrderRecord? order;

  @override
  State<TrackOrderWidget> createState() => _TrackOrderWidgetState();
}

class _TrackOrderWidgetState extends State<TrackOrderWidget> {
  late TrackOrderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackOrderModel());
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
                    wrapWithModel(
                      model: _model.headerModel,
                      updateCallback: () => safeSetState(() {}),
                      child: HeaderWidget(
                        title: FFLocalizations.of(context).getText(
                          '0fdxovbj' /* Track Order */,
                        ),
                        showBackButton: true,
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'E-Receipt',
                                      queryParameters: {
                                        'order': serializeParam(
                                          widget.order,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'order': widget.order,
                                      },
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 16.0, 0.0),
                                                child: Text(
                                                  'Order #${widget.order?.reference.id}',
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 120.0,
                                        decoration: const BoxDecoration(),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Builder(
                                                builder: (context) {
                                                  final product = widget
                                                          .order?.products
                                                          .toList() ??
                                                      [];

                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: product.length,
                                                    itemBuilder: (context,
                                                        productIndex) {
                                                      final productItem =
                                                          product[productIndex];
                                                      return Container(
                                                        width: 300.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: FutureBuilder<
                                                            ProductRecord>(
                                                          future: ProductRecord
                                                              .getDocumentOnce(
                                                                  productItem
                                                                      .productRef!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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

                                                            final orderOngoingItemProductRecord =
                                                                snapshot.data!;

                                                            return OrderOngoingItemWidget(
                                                              key: Key(
                                                                  'Keybb8_${productIndex}_of_${product.length}'),
                                                              product:
                                                                  orderOngoingItemProductRecord,
                                                              color: productItem
                                                                  .color,
                                                              size: productItem
                                                                  .size,
                                                              price: productItem
                                                                  .price,
                                                              qty: productItem
                                                                  .count,
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  formatNumber(
                                                    widget
                                                        .order!.finalAmountPaid,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType:
                                                        DecimalType.automatic,
                                                    currency: '\$',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'iutxeqb9' /*  |  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  dateTimeFormat(
                                                    "yMMMd",
                                                    widget.order!.date!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                widget.order?.status,
                                                'status',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  context.pushNamed(
                                                    'E-Receipt',
                                                    queryParameters: {
                                                      'order': serializeParam(
                                                        widget.order,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'order': widget.order,
                                                    },
                                                  );
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'dg29me9q' /* E-Receipt */,
                                                ),
                                                options: FFButtonOptions(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 8.0, 10.0, 8.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 0.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        height: 24.0,
                                        thickness: 1.0,
                                        indent: 20.0,
                                        endIndent: 20.0,
                                        color: FlutterFlowTheme.of(context)
                                            .grayTextMiddle,
                                      ),
                                    ].divide(const SizedBox(height: 16.0)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(24.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                wrapWithModel(
                                                  model: _model.trackShowModel1,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: TrackShowWidget(
                                                    titleIcon: Icon(
                                                      FFIcons
                                                          .kcategoryShippingRegular,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 36.0,
                                                    ),
                                                    color:
                                                        valueOrDefault<Color>(
                                                      widget.order?.status ==
                                                              'Created'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .grayTextMiddle,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .grayTextMiddle,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      StyledDivider(
                                                        thickness: 1.0,
                                                        indent: 8.0,
                                                        endIndent: 8.0,
                                                        color: valueOrDefault<
                                                            Color>(
                                                          widget.order
                                                                      ?.status ==
                                                                  'Created'
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .grayTextMiddle,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayTextMiddle,
                                                        ),
                                                        lineStyle:
                                                            DividerLineStyle
                                                                .dashdotted,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model.trackShowModel2,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: TrackShowWidget(
                                                    titleIcon: Icon(
                                                      FFIcons
                                                          .kcategoryShippingExpress,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 36.0,
                                                    ),
                                                    color:
                                                        valueOrDefault<Color>(
                                                      widget.order?.status ==
                                                              'Paid'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .grayTextMiddle,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .grayTextMiddle,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      StyledDivider(
                                                        thickness: 1.0,
                                                        indent: 8.0,
                                                        endIndent: 8.0,
                                                        color: valueOrDefault<
                                                            Color>(
                                                          widget.order
                                                                      ?.status ==
                                                                  'Paid'
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .grayTextMiddle,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayTextMiddle,
                                                        ),
                                                        lineStyle:
                                                            DividerLineStyle
                                                                .dashdotted,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model.trackShowModel3,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: TrackShowWidget(
                                                    titleIcon: Icon(
                                                      FFIcons.kcategoryReceived,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .pageViewDots,
                                                      size: 36.0,
                                                    ),
                                                    color:
                                                        valueOrDefault<Color>(
                                                      widget.order?.status ==
                                                              'Shipping'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .grayTextMiddle,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .grayTextMiddle,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      StyledDivider(
                                                        thickness: 1.0,
                                                        indent: 8.0,
                                                        endIndent: 8.0,
                                                        color: valueOrDefault<
                                                            Color>(
                                                          widget.order
                                                                      ?.status ==
                                                                  'Shipping'
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .grayTextMiddle,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayTextMiddle,
                                                        ),
                                                        lineStyle:
                                                            DividerLineStyle
                                                                .dashdotted,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model.trackShowModel4,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: TrackShowWidget(
                                                    titleIcon: Icon(
                                                      FFIcons.kcategoryBoxOpen,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .pageViewDots,
                                                      size: 36.0,
                                                    ),
                                                    color:
                                                        valueOrDefault<Color>(
                                                      widget.order?.status ==
                                                              'Completed'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .grayTextMiddle,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .grayTextMiddle,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'vd90fj5x' /* Packet In Delivery */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            height: 24.0,
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .pageViewDots,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'nj6cdd5z' /* Order Status Details */,
                                                    ),
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final timeline = widget.order
                                                          ?.shippingTimeline
                                                          .toList() ??
                                                      [];
                                                  if (timeline.isEmpty) {
                                                    return EmptyWidget(
                                                      body: 'No timeline.',
                                                      customAction: () async {},
                                                    );
                                                  }

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: timeline.length,
                                                    separatorBuilder: (_, __) =>
                                                        const SizedBox(height: 16.0),
                                                    itemBuilder: (context,
                                                        timelineIndex) {
                                                      final timelineItem =
                                                          timeline[
                                                              timelineIndex];
                                                      return OrderStatusDetailsWidget(
                                                        key: Key(
                                                            'Keyq1e_${timelineIndex}_of_${timeline.length}'),
                                                        orderStatus:
                                                            timelineItem
                                                                .description,
                                                        address: timelineItem
                                                            .currentAddressOfPackage,
                                                        time: timelineItem.date,
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
