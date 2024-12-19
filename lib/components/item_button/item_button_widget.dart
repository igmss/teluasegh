import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'item_button_model.dart';
export 'item_button_model.dart';

class ItemButtonWidget extends StatefulWidget {
  const ItemButtonWidget({
    super.key,
    this.title,
    this.color,
  });

  final String? title;
  final Color? color;

  @override
  State<ItemButtonWidget> createState() => _ItemButtonWidgetState();
}

class _ItemButtonWidgetState extends State<ItemButtonWidget> {
  late ItemButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemButtonModel());
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
        color: widget.color,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Inter',
              color: FlutterFlowTheme.of(context).primaryText,
              letterSpacing: 0.0,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).primaryText,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }
}
