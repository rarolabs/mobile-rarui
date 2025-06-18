import 'package:flutter/material.dart';

import '../../../rarui.dart';
import '../../../utils/enums/coin_type.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import 'transfer_template_page_style_set.dart';
import 'transfer_template_page_styles.dart';

part 'widget/transfer_template_body.dart';

class TransferTemplatePageComponent extends StatelessWidget
    with Component<TransferTemplatePageStyle, TransferTemplatePageSharedStyle> {
  /// Controla o comportamento do componente
  final Behaviour behaviour;

  /// Controla o estilo do componente
  final TransferTemplatePageStyleSet styles;

  /// Título da página
  final String appBarTitle;

  /// Título da página
  final String titlePage;

  /// Subtítulo da página
  final String? subtitlePage;

  /// Label do input de dinheiro
  final String? moneyInputDescription;

  /// Texto do primeiro botão
  final String primaryButtonText;

  /// Texto do segundo botão
  final String secondaryButtonText;

  /// Valor inicial do input de dinheiro
  final double initialValue;

  /// Comportamento do primeiro botão
  final Behaviour primaryButtonBehaviour;

  /// Comportamento do segundo botão
  /// Atualmente usa o [behaviour] da pagina.
  /// Use quando o [behaviour] for mais especifico.
  final Behaviour? secondaryButtonBehaviour;

  /// Callback do primeiro botão
  final VoidCallback? onPrimaryButtonPressed;

  /// Callback do segundo botão
  final VoidCallback? onSecondaryButtonPressed;

  /// Semântica do botão de ajuda do primeiro botão
  final String? primaryButtonHintSemantics;

  /// Semântica do botão de ajuda do segundo botão
  final String? secondaryButtonHintSemantics;

  /// Semântica do primeiro botão
  final String? primaryButtonSemantics;

  /// Semântica do segundo botão
  final String? secondaryButtonSemantics;

  /// Tipo de moeda
  final CoinType coinType;

  /// Semântica do input de ajuda
  final String? inputHintSemantics;

  /// Callback do input de ajuda
  final VoidCallback? onInputIconTap;

  /// Callback do input de valor
  final void Function(String)? onValueChange;

  /// Saldo da conta
  final double? accountBalance;

  /// Se deve mostrar o saldo da conta, se for `null` não deve exibir o componente de saldo
  final bool? showBalance;

  /// Texto data de agendamento
  final String? scheduleDateLabel;

  /// Valor da data de agendamento
  final String? scheduleDateValue;

  /// Texto frequencia de agendamento
  final String? scheduleFrequencyLabel;

  /// Valor da frequencia de agendamento
  final String? scheduleFrequencyValue;

  /// Ação do tap da data de agendamento
  final VoidCallback? onScheduleDatePressed;

  /// Ação do tap da frequencia de agendamento
  final VoidCallback? onScheduleFrequencyPressed;

  /// Comportamento do input
  final Behaviour inputBehaviour;

  /// Callback do botão de voltar da app bar
  final VoidCallback? onBackButtonPressed;

  /// Texto que dirá a condição do saldo atual em relação ao valor digitado
  final String? hintAccountBalanceLabel;

  const TransferTemplatePageComponent({
    super.key,
    required this.behaviour,
    required this.inputBehaviour,
    required this.styles,
    required this.appBarTitle,
    required this.titlePage,
    required this.subtitlePage,
    required this.moneyInputDescription,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    required this.initialValue,
    required this.primaryButtonBehaviour,
    required this.accountBalance,
    this.showBalance,
    this.coinType = CoinType.real,
    this.inputHintSemantics,
    this.onInputIconTap,
    this.onValueChange,
    this.secondaryButtonBehaviour,
    this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
    this.primaryButtonHintSemantics,
    this.secondaryButtonHintSemantics,
    this.primaryButtonSemantics,
    this.secondaryButtonSemantics,
    this.onBackButtonPressed,
    this.hintAccountBalanceLabel,
    this.scheduleDateLabel,
    this.scheduleDateValue,
    this.scheduleFrequencyLabel,
    this.scheduleFrequencyValue,
    this.onScheduleDatePressed,
    this.onScheduleFrequencyPressed,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<TransferTemplatePageStyle, TransferTemplatePageSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenRegular(
    TransferTemplatePageStyle style,
    TransferTemplatePageSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _TransferTemplatePage(
      behaviour: behaviour,
      inputBehaviour: inputBehaviour,
      styles: styles,
      appBarTitle: appBarTitle,
      titlePage: titlePage,
      subtitlePage: subtitlePage,
      moneyInputDescription: moneyInputDescription,
      primaryButtonText: primaryButtonText,
      secondaryButtonText: secondaryButtonText,
      initialValue: initialValue,
      primaryButtonBehaviour: primaryButtonBehaviour,
      secondaryButtonBehaviour: secondaryButtonBehaviour,
      onPrimaryButtonPressed: onPrimaryButtonPressed,
      onSecondaryButtonPressed: onSecondaryButtonPressed,
      primaryButtonHintSemantics: primaryButtonHintSemantics,
      secondaryButtonHintSemantics: secondaryButtonHintSemantics,
      primaryButtonSemantics: primaryButtonSemantics,
      secondaryButtonSemantics: secondaryButtonSemantics,
      showBalance: showBalance,
      accountBalance: accountBalance,
      coinType: coinType,
      inputHintSemantics: inputHintSemantics,
      onInputIconTap: onInputIconTap,
      onValueChange: onValueChange,
      scheduleDateLabel: scheduleDateLabel,
      scheduleDateValue: scheduleDateValue,
      scheduleFrequencyLabel: scheduleFrequencyLabel,
      scheduleFrequencyValue: scheduleFrequencyValue,
      onBackButtonPressed: onBackButtonPressed,
      hintAccountBalanceLabel: hintAccountBalanceLabel,
      onScheduleDatePressed: onScheduleDatePressed,
      onScheduleFrequencyPressed: onScheduleFrequencyPressed,
    );
  }

  @override
  Widget whenLoading(
    TransferTemplatePageStyle style,
    TransferTemplatePageSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _TransferTemplatePage(
      behaviour: behaviour,
      inputBehaviour: inputBehaviour,
      styles: styles,
      appBarTitle: appBarTitle,
      titlePage: titlePage,
      subtitlePage: subtitlePage,
      moneyInputDescription: moneyInputDescription,
      primaryButtonText: primaryButtonText,
      secondaryButtonText: secondaryButtonText,
      initialValue: initialValue,
      primaryButtonBehaviour: primaryButtonBehaviour,
      secondaryButtonBehaviour: secondaryButtonBehaviour,
      onPrimaryButtonPressed: onPrimaryButtonPressed,
      onSecondaryButtonPressed: onSecondaryButtonPressed,
      primaryButtonHintSemantics: primaryButtonHintSemantics,
      secondaryButtonHintSemantics: secondaryButtonHintSemantics,
      primaryButtonSemantics: primaryButtonSemantics,
      secondaryButtonSemantics: secondaryButtonSemantics,
      showBalance: showBalance,
      accountBalance: accountBalance,
      coinType: coinType,
      inputHintSemantics: inputHintSemantics,
      onInputIconTap: onInputIconTap,
      onValueChange: onValueChange,
      onBackButtonPressed: onBackButtonPressed,
      hintAccountBalanceLabel: hintAccountBalanceLabel,
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
      };
}

class _TransferTemplatePage extends StatefulWidget {
  final Behaviour behaviour;
  final Behaviour inputBehaviour;
  final Behaviour primaryButtonBehaviour;
  final Behaviour? secondaryButtonBehaviour;
  final TransferTemplatePageStyleSet styles;
  final String appBarTitle;
  final String titlePage;
  final String? subtitlePage;
  final String? moneyInputDescription;
  final String primaryButtonText;
  final String secondaryButtonText;
  final double initialValue;
  final CoinType coinType;
  final String? inputHintSemantics;
  final VoidCallback? onInputIconTap;
  final void Function(String)? onValueChange;
  final VoidCallback? onPrimaryButtonPressed;
  final VoidCallback? onSecondaryButtonPressed;
  final VoidCallback? onBackButtonPressed;
  final String? primaryButtonHintSemantics;
  final String? secondaryButtonHintSemantics;
  final String? primaryButtonSemantics;
  final String? secondaryButtonSemantics;
  final bool? showBalance;
  final double? accountBalance;
  final String? hintAccountBalanceLabel;
  final String? scheduleDateLabel;
  final String? scheduleDateValue;
  final String? scheduleFrequencyLabel;
  final String? scheduleFrequencyValue;
  final VoidCallback? onScheduleDatePressed;
  final VoidCallback? onScheduleFrequencyPressed;

  const _TransferTemplatePage({
    required this.behaviour,
    required this.inputBehaviour,
    required this.styles,
    required this.appBarTitle,
    required this.titlePage,
    required this.subtitlePage,
    required this.moneyInputDescription,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    required this.initialValue,
    required this.primaryButtonBehaviour,
    required this.coinType,
    required this.showBalance,
    required this.accountBalance,
    this.inputHintSemantics,
    this.onInputIconTap,
    this.onValueChange,
    this.secondaryButtonBehaviour,
    this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
    this.primaryButtonHintSemantics,
    this.secondaryButtonHintSemantics,
    this.primaryButtonSemantics,
    this.secondaryButtonSemantics,
    this.onBackButtonPressed,
    this.hintAccountBalanceLabel,
    this.scheduleDateLabel,
    this.scheduleDateValue,
    this.scheduleFrequencyLabel,
    this.scheduleFrequencyValue,
    this.onScheduleDatePressed,
    this.onScheduleFrequencyPressed,
  });

  @override
  State<_TransferTemplatePage> createState() => _TransferTemplatePageState();
}

class _TransferTemplatePageState extends State<_TransferTemplatePage> {
  late final ValueNotifier<bool?> _showBalance;

  @override
  void initState() {
    super.initState();
    _showBalance = ValueNotifier<bool?>(widget.showBalance);
  }

  @override
  void didUpdateWidget(_TransferTemplatePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.showBalance != widget.showBalance) {
      _showBalance.value = widget.showBalance;
    }
  }

  @override
  void dispose() {
    _showBalance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: QAppBar.standard(
        behaviour: widget.behaviour,
        title: widget.appBarTitle,
        onPressedBackButton: widget.onBackButtonPressed,
      ),
      body: SingleChildScrollView(
        child: _TransferTemplateBody(
          key: widget.key,
          behaviour: widget.behaviour,
          inputBehaviour: widget.inputBehaviour,
          primaryButtonBehaviour: widget.primaryButtonBehaviour,
          secondaryButtonBehaviour: widget.secondaryButtonBehaviour,
          styles: widget.styles,
          appBarTitle: widget.appBarTitle,
          titlePage: widget.titlePage,
          subtitlePage: widget.subtitlePage,
          moneyInputDescription: widget.moneyInputDescription,
          primaryButtonText: widget.primaryButtonText,
          secondaryButtonText: widget.secondaryButtonText,
          initialValue: widget.initialValue,
          coinType: widget.coinType,
          showBalanceNotifier: _showBalance,
          accountBalance: widget.accountBalance,
          hintAccountBalanceLabel: widget.hintAccountBalanceLabel,
          inputHintSemantics: widget.inputHintSemantics,
          onInputIconTap: widget.onInputIconTap,
          onValueChange: widget.onValueChange,
          onPrimaryButtonPressed: widget.onPrimaryButtonPressed,
          onSecondaryButtonPressed: widget.onSecondaryButtonPressed,
          primaryButtonHintSemantics: widget.primaryButtonHintSemantics,
          secondaryButtonHintSemantics: widget.secondaryButtonHintSemantics,
          primaryButtonSemantics: widget.primaryButtonSemantics,
          secondaryButtonSemantics: widget.secondaryButtonSemantics,
          scheduleDateLabel: widget.scheduleDateLabel,
          scheduleDateValue: widget.scheduleDateValue,
          scheduleFrequencyLabel: widget.scheduleFrequencyLabel,
          scheduleFrequencyValue: widget.scheduleFrequencyValue,
          onScheduleDatePressed: widget.onScheduleDatePressed,
          onScheduleFrequencyPressed: widget.onScheduleFrequencyPressed,
        ),
      ),
    );
  }
}
