import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'chech_box_icon_model.dart';
export 'chech_box_icon_model.dart';

class ChechBoxIconWidget extends StatefulWidget {
  const ChechBoxIconWidget({
    super.key,
    bool? initialValue,
    bool? disable,
  })  : initialValue = initialValue ?? false,
        disable = disable ?? false;

  final bool initialValue;
  final bool disable;

  @override
  State<ChechBoxIconWidget> createState() => _ChechBoxIconWidgetState();
}

class _ChechBoxIconWidgetState extends State<ChechBoxIconWidget> {
  late ChechBoxIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChechBoxIconModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.checked = widget.initialValue;
      _model.updatePage(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.0,
      height: 44.0,
      decoration: const BoxDecoration(),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            if (!widget.disable)
              ToggleIcon(
                onPressed: () async {
                  safeSetState(() => _model.checked = !_model.checked);
                },
                value: _model.checked,
                onIcon: Icon(
                  FFIcons.ksquareCheckFilled,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 25.0,
                ),
                offIcon: Icon(
                  FFIcons.ksquareMinus,
                  color: FlutterFlowTheme.of(context).grayTextMiddle,
                  size: 25.0,
                ),
              ),
            if (widget.disable)
              SizedBox(
                width: 44.0,
                height: 44.0,
                child: Stack(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  children: [
                    if (!widget.initialValue)
                      Icon(
                        FFIcons.ksquare,
                        color: FlutterFlowTheme.of(context).accent3,
                        size: 24.0,
                      ),
                    if (widget.initialValue)
                      Icon(
                        FFIcons.kcheckmarkSquare,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
