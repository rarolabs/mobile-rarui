import 'package:flutter/material.dart';

import '../../../shared_widget/loading_widget.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../../utils/enums/coin_type.dart';
import '../../../utils/extensions/num_extension.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../../atoms/icon/icon.dart';
import '../../atoms/label/label.dart';
import 'current_balance_specs.dart';
import 'current_balance_style.dart';

class CurrentBalanceComponent extends StatelessWidget with Component<CurrentBalanceStyle, CurrentBalanceSharedStyle> {
  /// Comportamento do componente
  final Behaviour behaviour;

  /// Estilo do componente
  final CurrentBalanceStyleSet styles;

  /// Valor do saldo atual
  final num value;

  /// Label do componente
  final String title;

  /// Define se o valor está oculto
  final bool isHidden;

  /// Texto de acessibilidade
  final String? labelSemantics;

  /// Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  const CurrentBalanceComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.value,
    required this.title,
    this.isHidden = true,
    this.labelSemantics,
    this.hintSemantics,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<CurrentBalanceStyle, CurrentBalanceSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    CurrentBalanceStyle style,
    CurrentBalanceSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    CurrentBalanceStyle style,
    CurrentBalanceSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _CustomCurrentBalance(
      behaviour: behaviour,
      style: style,
      sharedStyle: styles.specs.shared,
      value: value,
      title: title,
      isHidden: isHidden,
    );
  }

  @override
  Widget whenDisabled(
    CurrentBalanceStyle style,
    CurrentBalanceSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _CustomCurrentBalance(
      behaviour: behaviour,
      style: style,
      sharedStyle: styles.specs.shared,
      value: value,
      title: title,
      isHidden: isHidden,
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.disabled,
        Behaviour.processing: Behaviour.disabled,
      };
}

class _CustomCurrentBalance extends StatefulWidget {
  final Behaviour behaviour;
  final CurrentBalanceStyle style;
  final CurrentBalanceSharedStyle sharedStyle;
  final num value;
  final String title;
  final bool isHidden;

  const _CustomCurrentBalance({
    required this.behaviour,
    required this.style,
    required this.sharedStyle,
    required this.value,
    required this.title,
    required this.isHidden,
  });

  @override
  _CurrentBalanceState createState() => _CurrentBalanceState();
}

class _CurrentBalanceState extends State<_CustomCurrentBalance> {
  late bool isHidden;

  @override
  void initState() {
    isHidden = widget.isHidden;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _CustomCurrentBalance oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isHidden != widget.isHidden) isHidden = widget.isHidden;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: QSizes.x44,
      color: QTheme.colors.gray2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: QLabel(
              style: widget.sharedStyle.labelStyle,
              behaviour: widget.behaviour,
              text: widget.title,
              maxLines: 1,
            ),
          ),
          isHidden
              ? Container(height: QSizes.x16, width: QSizes.x80, color: QTheme.colors.gray3)
              : QLabel(
                  style: widget.sharedStyle.labelStyle,
                  behaviour: widget.behaviour,
                  text: '*${widget.value.formattedMoney(CoinType.real)}*',
                ),
          const SizedBox(width: QSizes.x4),
          QIcon(
            behaviour: widget.behaviour,
            style: widget.style.iconStyle,
            svgPath: isHidden ? QTheme.svgs.visibility : QTheme.svgs.visibilityHide,
            onPressed: () => setState(() => isHidden = !isHidden),
          ),
        ],
      ),
    );
  }
}
