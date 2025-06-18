import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../../utils/enums/coin_type.dart';
import '../../../utils/extensions/money_extension.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../atoms/label/label.dart';
import '../../atoms/label/label_specs.dart';
import 'money_input_specs.dart';
import 'money_input_style.dart';

class MoneyInputComponent extends StatelessWidget with Component<MoneyInputStyle, MoneyInputSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Estilo do componente
  final MoneyInputStyleSet styles;

  /// Estilo do texto
  final LabelStyleSet labelStyle;

  /// Chave do TextFormField
  final Key formFieldKey;

  /// Ação para Alterar, validar (formatar) o widget
  final ValueChanged<String>? onValueChange;

  /// Valor inicial
  final double? initialValue;

  /// coinType a ser utilizada
  final CoinType coinType;

  /// Label do componente
  final TextSpan label;

  /// Icone do componente
  final IconData? icon;

  /// Ação do tap do ícone
  final VoidCallback? onIconTap;

  /// Habilita/Desabilita o campo form para inserir valor
  final bool enabled;

  /// Controller do TextFormField
  final TextEditingController? controller;

  /// Texto que dirá a condição para o formulário ser válido
  final String? hintLabel;

  //Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  /// Saldo atual do usuário
  final double? accountBalance;

  /// valor minimio do input para disparar a borda de erro
  final double? minValue;

  /// valor máximo do input para disparar a borda de erro
  final double? maxValue;

  /// Texto de erro abaixo do input
  final String? errorText;

  /// Texto que dirá a condição do saldo atual em relação ao valor digitado
  final String? hintAccountBalanceLabel;

  const MoneyInputComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.labelStyle,
    required this.formFieldKey,
    this.accountBalance,
    this.hintAccountBalanceLabel,
    this.label = const TextSpan(text: ''),
    this.initialValue,
    this.coinType = CoinType.real,
    this.onValueChange,
    this.icon,
    this.onIconTap,
    this.enabled = true,
    this.controller,
    this.hintLabel,
    this.hintSemantics,
    this.minValue,
    this.maxValue,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<MoneyInputStyle, MoneyInputSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
      error: styles.specs.error,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    MoneyInputStyle style,
    MoneyInputSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: QSizes.x4,
      children: [
        LoadingWidget(style: otherStyle.loadingStyle),
        SizedBox(
          width: style.dividerWidth,
          child: Divider(
            height: QSizes.x0,
            thickness: QSizes.x0,
            color: style.dividerColor,
          ),
        ),
        LoadingWidget(style: otherStyle.loadingStyle),
      ],
    );
  }

  @override
  Widget whenRegular(
    MoneyInputStyle style,
    MoneyInputSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _BasicMoneyInput(
      behaviour: childBehaviour,
      formFieldKey: formFieldKey,
      initialValue: initialValue,
      style: style,
      onValueChange: onValueChange,
      coinType: coinType,
      label: label,
      icon: icon,
      enabled: enabled,
      controller: controller,
      onIconTap: onIconTap,
      hintLabel: hintLabel,
      accountBalance: accountBalance,
      hintAccountBalanceLabel: hintAccountBalanceLabel,
      minValue: minValue,
      maxValue: maxValue,
      errorText: errorText,
    );
  }

  @override
  Widget whenDisabled(
    MoneyInputStyle style,
    MoneyInputSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _BasicMoneyInput(
      behaviour: childBehaviour,
      formFieldKey: formFieldKey,
      initialValue: initialValue,
      style: style,
      onValueChange: onValueChange,
      coinType: coinType,
      label: label,
      icon: icon,
      enabled: enabled,
      controller: controller,
      onIconTap: onIconTap,
      hintLabel: hintLabel,
      accountBalance: accountBalance,
      hintAccountBalanceLabel: hintAccountBalanceLabel,
      minValue: minValue,
    );
  }

  @override
  Widget whenError(
    MoneyInputStyle style,
    MoneyInputSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _BasicMoneyInput(
      behaviour: childBehaviour,
      formFieldKey: formFieldKey,
      initialValue: initialValue,
      style: style,
      onValueChange: onValueChange,
      coinType: coinType,
      label: label,
      icon: icon,
      enabled: enabled,
      controller: controller,
      onIconTap: onIconTap,
      hintLabel: hintLabel,
      accountBalance: accountBalance,
      hintAccountBalanceLabel: hintAccountBalanceLabel,
      minValue: minValue,
      maxValue: maxValue,
      errorText: errorText,
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.processing: Behaviour.regular,
      };
}

