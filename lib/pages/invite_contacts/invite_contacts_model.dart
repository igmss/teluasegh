import '/backend/schema/structs/index.dart';
import '/components/header/header_widget.dart';
import '/components/invite_item/invite_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'invite_contacts_widget.dart' show InviteContactsWidget;
import 'package:flutter/material.dart';

class InviteContactsModel extends FlutterFlowModel<InviteContactsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Models for InviteItem dynamic component.
  late FlutterFlowDynamicModels<InviteItemModel> inviteItemModels1;
  // Model for InviteItem component.
  late InviteItemModel inviteItemModel2;
  // Model for InviteItem component.
  late InviteItemModel inviteItemModel3;
  // Model for InviteItem component.
  late InviteItemModel inviteItemModel4;
  // Model for InviteItem component.
  late InviteItemModel inviteItemModel5;
  // Model for InviteItem component.
  late InviteItemModel inviteItemModel6;
  // Model for InviteItem component.
  late InviteItemModel inviteItemModel7;
  // Model for InviteItem component.
  late InviteItemModel inviteItemModel8;
  // Model for InviteItem component.
  late InviteItemModel inviteItemModel9;
  // Model for InviteItem component.
  late InviteItemModel inviteItemModel10;
  // Model for InviteItem component.
  late InviteItemModel inviteItemModel11;
  // Model for InviteItem component.
  late InviteItemModel inviteItemModel12;
  // Model for InviteItem component.
  late InviteItemModel inviteItemModel13;
  // Model for InviteItem component.
  late InviteItemModel inviteItemModel14;
  // Model for InviteItem component.
  late InviteItemModel inviteItemModel15;
  // Model for InviteItem component.
  late InviteItemModel inviteItemModel16;
  // Model for InviteItem component.
  late InviteItemModel inviteItemModel17;
  // Stores action output result for [Custom Action - getAllContacts] action in Button widget.
  List<ContactStruct>? contacts;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    inviteItemModels1 = FlutterFlowDynamicModels(() => InviteItemModel());
    inviteItemModel2 = createModel(context, () => InviteItemModel());
    inviteItemModel3 = createModel(context, () => InviteItemModel());
    inviteItemModel4 = createModel(context, () => InviteItemModel());
    inviteItemModel5 = createModel(context, () => InviteItemModel());
    inviteItemModel6 = createModel(context, () => InviteItemModel());
    inviteItemModel7 = createModel(context, () => InviteItemModel());
    inviteItemModel8 = createModel(context, () => InviteItemModel());
    inviteItemModel9 = createModel(context, () => InviteItemModel());
    inviteItemModel10 = createModel(context, () => InviteItemModel());
    inviteItemModel11 = createModel(context, () => InviteItemModel());
    inviteItemModel12 = createModel(context, () => InviteItemModel());
    inviteItemModel13 = createModel(context, () => InviteItemModel());
    inviteItemModel14 = createModel(context, () => InviteItemModel());
    inviteItemModel15 = createModel(context, () => InviteItemModel());
    inviteItemModel16 = createModel(context, () => InviteItemModel());
    inviteItemModel17 = createModel(context, () => InviteItemModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    inviteItemModels1.dispose();
    inviteItemModel2.dispose();
    inviteItemModel3.dispose();
    inviteItemModel4.dispose();
    inviteItemModel5.dispose();
    inviteItemModel6.dispose();
    inviteItemModel7.dispose();
    inviteItemModel8.dispose();
    inviteItemModel9.dispose();
    inviteItemModel10.dispose();
    inviteItemModel11.dispose();
    inviteItemModel12.dispose();
    inviteItemModel13.dispose();
    inviteItemModel14.dispose();
    inviteItemModel15.dispose();
    inviteItemModel16.dispose();
    inviteItemModel17.dispose();
  }
}
