import '/components/header/header_widget.dart';
import '/components/receipt_status/receipt_status_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'e_receipt_widget.dart' show EReceiptWidget;
import 'package:flutter/material.dart';

class EReceiptModel extends FlutterFlowModel<EReceiptWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for ReceiptStatus component.
  late ReceiptStatusModel receiptStatusModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    receiptStatusModel = createModel(context, () => ReceiptStatusModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    receiptStatusModel.dispose();
  }
}
