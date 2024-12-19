import '/components/chech_box_icon/chech_box_icon_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'choose_shipping_item_model.dart';
export 'choose_shipping_item_model.dart';

class ChooseShippingItemWidget extends StatefulWidget {
  const ChooseShippingItemWidget({
    super.key,
    this.title,
    this.icon,
    bool? isDefault,
  }) : isDefault = isDefault ?? false;

  final String? title;
  final Widget? icon;
  final bool isDefault;

  @override
  State<ChooseShippingItemWidget> createState() =>
      _ChooseShippingItemWidgetState();
}

class _ChooseShippingItemWidgetState extends State<ChooseShippingItemWidget> {
  late ChooseShippingItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseShippingItemModel());
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
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 52.0,
              height: 52.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryText,
                shape: BoxShape.circle,
              ),
              child: Icon(
                FFIcons.kcategoryShippingEconomy,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 24.0,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Text(
                            valueOrDefault<String>(
                              widget.title,
                              'Name',
                            ),
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
