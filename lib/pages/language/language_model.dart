import '/components/header/header_widget.dart';
import '/components/languages_item/languages_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'language_widget.dart' show LanguageWidget;
import 'package:flutter/material.dart';

class LanguageModel extends FlutterFlowModel<LanguageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for en.
  late LanguagesItemModel enModel;
  // Model for es.
  late LanguagesItemModel esModel;
  // Model for fr.
  late LanguagesItemModel frModel;
  // Model for ar.
  late LanguagesItemModel arModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    enModel = createModel(context, () => LanguagesItemModel());
    esModel = createModel(context, () => LanguagesItemModel());
    frModel = createModel(context, () => LanguagesItemModel());
    arModel = createModel(context, () => LanguagesItemModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    enModel.dispose();
    esModel.dispose();
    frModel.dispose();
    arModel.dispose();
  }
}