class _BasicMoneyInput extends StatefulWidget {
  const _BasicMoneyInput({
    required this.behaviour,
    required this.formFieldKey,
    required this.style,
    this.initialValue,
    this.onValueChange,
    required this.coinType,
    required this.label,
    this.icon,
    required this.enabled,
    this.controller,
    this.onIconTap,
    this.hintLabel,
    this.accountBalance,
    this.hintAccountBalanceLabel,
    this.minValue,
    this.maxValue,
    this.errorText,
  });

  final Behaviour behaviour;
  final Key formFieldKey;
  final MoneyInputStyle style;
  final double? initialValue;
  final ValueChanged<String>? onValueChange;
  final TextSpan label;
  final CoinType coinType;
  final IconData? icon;
  final bool enabled;
  final TextEditingController? controller;
  final VoidCallback? onIconTap;
  final String? hintLabel;
  final double? accountBalance;
  final String? hintAccountBalanceLabel;
  final double? minValue;
  final double? maxValue;
  final String? errorText;

  @override
  State<_BasicMoneyInput> createState() => _BasicMoneyInputState();
}

class _BasicMoneyInputState extends State<_BasicMoneyInput> {
  ValueNotifier<InputBorder> textformfieldBorder = ValueNotifier(InputBorder.none);
  late double valueInputed;

  /// Caso o componente tenha uma borda na cor [baseColor]
  /// Setada no seu [style]
  late final bool hasGreenBorderStyle;

  @override
  void initState() {
    super.initState();
    hasGreenBorderStyle = widget.style.successBorder != null;
    valueInputed = widget.initialValue ?? widget.controller?.text.toDoubleMoney(widget.coinType) ?? 0;
    if (hasGreenBorderStyle) manageBorder(valueInputed);
  }

  /// Inicializa o border do textformfield caso tenha a borda na cor [baseColor]
  void manageBorder(double value) {
    if (widget.accountBalance != null && value > widget.accountBalance!) {
      textformfieldBorder.value = widget.style.errorBorder!;
    } else if (widget.minValue != null && value < widget.minValue!) {
      textformfieldBorder.value = widget.style.errorBorder!;
    } else if (widget.maxValue != null && value > widget.maxValue!) {
      textformfieldBorder.value = widget.style.errorBorder!;
    } else if (value > 0) {
      textformfieldBorder.value = widget.style.successBorder!;
    } else {
      textformfieldBorder.value = widget.style.normalBorder!;
    }
  }

  @override
  void dispose() {
    textformfieldBorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: QSizes.x4,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: textformfieldBorder,
            builder: (_, border, child) => TextFormField(
              key: widget.formFieldKey,
              controller: widget.controller,
              enabled: (widget.behaviour.isRegular || widget.behaviour.isError) && widget.enabled,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              initialValue: widget.initialValue == null
                  ? null
                  : widget.coinType.currencyTextInput.formatDouble(widget.initialValue!),
              keyboardType: TextInputType.number,
              inputFormatters: [
                widget.coinType.currencyTextInput
              ],
              decoration: InputDecoration(
                isDense: true,
                border: border,
                contentPadding: EdgeInsets.zero,
                focusedBorder: border,
                enabledBorder: border,
              ),
              onChanged: (value) {
                valueInputed = value.trim().isEmpty ? 0 : value.toDoubleMoney(widget.coinType);
                widget.onValueChange?.call(value);
                if (hasGreenBorderStyle) manageBorder(valueInputed);
              },
              textAlign: TextAlign.center,
              style: widget.style.textStyle,
            ),
          ),
          if (!hasGreenBorderStyle)
            SizedBox(
              width: widget.style.dividerWidth,
              child: Divider(
                height: QSizes.x0,
                thickness: QSizes.x0,
                color: widget.style.dividerColor,
              ),
            ),
          if (widget.errorText != null)
            QLabel(
              behaviour: Behaviour.error,
              text: widget.errorText,
              style: widget.style.errorTextStyle,
            )
          else if (widget.hintLabel?.isNotEmpty ?? false)
            QLabel(
              style: widget.style.hintLabelStyle,
              behaviour: Behaviour.regular,
              text: widget.hintLabel!,
            ),
          Padding(
            padding: const EdgeInsets.only(
              top: QSizes.x8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: RichText(text: widget.label)),
                if (widget.icon != null)
                  GestureDetector(
                    key: const Key('iconTap'),
                    onTap: widget.onIconTap,
                    child: Icon(
                      widget.icon!,
                      size: QSizes.x12,
                      color: QTheme.colors.gray5,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: QSizes.x24),
          if (widget.accountBalance != null &&
              valueInputed > widget.accountBalance! &&
              (widget.hintAccountBalanceLabel?.isNotEmpty ?? false))
            QLabel(
              style: widget.style.hintBalanceStyle,
              behaviour: Behaviour.error,
              text: widget.hintAccountBalanceLabel,
            ),
        ],
      ),
    );
  }
}
