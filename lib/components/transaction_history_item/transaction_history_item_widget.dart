import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'transaction_history_item_model.dart';
export 'transaction_history_item_model.dart';

class TransactionHistoryItemWidget extends StatefulWidget {
  const TransactionHistoryItemWidget({
    super.key,
    required this.amount,
    required this.date,
    bool? isExpense,
    bool? isTopUp,
    bool? isRefund,
  })  : isExpense = isExpense ?? false,
        isTopUp = isTopUp ?? false,
        isRefund = isRefund ?? false;

  final double? amount;
  final DateTime? date;
  final bool isExpense;
  final bool isTopUp;
  final bool isRefund;

  @override
  State<TransactionHistoryItemWidget> createState() =>
      _TransactionHistoryItemWidgetState();
}

class _TransactionHistoryItemWidgetState
    extends State<TransactionHistoryItemWidget> {
  late TransactionHistoryItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionHistoryItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 15.0,
            color: Color(0x0F000000),
            offset: Offset(
              0.0,
              8.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryText,
                  shape: BoxShape.circle,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    children: [
                      if (widget.isTopUp)
                        Icon(
                          FFIcons.karrowUp,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 32.0,
                        ),
                      if (widget.isExpense)
                        Icon(
                          FFIcons.kshoppingBagDefault,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 32.0,
                        ),
                      if (widget.isRefund)
                        Icon(
                          FFIcons.kshoppingBagDefault,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 32.0,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            if (widget.isExpense)
                              Icon(
                                FFIcons.karrowUp,
                                color: FlutterFlowTheme.of(context).error,
                                size: 20.0,
                              ),
                            if (widget.isTopUp)
                              Icon(
                                FFIcons.karrowDown,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 20.0,
                              ),
                            if (widget.isRefund)
                              Icon(
                                FFIcons.karrowDown,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 20.0,
                              ),
                          ],
                        ),
                        Expanded(
                          child: Text(
                            valueOrDefault<String>(
                              formatNumber(
                                widget.amount,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.automatic,
                                currency: '\$',
                              ),
                              '0',
                            ),
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Inter',
                                  color: valueOrDefault<Color>(
                                    () {
                                      if (widget.isExpense) {
                                        return FlutterFlowTheme.of(context)
                                            .error;
                                      } else if (widget.isTopUp) {
                                        return FlutterFlowTheme.of(context)
                                            .secondary;
                                      } else if (widget.isRefund) {
                                        return FlutterFlowTheme.of(context)
                                            .primary;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .primaryText;
                                      }
                                    }(),
                                    FlutterFlowTheme.of(context).primaryText,
                                  ),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 8.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            dateTimeFormat(
                              "yMMMd",
                              widget.date,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                          child: VerticalDivider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).grayTextMiddle,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            dateTimeFormat(
                              "jm",
                              widget.date,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(height: 8.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
