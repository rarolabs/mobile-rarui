part of '../transfer_template_page_component.dart';

class _TransferTemplateBody extends StatelessWidget {
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
  final String? primaryButtonHintSemantics;
  final String? secondaryButtonHintSemantics;
  final String? primaryButtonSemantics;
  final String? secondaryButtonSemantics;
  final double? accountBalance;
  final ValueNotifier<bool?> showBalanceNotifier;
  final String? hintAccountBalanceLabel;
  final String? scheduleDateLabel;
  final String? scheduleDateValue;
  final String? scheduleFrequencyLabel;
  final String? scheduleFrequencyValue;
  final VoidCallback? onScheduleDatePressed;
  final VoidCallback? onScheduleFrequencyPressed;

  const _TransferTemplateBody({
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
    required this.coinType,
    required this.showBalanceNotifier,
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
    this.hintAccountBalanceLabel,
    this.onScheduleDatePressed,
    this.onScheduleFrequencyPressed,
    this.scheduleDateLabel,
    this.scheduleDateValue,
    this.scheduleFrequencyLabel,
    this.scheduleFrequencyValue,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * .87,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: QSizes.x16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: QSizes.x32),
            SizedBox(
              height: QSizes.x56,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    child: QLabel(
                      style: styles.specs.regular.titleStyle,
                      behaviour: behaviour,
                      text: titlePage,
                    ),
                  ),
                  if (subtitlePage != null) ...{
                    const SizedBox(height: QSizes.x8),
                    Flexible(
                      child: QLabel(
                        style: styles.specs.regular.subtitleStyle,
                        behaviour: behaviour,
                        text: subtitlePage,
                      ),
                    ),
                  },
                ],
              ),
            ),
            if (onScheduleDatePressed != null)
              const SizedBox(
                height: QSizes.x64,
              )
            else
              const Spacer(),
            Center(
              child: ValueListenableBuilder(
                valueListenable: showBalanceNotifier,
                builder: (_, showBalanceValue, child) {
                  return ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: QSizes.x144,
                      minHeight: QSizes.x144,
                      maxWidth: QSizes.x228,
                    ),
                    child: QMoneyInput(
                      accountBalance: accountBalance,
                      hintAccountBalanceLabel: hintAccountBalanceLabel,
                      formFieldKey: const Key('moneyInput'),
                      initialValue: initialValue,
                      behaviour: inputBehaviour,
                      labelStyle: styles.specs.shared.moneyInputLabelStyle,
                      style: styles.specs.shared.moneyInputStyle,
                      coinType: coinType,
                      hintSemantics: inputHintSemantics,
                      icon: showBalanceValue == null
                          ? null
                          : showBalanceValue
                              ? Icons.visibility_off
                              : Icons.visibility,
                      onIconTap: () {
                        onInputIconTap?.call();
                        showBalanceNotifier.value = !(showBalanceValue ?? false);
                      },
                      onValueChange: onValueChange,
                      label: TextSpan(
                        children: showBalanceValue == null
                            ? [const WidgetSpan(child: SizedBox.shrink())]
                            : [
                                WidgetSpan(
                                  child: QLabel(
                                    style: styles.specs.shared.moneyInputDescriptionStyle,
                                    behaviour: inputBehaviour,
                                    text: moneyInputDescription,
                                  ),
                                ),
                                if (showBalanceValue)
                                  WidgetSpan(
                                    child: QLabel(
                                      style: styles.specs.shared.moneyAccountBalanceStyle,
                                      behaviour: inputBehaviour,
                                      text: '${accountBalance?.formattedMoney(coinType)} ',
                                    ),
                                  )
                                else
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: QSizes.x4),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(QSizes.x4),
                                          color: QTheme.colors.gray2,
                                        ),
                                        width: QSizes.x56,
                                        height: QSizes.x16,
                                      ),
                                    ),
                                  ),
                              ],
                      ),
                    ),
                  );
                },
              ),
            ),
            if (onScheduleDatePressed != null) ...[
              const SizedBox(
                height: QSizes.x40,
              ),
              QLabel.h5Lato20Gray5Bold(
                behaviour: behaviour,
                text: scheduleDateLabel,
              ),
              const SizedBox(
                height: QSizes.x4,
              ),
              GestureDetector(
                onTap: onScheduleDatePressed,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: QSizes.x8,
                  children: [
                    QLabel.paragraphRoboto16Gray4Bold(
                      behaviour: behaviour,
                      text: scheduleDateValue,
                    ),
                    QIcon.size16Secondary(
                      behaviour: behaviour,
                      svgPath: QTheme.svgs.edit,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: QSizes.x16,
              ),
              const SizedBox(
                height: QSizes.x4,
              ),
              QLabel.h5Lato20Gray5Bold(
                behaviour: behaviour,
                text: scheduleFrequencyLabel,
              ),
              GestureDetector(
                onTap: onScheduleFrequencyPressed,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: QSizes.x8,
                  children: [
                    QLabel.paragraphRoboto16Gray4Bold(
                      behaviour: behaviour,
                      text: scheduleFrequencyValue,
                    ),
                    QIcon.size16Secondary(
                      behaviour: behaviour,
                      svgPath: QTheme.svgs.edit,
                    ),
                  ],
                ),
              ),
            ],
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                left: QSizes.x36,
                right: QSizes.x36,
                bottom: QSizes.x48,
              ),
              child: SizedBox(
                height: QSizes.x104,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      child: QButton(
                        key: const Key('primaryButton'),
                        style: styles.specs.shared.primaryButtonStyle,
                        behaviour: primaryButtonBehaviour,
                        text: primaryButtonText,
                        onPressed: onPrimaryButtonPressed,
                        hintSemantics: primaryButtonHintSemantics,
                        buttonSemantics: primaryButtonSemantics,
                      ),
                    ),
                    const SizedBox(height: QSizes.x8),
                    Flexible(
                      child: QButton(
                        key: const Key('secondaryButton'),
                        style: styles.specs.shared.secondaryButtonStyle,
                        behaviour: secondaryButtonBehaviour ?? behaviour,
                        text: secondaryButtonText,
                        onPressed: onSecondaryButtonPressed,
                        hintSemantics: secondaryButtonHintSemantics,
                        buttonSemantics: secondaryButtonSemantics,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
