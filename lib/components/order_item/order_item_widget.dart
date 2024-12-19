import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modals/remove_from_card_confirm/remove_from_card_confirm_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'order_item_model.dart';
export 'order_item_model.dart';

class OrderItemWidget extends StatefulWidget {
  const OrderItemWidget({
    super.key,
    required this.product,
    this.orderDocument,
    this.cartDocument,
  });

  final CartProductStruct? product;
  final OrderRecord? orderDocument;
  final CartRecord? cartDocument;

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  late OrderItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                widget.product!.image,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            valueOrDefault<String>(
                              widget.product?.name,
                              'Name',
                            ),
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        if ((widget.orderDocument != null) ||
                            (widget.cartDocument != null))
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 10.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              FFIcons.kdeleteDefault,
                              color: FlutterFlowTheme.of(context).error,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                isDismissible: false,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: RemoveFromCardConfirmWidget(
                                      product: widget.product!,
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(
                                  () => _model.removeConfirm = value));

                              if (_model.removeConfirm!) {
                                if ((widget.orderDocument != null) &&
                                    (widget.cartDocument == null)) {
                                  await widget.orderDocument!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'products': FieldValue.arrayRemove([
                                          getCartProductFirestoreData(
                                            updateCartProductStruct(
                                              widget.product,
                                              clearUnsetFields: false,
                                            ),
                                            true,
                                          )
                                        ]),
                                      },
                                    ),
                                  });
                                } else if ((widget.orderDocument == null) &&
                                    (widget.cartDocument != null)) {
                                  await widget.cartDocument!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'products': FieldValue.arrayRemove([
                                          getCartProductFirestoreData(
                                            updateCartProductStruct(
                                              widget.product,
                                              clearUnsetFields: false,
                                            ),
                                            true,
                                          )
                                        ]),
                                      },
                                    ),
                                  });
                                }

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Removed!',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    duration: const Duration(milliseconds: 2000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                              }

                              safeSetState(() {});
                            },
                          ),
                      ],
                    ),
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (widget.product?.color != null &&
                              widget.product?.color != '')
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 16.0,
                                  height: 16.0,
                                  decoration: BoxDecoration(
                                    color: colorFromCssString(
                                      widget.product!.color,
                                      defaultColor: Colors.black,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'k5z1lp7b' /* Color */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          if (widget.product?.size != null &&
                              widget.product?.size != '')
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.product?.size,
                                      'size',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              formatNumber(
                                widget.product!.price * widget.product!.count,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.automatic,
                                currency: '\$',
                              ),
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if ((widget.orderDocument == null) &&
                                  (widget.cartDocument == null))
                                Text(
                                  valueOrDefault<String>(
                                    widget.product?.count.toString(),
                                    '0',
                                  ),
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              if ((widget.orderDocument != null) ||
                                  (widget.cartDocument != null))
                                Material(
                                  color: Colors.transparent,
                                  child: Container(
                                    width: 75.0,
                                    height: 34.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .pageViewDots,
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: FlutterFlowCountController(
                                      decrementIconBuilder: (enabled) => FaIcon(
                                        FontAwesomeIcons.minus,
                                        color: enabled
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : FlutterFlowTheme.of(context)
                                                .grayTextMiddle,
                                        size: 14.0,
                                      ),
                                      incrementIconBuilder: (enabled) => FaIcon(
                                        FontAwesomeIcons.plus,
                                        color: enabled
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : FlutterFlowTheme.of(context)
                                                .grayTextMiddle,
                                        size: 14.0,
                                      ),
                                      countBuilder: (count) => Text(
                                        count.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      count: _model.countControllerValue ??=
                                          widget.product!.count,
                                      updateCount: (count) async {
                                        safeSetState(() => _model
                                            .countControllerValue = count);
                                        if ((widget.orderDocument != null) &&
                                            (widget.cartDocument == null)) {
                                          await widget.orderDocument!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'products':
                                                    FieldValue.arrayRemove([
                                                  getCartProductFirestoreData(
                                                    updateCartProductStruct(
                                                      widget.product,
                                                      clearUnsetFields: false,
                                                    ),
                                                    true,
                                                  )
                                                ]),
                                              },
                                            ),
                                          });

                                          await widget.orderDocument!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'products':
                                                    FieldValue.arrayUnion([
                                                  getCartProductFirestoreData(
                                                    createCartProductStruct(
                                                      productRef: widget
                                                          .product?.productRef,
                                                      name:
                                                          widget.product?.name,
                                                      image: widget
                                                          .product?.image,
                                                      price: widget
                                                          .product?.price,
                                                      color: widget
                                                          .product?.color,
                                                      size:
                                                          widget.product?.size,
                                                      count: _model
                                                          .countControllerValue,
                                                      clearUnsetFields: false,
                                                    ),
                                                    true,
                                                  )
                                                ]),
                                              },
                                            ),
                                          });
                                        } else if ((widget.orderDocument ==
                                                null) &&
                                            (widget.cartDocument != null)) {
                                          await widget.cartDocument!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'products':
                                                    FieldValue.arrayRemove([
                                                  getCartProductFirestoreData(
                                                    updateCartProductStruct(
                                                      widget.product,
                                                      clearUnsetFields: false,
                                                    ),
                                                    true,
                                                  )
                                                ]),
                                              },
                                            ),
                                          });

                                          await widget.cartDocument!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'products':
                                                    FieldValue.arrayUnion([
                                                  getCartProductFirestoreData(
                                                    createCartProductStruct(
                                                      productRef: widget
                                                          .product?.productRef,
                                                      name:
                                                          widget.product?.name,
                                                      image: widget
                                                          .product?.image,
                                                      price: widget
                                                          .product?.price,
                                                      color: widget
                                                          .product?.color,
                                                      size:
                                                          widget.product?.size,
                                                      count: _model
                                                          .countControllerValue,
                                                      clearUnsetFields: false,
                                                    ),
                                                    true,
                                                  )
                                                ]),
                                              },
                                            ),
                                          });
                                        }
                                      },
                                      stepSize: 1,
                                      minimum: 1,
                                      maximum: 1000,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              8.0, 0.0, 8.0, 0.0),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
