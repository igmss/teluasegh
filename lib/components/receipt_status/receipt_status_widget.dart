import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'receipt_status_model.dart';
export 'receipt_status_model.dart';

class ReceiptStatusWidget extends StatefulWidget {
  const ReceiptStatusWidget({
    super.key,
    this.status,
    this.color,
  });

  final String? status;
  final Color? color;

  @override
  State<ReceiptStatusWidget> createState() => _ReceiptStatusWidgetState();
}

class _ReceiptStatusWidgetState extends State<ReceiptStatusWidget> {
  late ReceiptStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReceiptStatusModel());
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
        color: widget.color,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 10.0, 6.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              widget.status!,
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
