import '../../atoms/label/label_specs.dart';
import '../../molecules/button/button_specs.dart';
import '../../molecules/money_input/money_input_specs.dart';
import 'transfer_template_page_component.dart';
import 'transfer_template_page_styles.dart';

class TransferTemplatePageSpecs extends TransferTemplatePageComponent {
  const TransferTemplatePageSpecs({
    super.key,
    required super.behaviour,
    required super.inputBehaviour,
    required super.styles,
    required super.appBarTitle,
    required super.titlePage,
    required super.subtitlePage,
    required super.moneyInputDescription,
    required super.primaryButtonText,
    required super.secondaryButtonText,
    required super.initialValue,
    required super.primaryButtonBehaviour,
    super.accountBalance,
    super.onBackButtonPressed,
    super.showBalance,
    super.coinType,
    super.inputHintSemantics,
    super.onInputIconTap,
    super.onValueChange,
    super.primaryButtonHintSemantics,
    super.secondaryButtonHintSemantics,
    super.primaryButtonSemantics,
    super.secondaryButtonSemantics,
    super.onPrimaryButtonPressed,
    super.onSecondaryButtonPressed,
    super.secondaryButtonBehaviour,
    super.hintAccountBalanceLabel,
    super.scheduleDateLabel,
    super.scheduleDateValue,
    super.scheduleFrequencyLabel,
    super.scheduleFrequencyValue,
    super.onScheduleDatePressed,
    super.onScheduleFrequencyPressed,
  });

  static TransferTemplatePageStyles get standard => TransferTemplatePageStyles(
        shared: TransferTemplatePageSharedStyle(
          moneyInputStyle: MoneyInputStyleSet.transferenciaBaseColor,
          moneyInputLabelStyle: LabelStyleSet.h4Lato24Gray5Bold,
          primaryButtonStyle: ButtonStyleSet.primaryBaseDisableGray3,
          secondaryButtonStyle: ButtonStyleSet.secondaryBase,
          moneyInputDescriptionStyle: LabelStyleSet.captionRoboto12Gray5Regular,
          moneyAccountBalanceStyle: LabelStyleSet.captionRoboto12SecondaryRegular,
        ),
        regular: TransferTemplatePageStyle(
          titleStyle: LabelStyleSet.h5Lato20Gray5Bold,
          subtitleStyle: LabelStyleSet.captionRoboto14Gray4Regular,
        ),
      );
}
