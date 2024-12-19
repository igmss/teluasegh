import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'rating_item_button_model.dart';
export 'rating_item_button_model.dart';

class RatingItemButtonWidget extends StatefulWidget {
  const RatingItemButtonWidget({
    super.key,
    this.title,
    this.color,
    this.icon,
  });

  final String? title;
  final Color? color;
  final Widget? icon;

  @override
  State<RatingItemButtonWidget> createState() => _RatingItemButtonWidgetState();
}

class _RatingItemButtonWidgetState extends State<RatingItemButtonWidget> {
  late RatingItemButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingItemButtonModel());
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
      icon: widget.icon,
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
