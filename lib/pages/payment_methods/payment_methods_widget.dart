import '/components/header/header_widget.dart';
import '/components/payment_method_item/payment_method_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'payment_methods_model.dart';
export 'payment_methods_model.dart';

class PaymentMethodsWidget extends StatefulWidget {
  const PaymentMethodsWidget({super.key});

  @override
  State<PaymentMethodsWidget> createState() => _PaymentMethodsWidgetState();
}

class _PaymentMethodsWidgetState extends State<PaymentMethodsWidget> {
  late PaymentMethodsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentMethodsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                    'bev5ue3s' /* Payment Methods */,
                  ),
                  showBackButton: true,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().PaymentMethod = 'E-Wallet';
                                FFAppState().update(() {});
                              },
                              child: wrapWithModel(
                                model: _model.paymentMethodItemModel1,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: PaymentMethodItemWidget(
                                  title: 'E-Wallet',
                                  icon: const Icon(
                                    FFIcons.kwalletDefault,
                                  ),
                                  isDefault:
                                      FFAppState().PaymentMethod == 'E-Wallet',
                                  showIcon: true,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().PaymentMethod = 'Paypal';
                                  FFAppState().update(() {});
                                },
                                child: wrapWithModel(
                                  model: _model.paymentMethodItemModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: PaymentMethodItemWidget(
                                    title: 'PayPal',
                                    icon: Icon(
                                      FFIcons.kbrandPaypalFilled,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                    photo:
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/netron-e-com-mobile-6rhojr/assets/l7t0cjkr83or/Frame_(4).png',
                                    isDefault:
                                        FFAppState().PaymentMethod == 'Paypal',
                                    showIcon: false,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().PaymentMethod = 'Google';
                                  FFAppState().update(() {});
                                },
                                child: wrapWithModel(
                                  model: _model.paymentMethodItemModel3,
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: PaymentMethodItemWidget(
                                    title: 'Google Play',
                                    icon: const Icon(
                                      FFIcons.kbrandGoogle,
                                    ),
                                    photo:
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/netron-e-com-mobile-6rhojr/assets/ebib1njywdiq/Frame_(5).png',
                                    isDefault:
                                        FFAppState().PaymentMethod == 'Google',
                                    showIcon: false,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().PaymentMethod = 'Apple';
                                  FFAppState().update(() {});
                                },
                                child: wrapWithModel(
                                  model: _model.paymentMethodItemModel4,
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: PaymentMethodItemWidget(
                                    title: 'Apple Pay',
                                    icon: const Icon(
                                      FFIcons.kbrandApple,
                                    ),
                                    photo:
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/netron-e-com-mobile-6rhojr/assets/ho9cuo9qrdgj/Frame_(6).png',
                                    isDefault:
                                        FFAppState().PaymentMethod == 'Apple',
                                    showIcon: false,
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
