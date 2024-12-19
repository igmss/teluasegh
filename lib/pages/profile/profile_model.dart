import '/components/nav_bar_widget.dart';
import '/components/setting_item/setting_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for support.
  late SettingItemModel supportModel;
  // Model for addresses.
  late SettingItemModel addressesModel;
  // Model for paymethods.
  late SettingItemModel paymethodsModel1;
  // Model for paymethods.
  late SettingItemModel paymethodsModel2;
  // Model for SettingItem component.
  late SettingItemModel settingItemModel1;
  // Model for SettingItem component.
  late SettingItemModel settingItemModel2;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Model for privacy.
  late SettingItemModel privacyModel;
  // Model for helpcenter.
  late SettingItemModel helpcenterModel;
  // Model for invite.
  late SettingItemModel inviteModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    supportModel = createModel(context, () => SettingItemModel());
    addressesModel = createModel(context, () => SettingItemModel());
    paymethodsModel1 = createModel(context, () => SettingItemModel());
    paymethodsModel2 = createModel(context, () => SettingItemModel());
    settingItemModel1 = createModel(context, () => SettingItemModel());
    settingItemModel2 = createModel(context, () => SettingItemModel());
    privacyModel = createModel(context, () => SettingItemModel());
    helpcenterModel = createModel(context, () => SettingItemModel());
    inviteModel = createModel(context, () => SettingItemModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    supportModel.dispose();
    addressesModel.dispose();
    paymethodsModel1.dispose();
    paymethodsModel2.dispose();
    settingItemModel1.dispose();
    settingItemModel2.dispose();
    privacyModel.dispose();
    helpcenterModel.dispose();
    inviteModel.dispose();
    navBarModel.dispose();
  }
}
