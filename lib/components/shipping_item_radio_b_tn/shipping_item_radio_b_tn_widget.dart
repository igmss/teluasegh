import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modals/info_confirm_modal/info_confirm_modal_widget.dart';
import 'package:flutter/material.dart';
import 'shipping_item_radio_b_tn_model.dart';
export 'shipping_item_radio_b_tn_model.dart';

class ShippingItemRadioBTnWidget extends StatefulWidget {
  const ShippingItemRadioBTnWidget({
    super.key,
    required this.addressName,
    required this.address,
    required this.isDeafult,
    required this.addressRef,
  });

  final String? addressName;
  final String? address;
  final bool? isDeafult;
  final DocumentReference? addressRef;

  @override
  State<ShippingItemRadioBTnWidget> createState() =>
      _ShippingItemRadioBTnWidgetState();
}

class _ShippingItemRadioBTnWidgetState
    extends State<ShippingItemRadioBTnWidget> {
  late ShippingItemRadioBTnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShippingItemRadioBTnModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 52.0,
              height: 52.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).pageViewDots,
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: 36.0,
                        height: 36.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryText,
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.klocationDefault,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                      children: [
                        Flexible(
                          child: Text(
                            widget.addressName!,
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        if (widget.isDeafult ?? true)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).pageViewDots,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 4.0, 10.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'lkvkur3i' /* Default */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            valueOrDefault<String>(
                              widget.address,
                              'address',
                            ),
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(height: 6.0)),
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: InfoConfirmModalWidget(
                        icon: Icon(
                          FFIcons.kcheck,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 54.0,
                        ),
                        title: 'Confirm!',
                        message:
                            'You sure you want to set this address as default address?',
                        isConfirmDialog: true,
                        confirmButtonText: 'Set as default',
                        hasCustomConfirmAction: true,
                        confirmCustomAction: () async {
                          await currentUserDocument!.defaultShippingAddress!
                              .update(createShippingAddressesRecordData(
                            isDefaultAddress: false,
                          ));

                          await currentUserReference!
                              .update(createUsersRecordData(
                            defaultShippingAddress: widget.addressRef,
                          ));

                          await widget.addressRef!
                              .update(createShippingAddressesRecordData(
                            isDefaultAddress: true,
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Default address changed',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: Stack(
                children: [
                  if (widget.isDeafult ?? true)
                    Icon(
                      FFIcons.kcheckboxChecked,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                  if (!widget.isDeafult!)
                    Icon(
                      FFIcons.kcheckboxUnchecked,
                      color: FlutterFlowTheme.of(context).pageViewDots,
                      size: 24.0,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
