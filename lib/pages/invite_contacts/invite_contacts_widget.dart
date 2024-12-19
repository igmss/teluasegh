import '/backend/schema/structs/index.dart';
import '/components/empty_widget.dart';
import '/components/header/header_widget.dart';
import '/components/invite_item/invite_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'invite_contacts_model.dart';
export 'invite_contacts_model.dart';

class InviteContactsWidget extends StatefulWidget {
  const InviteContactsWidget({
    super.key,
    this.listitem,
  });

  final String? listitem;

  @override
  State<InviteContactsWidget> createState() => _InviteContactsWidgetState();
}

class _InviteContactsWidgetState extends State<InviteContactsWidget> {
  late InviteContactsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InviteContactsModel());
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
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
                      'j5qxl9gm' /* Invite Friends In Your Contact... */,
                    ),
                    showBackButton: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'g97seig8' /* Note:  */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'nsd406yt' /* This feature only works in rea... */,
                                ),
                                style: const TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
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
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final contact = FFAppState().SyncedContacts.toList();
                        if (contact.isEmpty) {
                          return EmptyWidget(
                            icon: Icon(
                              FFIcons.kcallDefault,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 32.0,
                            ),
                            title: FFLocalizations.of(context).getText(
                              'xandwufc' /* Sync Contacts */,
                            ),
                            body: FFLocalizations.of(context).getText(
                              'a2v5ibvi' /* Start Sync your conatcts now. */,
                            ),
                            customAction: () async {},
                          );
                        }

                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children:
                                List.generate(contact.length, (contactIndex) {
                              final contactItem = contact[contactIndex];
                              return wrapWithModel(
                                model: _model.inviteItemModels1.getModel(
                                  widget.listitem!,
                                  contactIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: InviteItemWidget(
                                  key: Key(
                                    'Key243_${widget.listitem!}',
                                  ),
                                  photo:
                                      'https://images.unsplash.com/photo-1580489944761-15a19d654956?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxhdmF0YXJ8ZW58MHx8fHwxNjk5MDM0NDI5fDA&ixlib=rb-4.0.3&q=80&w=400',
                                  name: contactItem.name,
                                  phone: contactItem.phone,
                                  invited: true,
                                  shortName: contactItem.shortName,
                                ),
                              );
                            })
                                    .divide(const SizedBox(height: 16.0))
                                    .addToStart(const SizedBox(height: 24.0))
                                    .addToEnd(const SizedBox(height: 24.0)),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (false)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        wrapWithModel(
                          model: _model.inviteItemModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: const InviteItemWidget(
                            photo:
                                'https://images.unsplash.com/photo-1580489944761-15a19d654956?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxhdmF0YXJ8ZW58MHx8fHwxNjk5MDM0NDI5fDA&ixlib=rb-4.0.3&q=80&w=400',
                            name: 'Sozan Miracle',
                            phone: '+1 304 506 8765',
                            invited: true,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.inviteItemModel3,
                          updateCallback: () => safeSetState(() {}),
                          child: const InviteItemWidget(
                            photo:
                                'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHx3b21lbnxlbnwwfHx8fDE2OTkwMjk1NTh8MA&ixlib=rb-4.0.3&q=80&w=400',
                            name: 'Jessica Williams',
                            phone: '(415) 555-0678',
                            invited: false,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.inviteItemModel4,
                          updateCallback: () => safeSetState(() {}),
                          child: const InviteItemWidget(
                            photo:
                                'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxtZW58ZW58MHx8fHwxNjk5MDE5MjM5fDA&ixlib=rb-4.0.3&q=80&w=400',
                            name: 'Michael Smith',
                            phone: '(312) 555-0456',
                            invited: false,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.inviteItemModel5,
                          updateCallback: () => safeSetState(() {}),
                          child: const InviteItemWidget(
                            photo:
                                'https://images.unsplash.com/photo-1485875437342-9b39470b3d95?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHx3b21lbnxlbnwwfHx8fDE2OTkwMjk1NTh8MA&ixlib=rb-4.0.3&q=80&w=400',
                            name: 'Emily Johnson',
                            phone: '(212) 555-0234',
                            invited: true,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.inviteItemModel6,
                          updateCallback: () => safeSetState(() {}),
                          child: const InviteItemWidget(
                            photo:
                                'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNHx8bWVufGVufDB8fHx8MTY5OTAxOTIzOXww&ixlib=rb-4.0.3&q=80&w=400',
                            name: 'David Brown',
                            phone: '(503) 555-0912',
                            invited: false,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.inviteItemModel7,
                          updateCallback: () => safeSetState(() {}),
                          child: const InviteItemWidget(
                            photo:
                                'https://images.unsplash.com/photo-1560250097-0b93528c311a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxN3x8bWVufGVufDB8fHx8MTY5OTAxOTIzOXww&ixlib=rb-4.0.3&q=80&w=400',
                            name: 'Brian Wilson',
                            phone: '(518) 555-1124',
                            invited: false,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.inviteItemModel8,
                          updateCallback: () => safeSetState(() {}),
                          child: const InviteItemWidget(
                            photo:
                                'https://images.unsplash.com/photo-1588516903720-8ceb67f9ef84?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8d29tZW58ZW58MHx8fHwxNjk5MDI5NTU4fDA&ixlib=rb-4.0.3&q=80&w=400',
                            name: 'Sarah Davis',
                            phone: '(305) 555-1023',
                            invited: false,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.inviteItemModel9,
                          updateCallback: () => safeSetState(() {}),
                          child: const InviteItemWidget(
                            photo:
                                'https://images.unsplash.com/photo-1602442787305-decbd65be507?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMXx8d29tZW58ZW58MHx8fHwxNjk5MDI5NTU4fDA&ixlib=rb-4.0.3&q=80&w=400',
                            name: 'Sozan Miracle',
                            phone: '+1 304 506 8765',
                            invited: false,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.inviteItemModel10,
                          updateCallback: () => safeSetState(() {}),
                          child: const InviteItemWidget(
                            photo:
                                'https://images.unsplash.com/photo-1560087637-bf797bc7796a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxOXx8d29tZW58ZW58MHx8fHwxNjk5MDI5NTU4fDA&ixlib=rb-4.0.3&q=80&w=400',
                            name: 'Laura Miller',
                            phone: '(617) 555-1345',
                            invited: false,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.inviteItemModel11,
                          updateCallback: () => safeSetState(() {}),
                          child: const InviteItemWidget(
                            photo:
                                'https://images.unsplash.com/photo-1628157588553-5eeea00af15c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNHx8YXZhdGFyfGVufDB8fHx8MTY5OTAzNDQyOXww&ixlib=rb-4.0.3&q=80&w=400',
                            name: 'Kevin Garcia',
                            phone: '(702) 555-1467',
                            invited: true,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.inviteItemModel12,
                          updateCallback: () => safeSetState(() {}),
                          child: const InviteItemWidget(
                            photo:
                                'https://images.unsplash.com/photo-1508341591423-4347099e1f19?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxtZW58ZW58MHx8fHwxNjk5MDE5MjM5fDA&ixlib=rb-4.0.3&q=80&w=400',
                            name: 'Aaron Taylor',
                            phone: '(404) 555-1711',
                            invited: false,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.inviteItemModel13,
                          updateCallback: () => safeSetState(() {}),
                          child: const InviteItemWidget(
                            photo:
                                'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw5fHxtZW58ZW58MHx8fHwxNjk5MDE5MjM5fDA&ixlib=rb-4.0.3&q=80&w=400',
                            name: 'Gregory Lee',
                            phone: '(213) 555-2041',
                            invited: false,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.inviteItemModel14,
                          updateCallback: () => safeSetState(() {}),
                          child: const InviteItemWidget(
                            photo:
                                'https://images.unsplash.com/photo-1484515991647-c5760fcecfc7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxOHx8bWVufGVufDB8fHx8MTY5OTAxOTIzOXww&ixlib=rb-4.0.3&q=80&w=400',
                            name: 'Lisa Anderson',
                            phone: '(507) 555-1922',
                            invited: false,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.inviteItemModel15,
                          updateCallback: () => safeSetState(() {}),
                          child: const InviteItemWidget(
                            photo:
                                'https://images.unsplash.com/photo-1539109136881-3be0616acf4b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxmYXNoaW9ufGVufDB8fHx8MTY5OTAyMzQ1OXww&ixlib=rb-4.0.3&q=80&w=400',
                            name: 'Sozan Miracle',
                            phone: '+1 304 506 8765',
                            invited: false,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.inviteItemModel16,
                          updateCallback: () => safeSetState(() {}),
                          child: const InviteItemWidget(
                            photo:
                                'https://images.unsplash.com/photo-1586351012965-861624544334?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyM3x8Z2lybHxlbnwwfHx8fDE2OTkwNDE0NDN8MA&ixlib=rb-4.0.3&q=80&w=400',
                            name: 'Sozan Miracle',
                            phone: '+1 304 506 8765',
                            invited: false,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.inviteItemModel17,
                          updateCallback: () => safeSetState(() {}),
                          child: const InviteItemWidget(
                            photo:
                                'https://images.unsplash.com/photo-1559629819-638a8f0a4303?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxib3l8ZW58MHx8fHwxNjk5MDQxNDY1fDA&ixlib=rb-4.0.3&q=80&w=400',
                            name: 'Sozan Miracle',
                            phone: '+1 304 506 8765',
                            invited: false,
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 16.0))
                          .addToStart(const SizedBox(height: 24.0))
                          .addToEnd(const SizedBox(height: 24.0)),
                    ),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.contacts = await actions.getAllContacts(
                              context,
                              FFAppState().SyncedContacts.toList(),
                            );
                            FFAppState().SyncedContacts =
                                _model.contacts!.toList().cast<ContactStruct>();
                            safeSetState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Synced!',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                duration: const Duration(milliseconds: 2000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );

                            safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'lq22x372' /* Sync Your Contacts */,
                          ),
                          options: FFButtonOptions(
                            height: 54.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 8.0, 20.0, 8.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).buttonBlack,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
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
