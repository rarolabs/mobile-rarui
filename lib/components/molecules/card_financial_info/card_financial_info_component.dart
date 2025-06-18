import 'package:flutter/material.dart';

import '../../../rarui.dart';
import '../../../shared_widget/loading_widget.dart';
import '../../../utils/enums/coin_type.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import 'card_financial_info_style.dart';
import 'card_financial_info_style_set.dart';

class CardFinancialInfoComponent extends StatelessWidget
    with Component<CardFinancialInfoStyle, CardFinancialInfoSharedStyle> {
  /// Comportamento do componente
  final Behaviour behaviour;

  /// Estilo do componente
  final CardFinancialInfoStyleSet styles;

  /// Título do componente
  final String title;

  /// Valor do componente
  final double value;

  /// Descrição do limite do componente sem a parte do valor
  final String limitDescription;

  /// Valor do limite do componente
  final double limitValue;

  /// Caminho do ícone de visibilidade do componente
  final String visibilityIconPath;

  /// Caminho do ícone de visibilidade off do componente
  final String visibilityOffIconPath;

  /// Valor a ser exibido
  final bool? showValue;

  /// Callback para mostrar o valor, opcional
  final VoidCallback? onShowValue;

  const CardFinancialInfoComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.title,
    required this.value,
    required this.limitDescription,
    required this.limitValue,
    required this.visibilityIconPath,
    required this.visibilityOffIconPath,
    this.showValue = false,
    this.onShowValue,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<CardFinancialInfoStyle, CardFinancialInfoSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenRegular(
    CardFinancialInfoStyle style,
    CardFinancialInfoSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _CardFinancialInfo(
      style: style,
      otherStyle: otherStyle,
      behaviour: childBehaviour,
      title: title,
      value: value,
      limitDescription: limitDescription,
      limitValue: limitValue,
      visibilityIconPath: visibilityIconPath,
      visibilityOffIconPath: visibilityOffIconPath,
      showValue: showValue ?? false,
      onShowValue: onShowValue,
    );
  }

  @override
  Widget whenLoading(
    CardFinancialInfoStyle style,
    CardFinancialInfoSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: style.loadingStyle);
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };
}

class _CardFinancialInfo extends StatefulWidget {
  final CardFinancialInfoStyle style;
  final CardFinancialInfoSharedStyle otherStyle;
  final Behaviour behaviour;
  final String title;
  final double value;
  final String limitDescription;
  final double limitValue;
  final String visibilityIconPath;
  final String visibilityOffIconPath;
  final bool showValue;
  final VoidCallback? onShowValue;

  const _CardFinancialInfo({
    required this.style,
    required this.otherStyle,
    required this.behaviour,
    required this.title,
    required this.value,
    required this.limitDescription,
    required this.limitValue,
    required this.visibilityIconPath,
    required this.visibilityOffIconPath,
    required this.showValue,
    this.onShowValue,
  });

  @override
  State<_CardFinancialInfo> createState() => _CardFinancialInfoState();
}

class _CardFinancialInfoState extends State<_CardFinancialInfo> {
  final ValueNotifier<bool> _showValue = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _showValue.value = widget.showValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: QSizes.x104,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: widget.style.backgroundColor,
        borderRadius: BorderRadius.circular(QSizes.x8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: QSizes.x8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: QSizes.x8),
            QLabel(
              style: widget.otherStyle.titleStyle,
              text: widget.title,
              behaviour: widget.behaviour,
            ),
            const SizedBox(height: QSizes.x4),
            ValueListenableBuilder(
              valueListenable: _showValue,
              builder: (_, showValue, __) {
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _showValue.value = !showValue;
                        widget.onShowValue?.call();
                      },
                      child: QIcon(
                        behaviour: widget.behaviour,
                        svgPath: _showValue.value ? widget.visibilityIconPath : widget.visibilityOffIconPath,
                        style: widget.otherStyle.valueIconStyle,
                      ),
                    ),
                    const SizedBox(width: QSizes.x8),
                    QLabel(
                      style: widget.otherStyle.valueStyle,
                      text: _showValue.value
                          ? CoinType.real.currencyTextInput.formatDouble(widget.value)
                          : CoinType.real.currencyTextInput.formatDouble(0),
                      behaviour: widget.behaviour,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: QSizes.x4),
            Row(
              children: [
                QLabel(
                  style: widget.otherStyle.limitDescriptionStyle,
                  text: widget.limitDescription,
                  behaviour: widget.behaviour,
                ),
                const SizedBox(width: QSizes.x4),
                QLabel(
                  style: widget.otherStyle.limitValueStyle,
                  text: CoinType.real.currencyTextInput.formatDouble(widget.limitValue),
                  behaviour: widget.behaviour,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
