part of 'button_specs.dart';

enum ButtonStyleSet {
  primaryBase,
  primaryBaseDisableGray3,
  secondaryBase,
  primaryLight,
  primaryRed,
  primarySuccess,
  secondaryGray1,
  secondarySuccess,
  secondaryError,
  tertiaryPrimaryBase,
  tertiaryCiano,
  tertiaryGray9,
  withIconPrimaryBase,
  withIconWhite,
  withIconGray7,
  dashedBorder,
  withIconPrimaryBaseAndSecondaryBase,
  filter,
  white,
  cashback;

  const ButtonStyleSet();

  QButtonStyles get specs {
    return switch (this) {
      primaryBase => ButtonSpecs.primaryBaseStyle,
      primaryBaseDisableGray3 => ButtonSpecs.primaryBaseDisableGray3Style,
      secondaryBase => ButtonSpecs.secondaryBaseStyle,
      primaryLight => ButtonSpecs.primaryLightStyle,
      primaryRed => ButtonSpecs.primaryRedStyle,
      primarySuccess => ButtonSpecs.primarySuccessStyle,
      secondaryGray1 => ButtonSpecs.secondaryGray1Style,
      secondarySuccess => ButtonSpecs.secondarySuccessStyle,
      secondaryError => ButtonSpecs.secondaryErrorStyle,
      tertiaryPrimaryBase => ButtonSpecs.tertiaryPrimaryBaseStyle,
      tertiaryCiano => ButtonSpecs.tertiaryCianoStyle,
      tertiaryGray9 => ButtonSpecs.tertiaryGray9Style,
      withIconPrimaryBase => ButtonSpecs.withIconPrimaryBaseStyle,
      withIconWhite => ButtonSpecs.withIconWhiteStyle,
      withIconGray7 => ButtonSpecs.withIconGray7Style,
      dashedBorder => ButtonSpecs.dashedBorderStyle,
      withIconPrimaryBaseAndSecondaryBase => ButtonSpecs.withIconPrimaryBaseAndSecondaryBaseStyle,
      filter => ButtonSpecs.filterStyle,
      cashback => ButtonSpecs.cashback,
      white => ButtonSpecs.whiteStyle,
    };
  }
}
