import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modals/info_confirm_modal/info_confirm_modal_widget.dart';
import '/modals/on_board_complete_modal/on_board_complete_modal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'biometric_set_model.dart';
export 'biometric_set_model.dart';

class BiometricSetWidget extends StatefulWidget {
  const BiometricSetWidget({super.key});

  @override
  State<BiometricSetWidget> createState() => _BiometricSetWidgetState();
}

class _BiometricSetWidgetState extends State<BiometricSetWidget> {
  late BiometricSetModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BiometricSetModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final localAuth = LocalAuthentication();
      bool isBiometricSupported = await localAuth.isDeviceSupported();

      if (isBiometricSupported) {
        try {
          _model.biometricEnabled = await localAuth.authenticate(
              localizedReason: FFLocalizations.of(context).getText(
            '1aj8l8ph' /* You want to enable the biometr... */,
          ));
        } on PlatformException {
          _model.biometricEnabled = false;
        }
        safeSetState(() {});
      }

      if (_model.biometricEnabled) {
        await currentUserReference!.update(createUsersRecordData(
          pinCodeEnabled: false,
          biometricEnabled: true,
          onboardingFinished: true,
        ));
        FFAppState().SecondSecorityLayerConfig = SecondSecurityLayerStruct(
          userEnabled: true,
          biometricIsEnabled: true,
        );
        safeSetState(() {});
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: const SizedBox(
                  height: double.infinity,
                  child: OnBoardCompleteModalWidget(),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      } else {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: InfoConfirmModalWidget(
                  icon: Icon(
                    FFIcons.kinfoTriangle,
                    color: FlutterFlowTheme.of(context).tertiary,
                    size: 54.0,
                  ),
                  title: 'Biometric Not Found!',
                  message:
                      'Seems your device don\'t have a biometric software or there is an issue to use it, Do you want to set Pincode instead?',
                  isConfirmDialog: true,
                  confirmButtonText: 'Set Pin Code',
                  hasCustomConfirmAction: true,
                  confirmCustomAction: () async {
                    if (Navigator.of(context).canPop()) {
                      context.pop();
                    }
                    context.pushNamed('pinCodeSet');
                  },
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
    });
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              wrapWithModel(
                model: _model.headerModel,
                updateCallback: () => safeSetState(() {}),
                child: HeaderWidget(
                  title: FFLocalizations.of(context).getText(
                    'r383okhi' /* Set Your Fingerprint */,
                  ),
                  showBackButton: true,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 56.0, 24.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Lottie.asset(
                              'assets/jsons/biometrics.json',
                              width: 250.0,
                              height: 250.0,
                              fit: BoxFit.cover,
                              reverse: true,
                              animate: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 76.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'w6hnxwg3' /* Please put your finger on the ... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
