import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/empty_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'customer_support_model.dart';
export 'customer_support_model.dart';

class CustomerSupportWidget extends StatefulWidget {
  const CustomerSupportWidget({super.key});

  @override
  State<CustomerSupportWidget> createState() => _CustomerSupportWidgetState();
}

class _CustomerSupportWidgetState extends State<CustomerSupportWidget>
    with TickerProviderStateMixin {
  late CustomerSupportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerSupportModel());

    _model.messageTextController ??= TextEditingController();
    _model.messageFocusNode ??= FocusNode();

    animationsMap.addAll({
      'iconButtonOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 41.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 41.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 41.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
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
                          '86er6dcw' /* Customer Service */,
                        ),
                        showBackButton: true,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: StreamBuilder<List<SupportMesagesRecord>>(
                              stream: _model.supportMessagesUser(
                                uniqueQueryKey: valueOrDefault<String>(
                                  currentUserReference?.id,
                                  'userID',
                                ),
                                requestFn: () => querySupportMesagesRecord(
                                  queryBuilder: (supportMesagesRecord) =>
                                      supportMesagesRecord
                                          .where(
                                            'user_ref',
                                            isEqualTo: currentUserReference,
                                          )
                                          .orderBy('sendDate',
                                              descending: true),
                                ),
                              ),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<SupportMesagesRecord>
                                    customerServiceColumnSupportMesagesRecordList =
                                    snapshot.data!;
                                if (customerServiceColumnSupportMesagesRecordList
                                    .isEmpty) {
                                  return EmptyWidget(
                                    icon: Icon(
                                      FFIcons.ksend,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 32.0,
                                    ),
                                    title: 'Chat Support!',
                                    body: 'Start your ticket, We gald to help',
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
                                  reverse: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      customerServiceColumnSupportMesagesRecordList
                                          .length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 16.0),
                                  itemBuilder:
                                      (context, customerServiceColumnIndex) {
                                    final customerServiceColumnSupportMesagesRecord =
                                        customerServiceColumnSupportMesagesRecordList[
                                            customerServiceColumnIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (customerServiceColumnSupportMesagesRecord
                                                  .sender !=
                                              currentUserReference)
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (customerServiceColumnSupportMesagesRecord
                                                    .supportSendThis)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              54.0),
                                                      child: Image.asset(
                                                        'assets/images/evira-logo.jpg',
                                                        width: 32.0,
                                                        height: 32.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                Expanded(
                                                  flex: 5,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .pageViewDots,
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                8.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                8.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(12.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          if (customerServiceColumnSupportMesagesRecord
                                                              .hasAttachment)
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              8.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              0.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      constraints:
                                                                          const BoxConstraints(
                                                                        minHeight:
                                                                            80.0,
                                                                        maxHeight:
                                                                            180.0,
                                                                      ),
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(8.0),
                                                                          bottomRight:
                                                                              Radius.circular(8.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            if (customerServiceColumnSupportMesagesRecord.video != '')
                                                                              Container(
                                                                                width: double.infinity,
                                                                                height: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: FlutterFlowVideoPlayer(
                                                                                  path: customerServiceColumnSupportMesagesRecord.video,
                                                                                  videoType: VideoType.network,
                                                                                  width: double.infinity,
                                                                                  height: double.infinity,
                                                                                  autoPlay: false,
                                                                                  looping: false,
                                                                                  showControls: true,
                                                                                  allowFullScreen: true,
                                                                                  allowPlaybackSpeedMenu: false,
                                                                                  lazyLoad: true,
                                                                                ),
                                                                              ),
                                                                            if (customerServiceColumnSupportMesagesRecord.audio != '')
                                                                              Container(
                                                                                width: double.infinity,
                                                                                height: 80.0,
                                                                                decoration: const BoxDecoration(),
                                                                                child: FlutterFlowAudioPlayer(
                                                                                  audio: Audio.network(
                                                                                    customerServiceColumnSupportMesagesRecord.audio,
                                                                                    metas: Metas(
                                                                                      title: 'Audio Attached',
                                                                                    ),
                                                                                  ),
                                                                                  titleTextStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  playbackDurationTextStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  fillColor: FlutterFlowTheme.of(context).pageViewDots,
                                                                                  playbackButtonColor: FlutterFlowTheme.of(context).primary,
                                                                                  activeTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                  elevation: 0.0,
                                                                                  playInBackground: PlayInBackground.disabledRestoreOnForeground,
                                                                                ),
                                                                              ),
                                                                            if (customerServiceColumnSupportMesagesRecord.image != '')
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await Navigator.push(
                                                                                    context,
                                                                                    PageTransition(
                                                                                      type: PageTransitionType.fade,
                                                                                      child: FlutterFlowExpandedImageView(
                                                                                        image: CachedNetworkImage(
                                                                                          fadeInDuration: const Duration(milliseconds: 500),
                                                                                          fadeOutDuration: const Duration(milliseconds: 500),
                                                                                          imageUrl: customerServiceColumnSupportMesagesRecord.image,
                                                                                          fit: BoxFit.contain,
                                                                                        ),
                                                                                        allowRotation: false,
                                                                                        tag: customerServiceColumnSupportMesagesRecord.image,
                                                                                        useHeroAnimation: true,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                child: Hero(
                                                                                  tag: customerServiceColumnSupportMesagesRecord.image,
                                                                                  transitionOnUserGestures: true,
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(6.0),
                                                                                    child: CachedNetworkImage(
                                                                                      fadeInDuration: const Duration(milliseconds: 500),
                                                                                      fadeOutDuration: const Duration(milliseconds: 500),
                                                                                      imageUrl: customerServiceColumnSupportMesagesRecord.image,
                                                                                      width: 300.0,
                                                                                      height: 200.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  customerServiceColumnSupportMesagesRecord
                                                                      .message,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                dateTimeFormat(
                                                                  "relative",
                                                                  customerServiceColumnSupportMesagesRecord
                                                                      .sendDate!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          if (customerServiceColumnSupportMesagesRecord
                                                  .sender ==
                                              currentUserReference)
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                8.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(12.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          if (customerServiceColumnSupportMesagesRecord
                                                              .hasAttachment)
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              8.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              8.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      constraints:
                                                                          const BoxConstraints(
                                                                        minHeight:
                                                                            80.0,
                                                                        maxHeight:
                                                                            180.0,
                                                                      ),
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(8.0),
                                                                          bottomRight:
                                                                              Radius.circular(8.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            if (customerServiceColumnSupportMesagesRecord.video != '')
                                                                              Container(
                                                                                width: double.infinity,
                                                                                height: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: FlutterFlowVideoPlayer(
                                                                                  path: customerServiceColumnSupportMesagesRecord.video,
                                                                                  videoType: VideoType.network,
                                                                                  width: double.infinity,
                                                                                  height: double.infinity,
                                                                                  autoPlay: false,
                                                                                  looping: false,
                                                                                  showControls: true,
                                                                                  allowFullScreen: true,
                                                                                  allowPlaybackSpeedMenu: false,
                                                                                  lazyLoad: true,
                                                                                ),
                                                                              ),
                                                                            if (customerServiceColumnSupportMesagesRecord.audio != '')
                                                                              Container(
                                                                                width: double.infinity,
                                                                                height: 80.0,
                                                                                decoration: const BoxDecoration(),
                                                                                child: FlutterFlowAudioPlayer(
                                                                                  audio: Audio.network(
                                                                                    customerServiceColumnSupportMesagesRecord.audio,
                                                                                    metas: Metas(
                                                                                      title: 'Audio Attached',
                                                                                    ),
                                                                                  ),
                                                                                  titleTextStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  playbackDurationTextStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).accent4,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  fillColor: FlutterFlowTheme.of(context).primaryText,
                                                                                  playbackButtonColor: FlutterFlowTheme.of(context).tertiary,
                                                                                  activeTrackColor: FlutterFlowTheme.of(context).accent4,
                                                                                  elevation: 0.0,
                                                                                  playInBackground: PlayInBackground.disabledRestoreOnForeground,
                                                                                ),
                                                                              ),
                                                                            if (customerServiceColumnSupportMesagesRecord.image != '')
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await Navigator.push(
                                                                                    context,
                                                                                    PageTransition(
                                                                                      type: PageTransitionType.fade,
                                                                                      child: FlutterFlowExpandedImageView(
                                                                                        image: CachedNetworkImage(
                                                                                          fadeInDuration: const Duration(milliseconds: 500),
                                                                                          fadeOutDuration: const Duration(milliseconds: 500),
                                                                                          imageUrl: customerServiceColumnSupportMesagesRecord.image,
                                                                                          fit: BoxFit.contain,
                                                                                        ),
                                                                                        allowRotation: false,
                                                                                        tag: customerServiceColumnSupportMesagesRecord.image,
                                                                                        useHeroAnimation: true,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                child: Hero(
                                                                                  tag: customerServiceColumnSupportMesagesRecord.image,
                                                                                  transitionOnUserGestures: true,
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: CachedNetworkImage(
                                                                                      fadeInDuration: const Duration(milliseconds: 500),
                                                                                      fadeOutDuration: const Duration(milliseconds: 500),
                                                                                      imageUrl: customerServiceColumnSupportMesagesRecord.image,
                                                                                      width: 300.0,
                                                                                      height: 200.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  customerServiceColumnSupportMesagesRecord
                                                                      .message,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                dateTimeFormat(
                                                                  "relative",
                                                                  customerServiceColumnSupportMesagesRecord
                                                                      .sendDate!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (customerServiceColumnSupportMesagesRecord
                                                    .supportSendThis)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              54.0),
                                                      child: Image.asset(
                                                        'assets/images/evira-logo.jpg',
                                                        width: 32.0,
                                                        height: 32.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                        ].divide(const SizedBox(height: 8.0)),
                                      ),
                                    );
                                  },
                                  controller: _model.customerServiceColumn,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 54.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    3.0, 0.0, 3.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            _model.messageTextController,
                                        focusNode: _model.messageFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.messageTextController',
                                          const Duration(milliseconds: 300),
                                          () => safeSetState(() {}),
                                        ),
                                        autofocus: false,
                                        textInputAction: TextInputAction.send,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: false,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Urbanist',
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'n8zkrsnu' /* Message... */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        validator: _model
                                            .messageTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          borderWidth: 0.0,
                                          buttonSize: 44.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          disabledColor:
                                              FlutterFlowTheme.of(context)
                                                  .grayTextMiddle,
                                          icon: Icon(
                                            FFIcons.ksend,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 24.0,
                                          ),
                                          showLoadingIndicator: true,
                                          onPressed: (_model.messageTextController
                                                          .text ==
                                                      '')
                                              ? null
                                              : () async {
                                                  final firestoreBatch =
                                                      FirebaseFirestore.instance
                                                          .batch();
                                                  try {
                                                    var supportMesagesRecordReference =
                                                        SupportMesagesRecord
                                                            .collection
                                                            .doc();
                                                    firestoreBatch.set(
                                                        supportMesagesRecordReference,
                                                        createSupportMesagesRecordData(
                                                          message: _model
                                                              .messageTextController
                                                              .text,
                                                          sender:
                                                              currentUserReference,
                                                          supportSendThis:
                                                              valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.isSupportAgent,
                                                                  false),
                                                          sendDate:
                                                              getCurrentTimestamp,
                                                          userRef:
                                                              currentUserReference,
                                                          hasAttachment: _model
                                                              .hasAttachment,
                                                        ));
                                                    _model.messageCreated =
                                                        SupportMesagesRecord
                                                            .getDocumentFromData(
                                                                createSupportMesagesRecordData(
                                                                  message: _model
                                                                      .messageTextController
                                                                      .text,
                                                                  sender:
                                                                      currentUserReference,
                                                                  supportSendThis: valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.isSupportAgent,
                                                                      false),
                                                                  sendDate:
                                                                      getCurrentTimestamp,
                                                                  userRef:
                                                                      currentUserReference,
                                                                  hasAttachment:
                                                                      _model
                                                                          .hasAttachment,
                                                                ),
                                                                supportMesagesRecordReference);
                                                    if (_model.hasAttachment) {
                                                      if (_model.imageAttachment !=
                                                              null &&
                                                          _model.imageAttachment !=
                                                              '') {
                                                        firestoreBatch.update(
                                                            _model
                                                                .messageCreated!
                                                                .reference,
                                                            createSupportMesagesRecordData(
                                                              image: _model
                                                                  .imageAttachment,
                                                            ));
                                                        safeSetState(() {
                                                          _model.isDataUploading1 =
                                                              false;
                                                          _model.uploadedLocalFile1 =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
                                                          _model.uploadedFileUrl1 =
                                                              '';
                                                        });
                                                      } else if (_model
                                                                  .audioAttachment !=
                                                              null &&
                                                          _model.audioAttachment !=
                                                              '') {
                                                        firestoreBatch.update(
                                                            _model
                                                                .messageCreated!
                                                                .reference,
                                                            createSupportMesagesRecordData(
                                                              audio: _model
                                                                  .audioAttachment,
                                                            ));
                                                        safeSetState(() {
                                                          _model.isDataUploading2 =
                                                              false;
                                                          _model.uploadedLocalFile2 =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
                                                          _model.uploadedFileUrl2 =
                                                              '';
                                                        });
                                                      } else if (_model
                                                                  .videoAttachment !=
                                                              null &&
                                                          _model.videoAttachment !=
                                                              '') {
                                                        firestoreBatch.update(
                                                            _model
                                                                .messageCreated!
                                                                .reference,
                                                            createSupportMesagesRecordData(
                                                              video: _model
                                                                  .videoAttachment,
                                                            ));
                                                        safeSetState(() {
                                                          _model.isDataUploading3 =
                                                              false;
                                                          _model.uploadedLocalFile3 =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
                                                          _model.uploadedFileUrl3 =
                                                              '';
                                                        });
                                                      }
                                                    }
                                                    _model.hasAttachment =
                                                        false;
                                                    _model.imageAttachment = '';
                                                    _model.audioAttachment = '';
                                                    _model.videoAttachment = '';
                                                    _model.attachMenu = false;
                                                    _model.uplaoding = false;
                                                    safeSetState(() {});
                                                    safeSetState(() {
                                                      _model
                                                          .messageTextController
                                                          ?.clear();
                                                    });
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 500));
                                                    await _model
                                                        .customerServiceColumn
                                                        ?.animateTo(
                                                      0,
                                                      duration: const Duration(
                                                          milliseconds: 150),
                                                      curve: Curves.ease,
                                                    );
                                                  } finally {
                                                    await firestoreBatch
                                                        .commit();
                                                  }

                                                  safeSetState(() {});
                                                },
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 8.0,
                                          borderWidth: 0.0,
                                          buttonSize: 44.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          icon: Icon(
                                            FFIcons.kdownload,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            if (_model.hasAttachment) {
                                              _model.attachMenu = false;
                                              _model.videoAttachment = '';
                                              _model.audioAttachment = '';
                                              _model.imageAttachment = '';
                                              _model.hasAttachment = false;
                                              _model.uplaoding = false;
                                              safeSetState(() {});
                                            }
                                            _model.attachMenu =
                                                !_model.attachMenu;
                                            safeSetState(() {});
                                          },
                                        ),
                                      ].divide(const SizedBox(width: 4.0)),
                                    ),
                                  ].divide(const SizedBox(width: 4.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (_model.attachMenu)
                  Align(
                    alignment: const AlignmentDirectional(1.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 23.0, 58.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8.0,
                            borderWidth: 0.0,
                            buttonSize: 44.0,
                            fillColor: FlutterFlowTheme.of(context).primaryText,
                            icon: Icon(
                              FFIcons.kimageDefault,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              _model.uplaoding = true;
                              safeSetState(() {});
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                maxWidth: 1200.00,
                                maxHeight: 1200.00,
                                imageQuality: 80,
                                allowPhoto: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(
                                    () => _model.isDataUploading1 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  _model.isDataUploading1 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile1 =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl1 =
                                        downloadUrls.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              if (_model.uploadedFileUrl1 != '') {
                                _model.imageAttachment =
                                    _model.uploadedFileUrl1;
                                _model.hasAttachment = true;
                                safeSetState(() {});
                              }
                              _model.uplaoding = false;
                              _model.attachMenu = false;
                              safeSetState(() {});
                              safeSetState(() {
                                _model.isDataUploading1 = false;
                                _model.uploadedLocalFile1 = FFUploadedFile(
                                    bytes: Uint8List.fromList([]));
                                _model.uploadedFileUrl1 = '';
                              });
                            },
                          ).animateOnPageLoad(
                              animationsMap['iconButtonOnPageLoadAnimation1']!),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8.0,
                            borderWidth: 0.0,
                            buttonSize: 44.0,
                            fillColor: FlutterFlowTheme.of(context).primaryText,
                            icon: Icon(
                              FFIcons.kmicDefault,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              _model.uplaoding = true;
                              safeSetState(() {});
                              final selectedFiles = await selectFiles(
                                allowedExtensions: ['mp3'],
                                multiFile: false,
                              );
                              if (selectedFiles != null) {
                                safeSetState(
                                    () => _model.isDataUploading2 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = selectedFiles
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedFiles.map(
                                      (f) async => await uploadData(
                                          f.storagePath, f.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  _model.isDataUploading2 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedFiles.length &&
                                    downloadUrls.length ==
                                        selectedFiles.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile2 =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl2 =
                                        downloadUrls.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              if (_model.uploadedFileUrl2 != '') {
                                _model.audioAttachment =
                                    _model.uploadedFileUrl2;
                                _model.hasAttachment = true;
                                safeSetState(() {});
                              }
                              _model.uplaoding = false;
                              _model.attachMenu = false;
                              safeSetState(() {});
                              safeSetState(() {
                                _model.isDataUploading2 = false;
                                _model.uploadedLocalFile2 = FFUploadedFile(
                                    bytes: Uint8List.fromList([]));
                                _model.uploadedFileUrl2 = '';
                              });
                            },
                          ).animateOnPageLoad(
                              animationsMap['iconButtonOnPageLoadAnimation2']!),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8.0,
                            borderWidth: 0.0,
                            buttonSize: 44.0,
                            fillColor: FlutterFlowTheme.of(context).primaryText,
                            icon: Icon(
                              FFIcons.kvideo,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              _model.uplaoding = true;
                              safeSetState(() {});
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                allowPhoto: false,
                                allowVideo: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(
                                    () => _model.isDataUploading3 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  _model.isDataUploading3 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile3 =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl3 =
                                        downloadUrls.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              if (_model.uploadedFileUrl3 != '') {
                                _model.videoAttachment =
                                    _model.uploadedFileUrl3;
                                _model.hasAttachment = true;
                                safeSetState(() {});
                              }
                              _model.uplaoding = false;
                              _model.attachMenu = false;
                              safeSetState(() {});
                              safeSetState(() {
                                _model.isDataUploading3 = false;
                                _model.uploadedLocalFile3 = FFUploadedFile(
                                    bytes: Uint8List.fromList([]));
                                _model.uploadedFileUrl3 = '';
                              });
                            },
                          ).animateOnPageLoad(
                              animationsMap['iconButtonOnPageLoadAnimation3']!),
                        ].divide(const SizedBox(height: 8.0)),
                      ),
                    ),
                  ),
                if (_model.hasAttachment)
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 58.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(0.0),
                        ),
                        child: Container(
                          width: 240.0,
                          constraints: const BoxConstraints(
                            minHeight: 80.0,
                            maxHeight: 180.0,
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: Stack(
                              children: [
                                if (_model.videoAttachment != null &&
                                    _model.videoAttachment != '')
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Visibility(
                                      visible: _model.videoAttachment != null &&
                                          _model.videoAttachment != '',
                                      child: FlutterFlowVideoPlayer(
                                        path: _model.videoAttachment!,
                                        videoType: VideoType.network,
                                        width: double.infinity,
                                        height: double.infinity,
                                        autoPlay: false,
                                        looping: false,
                                        showControls: true,
                                        allowFullScreen: true,
                                        allowPlaybackSpeedMenu: false,
                                        lazyLoad: true,
                                      ),
                                    ),
                                  ),
                                if (_model.audioAttachment != null &&
                                    _model.audioAttachment != '')
                                  Container(
                                    width: double.infinity,
                                    height: 80.0,
                                    decoration: const BoxDecoration(),
                                    child: FlutterFlowAudioPlayer(
                                      audio: Audio.network(
                                        _model.audioAttachment!,
                                        metas: Metas(
                                          title: 'Audio Attached',
                                        ),
                                      ),
                                      titleTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                      playbackDurationTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                letterSpacing: 0.0,
                                              ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      playbackButtonColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).accent4,
                                      elevation: 0.0,
                                      playInBackground: PlayInBackground
                                          .disabledRestoreOnForeground,
                                    ),
                                  ),
                                if (_model.imageAttachment != null &&
                                    _model.imageAttachment != '')
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: CachedNetworkImage(
                                              fadeInDuration:
                                                  const Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  const Duration(milliseconds: 500),
                                              imageUrl: _model.imageAttachment!,
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: _model.imageAttachment!,
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: _model.imageAttachment!,
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              const Duration(milliseconds: 500),
                                          fadeOutDuration:
                                              const Duration(milliseconds: 500),
                                          imageUrl: _model.imageAttachment!,
                                          width: 300.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (_model.uplaoding)
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 15.0,
                            color: Color(0x11000000),
                            offset: Offset(
                              0.0,
                              8.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/upload_image.gif',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
