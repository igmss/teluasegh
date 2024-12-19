import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'help_center_model.dart';
export 'help_center_model.dart';

class HelpCenterWidget extends StatefulWidget {
  const HelpCenterWidget({super.key});

  @override
  State<HelpCenterWidget> createState() => _HelpCenterWidgetState();
}

class _HelpCenterWidgetState extends State<HelpCenterWidget>
    with TickerProviderStateMixin {
  late HelpCenterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelpCenterModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: true);
    _model.expandableExpandableController4 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController5 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController6 =
        ExpandableController(initialExpanded: false);
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
                    '0z4kt7o4' /* Help Center */,
                  ),
                  showBackButton: true,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Align(
                            alignment: const Alignment(-1.0, 0),
                            child: TabBar(
                              isScrollable: true,
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              unselectedLabelStyle: const TextStyle(),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              indicatorWeight: 3.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 4.0, 0.0, 4.0),
                              tabs: [
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'nt9ezckm' /* FAQ */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'p4i85uig' /* Contact us */,
                                  ),
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [() async {}, () async {}][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 25.0,
                                                      color: Color(0x11000000),
                                                      offset: Offset(
                                                        0.0,
                                                        12.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    color: Colors.white,
                                                    child: ExpandableNotifier(
                                                      controller: _model
                                                          .expandableExpandableController1,
                                                      child: ExpandablePanel(
                                                        header: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '23qalclq' /* General Support Tips */,
                                                          ),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        collapsed: Container(),
                                                        expanded: Html(
                                                          data:
                                                              '<!-- FAQ Item 1 -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">How do I import assets into my FlutterFlow project?</p>\n  <div class=\"faq-answer\">\n    <p>Check our <a href=\"https://docs.flutterflow.io/flutterflow-features/assets\" target=\"_blank\">documentation on assets</a> to learn about importing and managing assets in FlutterFlow.</p>\n  </div>\n</div>\n\n<!-- FAQ Item 2 -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">How can I add custom code to my project?</p>\n  <div class=\"faq-answer\">\n    <p>Learn about adding custom code in our <a href=\"https://docs.flutterflow.io/flutterflow-features/custom-code\" target=\"_blank\">Custom Code documentation</a>.</p>\n  </div>\n</div>\n\n<!-- FAQ Item 3 -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">What to do when my build fails?</p>\n  <div class=\"faq-answer\">\n    <p>For build issues, visit our <a href=\"https://intercom.help/flutterflow/en/articles/4438341-troubleshooting-a-build-failure\" target=\"_blank\">troubleshooting guide</a> for detailed steps to resolve common problems.</p>\n  </div>\n</div>\n',
                                                          onLinkTap: (url, _,
                                                                  __) =>
                                                              launchURL(url!),
                                                        ),
                                                        theme:
                                                            const ExpandableThemeData(
                                                          tapHeaderToExpand:
                                                              true,
                                                          tapBodyToExpand:
                                                              false,
                                                          tapBodyToCollapse:
                                                              false,
                                                          headerAlignment:
                                                              ExpandablePanelHeaderAlignment
                                                                  .center,
                                                          hasIcon: true,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 25.0,
                                                      color: Color(0x11000000),
                                                      offset: Offset(
                                                        0.0,
                                                        12.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    color: Colors.white,
                                                    child: ExpandableNotifier(
                                                      controller: _model
                                                          .expandableExpandableController2,
                                                      child: ExpandablePanel(
                                                        header: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'pvuurlly' /* Refudn policy */,
                                                          ),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        collapsed: Container(),
                                                        expanded: Html(
                                                          data:
                                                              '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<meta charset=\"UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<title>FAQ Section</title>\n<style>\n  /* Basic styles for FAQ section */\n  body {\n    font-family: Arial, sans-serif;\n  }\n  .faq-container {\n    width: 90%;\n    margin: 0 auto;\n    padding: 20px;\n  }\n  .faq-question {\n    font-weight: bold;\n  }\n  .faq-answer {\n    margin-bottom: 20px;\n  }\n  a {\n    text-decoration: none;\n    color: blue;\n  }\n  a:hover {\n    text-decoration: underline;\n  }\n</style>\n</head>\n<body>\n\n<div class=\"faq-container\">\n  <h1>Frequently Asked Questions</h1>\n\n  <div class=\"faq-item\">\n    <p class=\"faq-question\">How do I start using FlutterFlow?</p>\n    <div class=\"faq-answer\">\n      <p>Getting started with FlutterFlow is easy. You can follow our <a href=\"https://docs.flutterflow.io/getting-started\" target=\"_blank\">Getting Started Guide</a> to create your first project.</p>\n    </div>\n  </div>\n\n  <div class=\"faq-item\">\n    <p class=\"faq-question\">Where can I learn more about FlutterFlow features?</p>\n    <div class=\"faq-answer\">\n      <p>Our <a href=\"https://blog.flutterflow.io\" target=\"_blank\">blog</a> and <a href=\"https://www.youtube.com/c/FlutterFlow/videos\" target=\"_blank\">YouTube channel</a> are great resources for learning about what you can do with FlutterFlow.</p>\n    </div>\n  </div>\n\n  <div class=\"faq-item\">\n    <p class=\"faq-question\">Can I get support from the community?</p>\n    <div class=\"faq-answer\">\n      <p>Yes, the <a href=\"https://community.flutterflow.io\" target=\"_blank\">FlutterFlow community</a> is a great place to get help and share your knowledge with others.</p>\n    </div>\n  </div>\n\n  <div class=\"faq-item\">\n    <p class=\"faq-question\">What kind of templates does FlutterFlow offer?</p>\n    <div class=\"faq-answer\">\n      <p>We offer a variety of templates for different use cases. Check out our <a href=\"https://marketplace.flutterflow.io\" target=\"_blank\">marketplace</a> to browse our selection.</p>\n    </div>\n  </div>\n\n  <div class=\"faq-item\">\n    <p class=\"faq-question\">How can I troubleshoot common issues?</p>\n    <div class=\"faq-answer\">\n      <p>Our <a href=\"https://intercom.help/flutterflow/en/\" target=\"_blank\">Intercom articles</a> cover a range of troubleshooting topics to help you resolve common issues.</p>\n    </div>\n  </div>\n\n</div>\n\n</body>\n</html>\n',
                                                          onLinkTap: (url, _,
                                                                  __) =>
                                                              launchURL(url!),
                                                        ),
                                                        theme:
                                                            const ExpandableThemeData(
                                                          tapHeaderToExpand:
                                                              true,
                                                          tapBodyToExpand:
                                                              false,
                                                          tapBodyToCollapse:
                                                              false,
                                                          headerAlignment:
                                                              ExpandablePanelHeaderAlignment
                                                                  .center,
                                                          hasIcon: true,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 25.0,
                                                      color: Color(0x11000000),
                                                      offset: Offset(
                                                        0.0,
                                                        12.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    color: Colors.white,
                                                    child: ExpandableNotifier(
                                                      controller: _model
                                                          .expandableExpandableController3,
                                                      child: ExpandablePanel(
                                                        header: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '8we9hw49' /* Starting to buy */,
                                                          ),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        collapsed: Container(),
                                                        expanded: Html(
                                                          data:
                                                              '<!-- FAQ Item 1 -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">How do I import assets into my FlutterFlow project?</p>\n  <div class=\"faq-answer\">\n    <p>Check our <a href=\"https://docs.flutterflow.io/flutterflow-features/assets\" target=\"_blank\">documentation on assets</a> to learn about importing and managing assets in FlutterFlow.</p>\n  </div>\n</div>\n\n<!-- FAQ Item 2 -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">How can I add custom code to my project?</p>\n  <div class=\"faq-answer\">\n    <p>Learn about adding custom code in our <a href=\"https://docs.flutterflow.io/flutterflow-features/custom-code\" target=\"_blank\">Custom Code documentation</a>.</p>\n  </div>\n</div>\n\n<!-- FAQ Item 3 -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">What to do when my build fails?</p>\n  <div class=\"faq-answer\">\n    <p>For build issues, visit our <a href=\"https://intercom.help/flutterflow/en/articles/4438341-troubleshooting-a-build-failure\" target=\"_blank\">troubleshooting guide</a> for detailed steps to resolve common problems.</p>\n  </div>\n</div>\n',
                                                          onLinkTap: (url, _,
                                                                  __) =>
                                                              launchURL(url!),
                                                        ),
                                                        theme:
                                                            const ExpandableThemeData(
                                                          tapHeaderToExpand:
                                                              true,
                                                          tapBodyToExpand:
                                                              false,
                                                          tapBodyToCollapse:
                                                              false,
                                                          headerAlignment:
                                                              ExpandablePanelHeaderAlignment
                                                                  .center,
                                                          hasIcon: true,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 25.0,
                                                      color: Color(0x11000000),
                                                      offset: Offset(
                                                        0.0,
                                                        12.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    color: Colors.white,
                                                    child: ExpandableNotifier(
                                                      controller: _model
                                                          .expandableExpandableController4,
                                                      child: ExpandablePanel(
                                                        header: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'nfh9wa8y' /* How to get help */,
                                                          ),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        collapsed: Container(),
                                                        expanded: Html(
                                                          data:
                                                              '<!-- FAQ Item -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">Where can I find FlutterFlow tutorials?</p>\n  <div class=\"faq-answer\">\n    <p>For step-by-step tutorials, visit our <a href=\"https://www.youtube.com/c/FlutterFlow/videos\" target=\"_blank\">YouTube channel</a> where we regularly upload educational content.</p>\n  </div>\n</div>\n',
                                                          onLinkTap: (url, _,
                                                                  __) =>
                                                              launchURL(url!),
                                                        ),
                                                        theme:
                                                            const ExpandableThemeData(
                                                          tapHeaderToExpand:
                                                              true,
                                                          tapBodyToExpand:
                                                              false,
                                                          tapBodyToCollapse:
                                                              false,
                                                          headerAlignment:
                                                              ExpandablePanelHeaderAlignment
                                                                  .center,
                                                          hasIcon: true,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 25.0,
                                                      color: Color(0x11000000),
                                                      offset: Offset(
                                                        0.0,
                                                        12.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    color: Colors.white,
                                                    child: ExpandableNotifier(
                                                      controller: _model
                                                          .expandableExpandableController5,
                                                      child: ExpandablePanel(
                                                        header: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ladgp49w' /* General Support Tips */,
                                                          ),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        collapsed: Container(),
                                                        expanded: Html(
                                                          data:
                                                              '<!-- FAQ Item 1 -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">How do I import assets into my FlutterFlow project?</p>\n  <div class=\"faq-answer\">\n    <p>Check our <a href=\"https://docs.flutterflow.io/flutterflow-features/assets\" target=\"_blank\">documentation on assets</a> to learn about importing and managing assets in FlutterFlow.</p>\n  </div>\n</div>\n\n<!-- FAQ Item 2 -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">How can I add custom code to my project?</p>\n  <div class=\"faq-answer\">\n    <p>Learn about adding custom code in our <a href=\"https://docs.flutterflow.io/flutterflow-features/custom-code\" target=\"_blank\">Custom Code documentation</a>.</p>\n  </div>\n</div>\n\n<!-- FAQ Item 3 -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">What to do when my build fails?</p>\n  <div class=\"faq-answer\">\n    <p>For build issues, visit our <a href=\"https://intercom.help/flutterflow/en/articles/4438341-troubleshooting-a-build-failure\" target=\"_blank\">troubleshooting guide</a> for detailed steps to resolve common problems.</p>\n  </div>\n</div>\n',
                                                          onLinkTap: (url, _,
                                                                  __) =>
                                                              launchURL(url!),
                                                        ),
                                                        theme:
                                                            const ExpandableThemeData(
                                                          tapHeaderToExpand:
                                                              true,
                                                          tapBodyToExpand:
                                                              false,
                                                          tapBodyToCollapse:
                                                              false,
                                                          headerAlignment:
                                                              ExpandablePanelHeaderAlignment
                                                                  .center,
                                                          hasIcon: true,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 25.0,
                                                      color: Color(0x11000000),
                                                      offset: Offset(
                                                        0.0,
                                                        12.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    color: Colors.white,
                                                    child: ExpandableNotifier(
                                                      controller: _model
                                                          .expandableExpandableController6,
                                                      child: ExpandablePanel(
                                                        header: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '1cg5efnr' /* Which post service? */,
                                                          ),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        collapsed: Container(),
                                                        expanded: Html(
                                                          data:
                                                              '<!-- FAQ Item -->\n<div class=\"faq-item\">\n  <p class=\"faq-question\">Where can I find FlutterFlow tutorials?</p>\n  <div class=\"faq-answer\">\n    <p>For step-by-step tutorials, visit our <a href=\"https://www.youtube.com/c/FlutterFlow/videos\" target=\"_blank\">YouTube channel</a> where we regularly upload educational content.</p>\n  </div>\n</div>\n',
                                                          onLinkTap: (url, _,
                                                                  __) =>
                                                              launchURL(url!),
                                                        ),
                                                        theme:
                                                            const ExpandableThemeData(
                                                          tapHeaderToExpand:
                                                              true,
                                                          tapBodyToExpand:
                                                              false,
                                                          tapBodyToCollapse:
                                                              false,
                                                          headerAlignment:
                                                              ExpandablePanelHeaderAlignment
                                                                  .center,
                                                          hasIcon: true,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 24.0)),
                                        ),
                                      ),
                                    ].addToEnd(const SizedBox(height: 36.0)),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 25.0,
                                                color: Color(0x11000000),
                                                offset: Offset(
                                                  0.0,
                                                  12.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.headphones,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '3r368foz' /* Customer Service */,
                                                      ),
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleMedium
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
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 25.0,
                                                color: Color(0x11000000),
                                                offset: Offset(
                                                  0.0,
                                                  12.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  FFIcons.kmail,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'tqhl059h' /* Support */,
                                                      ),
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleMedium
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
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 25.0,
                                                color: Color(0x11000000),
                                                offset: Offset(
                                                  0.0,
                                                  12.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  FFIcons.kcallConnecting,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '5l5shah5' /* Contact Us */,
                                                      ),
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleMedium
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
                                        ),
                                      ),
                                    ]
                                        .divide(const SizedBox(height: 24.0))
                                        .addToStart(const SizedBox(height: 24.0))
                                        .addToEnd(const SizedBox(height: 24.0)),
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
