import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'f_a_q_button_item_model.dart';
export 'f_a_q_button_item_model.dart';

class FAQButtonItemWidget extends StatefulWidget {
  const FAQButtonItemWidget({
    super.key,
    this.title,
  });

  final String? title;

  @override
  State<FAQButtonItemWidget> createState() => _FAQButtonItemWidgetState();
}

class _FAQButtonItemWidgetState extends State<FAQButtonItemWidget> {
  late FAQButtonItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FAQButtonItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: widget.title!,
      options: FFButtonOptions(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 8.0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primaryText,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Inter',
              color: FlutterFlowTheme.of(context).secondaryBackground,
              letterSpacing: 0.0,
            ),
        elevation: 0.0,
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }
}
