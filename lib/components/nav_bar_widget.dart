import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/na_bar_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    super.key,
    String? activePage,
  }) : activePage = activePage ?? 'Home';

  final String activePage;

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Current naBar items:
        //
        // Home
        // Cart
        // Orders
        // Wallet
        // Profile
        Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: double.infinity,
            height: 65.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 25.0,
                  color: Color(0x1D000000),
                  offset: Offset(
                    0.0,
                    -8.0,
                  ),
                )
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('Home');
                    },
                    child: wrapWithModel(
                      model: _model.naBarItemModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: NaBarItemWidget(
                        actiePage: widget.activePage,
                        currentItemName: 'Home',
                        unselectedIcon: Icon(
                          Icons.home_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        selectedIcon: Icon(
                          Icons.home,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed('Cart');
                    },
                    child: Stack(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      children: [
                        wrapWithModel(
                          model: _model.naBarItemModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: NaBarItemWidget(
                            actiePage: widget.activePage,
                            currentItemName: 'Cart',
                            unselectedIcon: Icon(
                              Icons.shopping_cart_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            selectedIcon: Icon(
                              Icons.shopping_cart_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                        if (currentUserDocument?.cartRef != null)
                          Align(
                            alignment: const AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 5.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => StreamBuilder<CartRecord>(
                                  stream: CartRecord.getDocument(
                                      currentUserDocument!.cartRef!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 44.0,
                                          height: 44.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    final containerCartRecord = snapshot.data!;

                                    return Container(
                                      width: 24.0,
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 12.0,
                                            color: Color(0x7839D2C0),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: AutoSizeText(
                                        valueOrDefault<String>(
                                          containerCartRecord.products.length
                                              .toString(),
                                          '0',
                                        ).maybeHandleOverflow(
                                          maxChars: 2,
                                        ),
                                        maxLines: 1,
                                        minFontSize: 8.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed('OrderHistory');
                    },
                    child: wrapWithModel(
                      model: _model.ordersModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NaBarItemWidget(
                        actiePage: widget.activePage,
                        currentItemName: 'Orders',
                        unselectedIcon: Icon(
                          Icons.document_scanner_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        selectedIcon: Icon(
                          Icons.document_scanner,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed('Wallet');
                    },
                    child: wrapWithModel(
                      model: _model.walleModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NaBarItemWidget(
                        actiePage: widget.activePage,
                        currentItemName: 'Wallet',
                        unselectedIcon: Icon(
                          Icons.account_balance_wallet_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        selectedIcon: Icon(
                          Icons.account_balance_wallet_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed('Profile');
                    },
                    child: wrapWithModel(
                      model: _model.profilModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NaBarItemWidget(
                        actiePage: widget.activePage,
                        currentItemName: 'Profile',
                        unselectedIcon: Icon(
                          Icons.people_outline,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        selectedIcon: Icon(
                          Icons.people_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
