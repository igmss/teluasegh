import '/components/chech_box_icon/chech_box_icon_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'payment_method_item_model.dart';
export 'payment_method_item_model.dart';

class PaymentMethodItemWidget extends StatefulWidget {
  const PaymentMethodItemWidget({
    super.key,
    this.title,
    this.icon,
    bool? isDefault,
    this.photo,
    bool? showIcon,
  })  : isDefault = isDefault ?? false,
        showIcon = showIcon ?? false;

  final String? title;
  final Widget? icon;
  final bool isDefault;
  final String? photo;
  final bool showIcon;

  @override
  State<PaymentMethodItemWidget> createState() =>
      _PaymentMethodItemWidgetState();
}

class _PaymentMethodItemWidgetState extends State<PaymentMethodItemWidget> {
  late PaymentMethodItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentMethodItemModel());
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
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (widget.showIcon) widget.icon!,
                if (widget.photo != null && widget.photo != '')
                  Container(
                    width: 32.0,
                    height: 32.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Visibility(
                      visible: widget.photo != null && widget.photo != '',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.network(
                          valueOrDefault<String>(
                            widget.photo,
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/netron-e-com-mobile-6rhojr/assets/l7t0cjkr83or/Frame_(4).png',
                          ),
                          width: 32.0,
                          height: 32.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
              ].divide(const SizedBox(width: 8.0)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                child: Text(
                  widget.title!,
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.chechBoxIconModel,
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: ChechBoxIconWidget(
                    initialValue: widget.isDefault,
                    disable: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
