import 'password_page_specs.dart';

class QPasswordPage extends PasswordPageSpecs {
  final PasswordPageStyleSet style;

  /// Construtor padrão
  const QPasswordPage({
    required this.style,
    super.pinInputBehaviour,
    required super.pinInputController,
    super.pinInputOnCompleted,
    super.pinInputObscureText,
    super.appBarTitle,
    super.backButtonOnPressed,
    super.title,
    super.body,
    super.tertiaryButtonLabel,
    super.tertiaryButtonOnPressed,
    super.tertiaryButtonBehaviour,
    super.primaryButtonLabel,
    super.primaryButtonOnPressed,
    super.primaryButtonBehaviour,
    super.secondaryButtonLabel,
    super.secondaryButtonOnPressed,
    super.secondaryButtonBehaviour,
    super.key,
  }) : super(styles: style);

  /// Variação regular com texto alinhado a esquerda
  const QPasswordPage.standardLeftText({
    super.pinInputBehaviour,
    required super.pinInputController,
    super.pinInputOnCompleted,
    super.pinInputObscureText,
    super.appBarTitle,
    super.backButtonOnPressed,
    super.title,
    super.body,
    super.tertiaryButtonLabel,
    super.tertiaryButtonOnPressed,
    super.tertiaryButtonBehaviour,
    super.primaryButtonLabel,
    super.primaryButtonOnPressed,
    super.primaryButtonBehaviour,
    super.secondaryButtonLabel,
    super.secondaryButtonOnPressed,
    super.secondaryButtonBehaviour,
    super.key,
  })  : style = PasswordPageStyleSet.standardLeftText,
        super(styles: PasswordPageStyleSet.standardLeftText);

  /// Variação regular com texto centralizado
  const QPasswordPage.standardCenteredText({
    super.pinInputBehaviour,
    required super.pinInputController,
    super.pinInputOnCompleted,
    super.pinInputObscureText,
    super.appBarTitle,
    super.backButtonOnPressed,
    super.title,
    super.body,
    super.tertiaryButtonLabel,
    super.tertiaryButtonOnPressed,
    super.tertiaryButtonBehaviour,
    super.primaryButtonLabel,
    super.primaryButtonOnPressed,
    super.primaryButtonBehaviour,
    super.secondaryButtonLabel,
    super.secondaryButtonOnPressed,
    super.secondaryButtonBehaviour,
    super.autofocus,
    super.key,
  })  : style = PasswordPageStyleSet.standardCenteredText,
        super(styles: PasswordPageStyleSet.standardCenteredText);
}
