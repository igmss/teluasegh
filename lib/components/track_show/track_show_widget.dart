import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'track_show_model.dart';
export 'track_show_model.dart';

class TrackShowWidget extends StatefulWidget {
  const TrackShowWidget({
    super.key,
    this.titleIcon,
    Color? color,
  }) : color = color ?? const Color(0xFFE0E0E0);

  final Widget? titleIcon;
  final Color color;

  @override
  State<TrackShowWidget> createState() => _TrackShowWidgetState();
}

class _TrackShowWidgetState extends State<TrackShowWidget> {
  late TrackShowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackShowModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          widget.titleIcon!,
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Icon(
              FFIcons.kcircleCheckFilled,
              color: widget.color,
              size: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
