import '/backend/backend.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'customer_support_widget.dart' show CustomerSupportWidget;
import 'package:flutter/material.dart';

class CustomerSupportModel extends FlutterFlowModel<CustomerSupportWidget> {
  ///  Local state fields for this page.

  bool hasAttachment = false;

  String? imageAttachment = '';

  String? audioAttachment = '';

  String? videoAttachment = '';

  bool attachMenu = false;

  bool uplaoding = false;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for CustomerServiceColumn widget.
  ScrollController? customerServiceColumn;
  // State field(s) for message widget.
  FocusNode? messageFocusNode;
  TextEditingController? messageTextController;
  String? Function(BuildContext, String?)? messageTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in send widget.
  SupportMesagesRecord? messageCreated;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  /// Query cache managers for this widget.

  final _supportMessagesUserManager =
      StreamRequestManager<List<SupportMesagesRecord>>();
  Stream<List<SupportMesagesRecord>> supportMessagesUser({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<SupportMesagesRecord>> Function() requestFn,
  }) =>
      _supportMessagesUserManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSupportMessagesUserCache() => _supportMessagesUserManager.clear();
  void clearSupportMessagesUserCacheKey(String? uniqueKey) =>
      _supportMessagesUserManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    customerServiceColumn = ScrollController();
  }

  @override
  void dispose() {
    headerModel.dispose();
    customerServiceColumn?.dispose();
    messageFocusNode?.dispose();
    messageTextController?.dispose();

    /// Dispose query cache managers for this widget.

    clearSupportMessagesUserCache();
  }
}
