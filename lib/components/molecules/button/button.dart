import 'button_specs.dart';

class QButton extends ButtonSpecs {
  ///********************************************************************************** */
  /// [PADRAO] DE NOMEACAO
  /// Botao que tem cor de fundo -> [primary]
  /// Botao que tem borda outlined e fundo transparente -> [secondary]
  /// Botao que tem apenas uma label, sem bordas e cor de fundo -> [tertiary]
  ///
  /// LOGICA:
  /// [tipo] + [cor]
  /// Exemplo: [primaryBase] -> Botao que contem fundo preenchido por alguma cor [primary]
  /// e essa cor de fundo é [base]
  ///
  ///********************************************************************************** */

  /// Style configuration for [QButton]
  final ButtonStyleSet style;

  const QButton({
    required this.style,
    super.key,
    required super.behaviour,
    super.text,
    super.onPressed,
    super.buttonSemantics,
    super.hintSemantics,
    super.leadingIconPath,
    super.trailingIconPath,
  }) : super(styles: style);

  /// Botao com borda [outlined] na cor [primary]
  /// Fundo [transparente]
  /// Texto [branco]
  const QButton.primaryBase({
    super.key,
    required super.behaviour,
    super.text,
    super.onPressed,
    super.buttonSemantics,
    super.hintSemantics,
  })  : style = ButtonStyleSet.primaryBase,
        super(
          styles: ButtonStyleSet.primaryBase,
        );

  /// Botao com fundo na cor [successColorBase]
  /// Texto [branco]
  const QButton.primarySuccess({
    super.key,
    required super.behaviour,
    super.text,
    super.onPressed,
    super.buttonSemantics,
    super.hintSemantics,
  })  : style = ButtonStyleSet.primarySuccess,
        super(
          styles: ButtonStyleSet.primarySuccess,
        );

  /// Botao com fundo na cor [light]
  /// Texto [branco]
  const QButton.primaryLight({
    super.key,
    required super.behaviour,
    super.text,
    super.onPressed,
  })  : style = ButtonStyleSet.primaryLight,
        super(
          styles: ButtonStyleSet.primaryLight,
        );

  /// Botao com fundo na cor [primary] vermelha
  /// Texto [branco]
  const QButton.primaryRed({
    super.key,
    required super.behaviour,
    super.text,
    super.onPressed,
    super.buttonSemantics,
    super.hintSemantics,
  })  : style = ButtonStyleSet.primaryRed,
        super(
          styles: ButtonStyleSet.primaryRed,
        );

  /// Botao com fundo na cor [primary]
  /// Texto [branco]
  const QButton.secondaryBase({
    super.key,
    required super.behaviour,
    super.text,
    super.onPressed,
    super.buttonSemantics,
    super.hintSemantics,
  })  : style = ButtonStyleSet.secondaryBase,
        super(
          styles: ButtonStyleSet.secondaryBase,
        );

  /// Botao com borda [outlined] com cor [gray1]
  /// Fundo [transparente]
  /// Texto [branco]
  const QButton.secondaryGray1({
    super.key,
    required super.behaviour,
    super.text,
    super.onPressed,
  })  : style = ButtonStyleSet.secondaryGray1,
        super(
          styles: ButtonStyleSet.secondaryGray1,
        );

  /// Botao com borda [outlined] com cor [successColorBase]
  /// Fundo [transparente]
  /// Texto [successColorBase]
  const QButton.secondarySuccess({
    super.key,
    required super.behaviour,
    super.text,
    super.onPressed,
  })  : style = ButtonStyleSet.secondarySuccess,
        super(
          styles: ButtonStyleSet.secondarySuccess,
        );

  /// Botao com borda [outlined] com cor [errorColorBase]
  /// Fundo [transparente]
  /// Texto [errorColorBases]
  const QButton.secondaryError({
    super.key,
    required super.behaviour,
    super.text,
    super.onPressed,
  })  : style = ButtonStyleSet.secondaryError,
        super(
          styles: ButtonStyleSet.secondaryError,
        );

  /// Botão com apenas texto
  /// Fundo [transparente]
  /// Texto [primaryBase]
  const QButton.tertiaryPrimaryBase({
    super.key,
    required super.behaviour,
    super.text,
    super.onPressed,
  })  : style = ButtonStyleSet.tertiaryPrimaryBase,
        super(
          styles: ButtonStyleSet.tertiaryPrimaryBase,
        );

  /// Botão com apenas texto
  /// Fundo [transparente]
  /// Texto [tertiary]
  /// Cor [Ciano]
  const QButton.tertiaryCiano({
    super.key,
    required super.behaviour,
    super.text,
    super.onPressed,
  })  : style = ButtonStyleSet.tertiaryCiano,
        super(
          styles: ButtonStyleSet.tertiaryCiano,
        );

  /// Botão com texto e ícone
  ///
  /// Fundo [transparente]
  /// Texto [primaryBase]
  /// Ícone [primaryBase]
  const QButton.withIconPrimaryBase({
    super.key,
    required super.behaviour,
    super.text,
    super.leadingIconPath,
    super.onPressed,
    super.trailingIconPath,
  })  : style = ButtonStyleSet.withIconPrimaryBase,
        super(
          styles: ButtonStyleSet.withIconPrimaryBase,
        );

  /// Botão com texto e ícone
  ///
  /// Fundo [transparente]
  /// Texto [white]
  /// Ícone [white]
  const QButton.withIconWhite({
    super.key,
    required super.behaviour,
    super.text,
    super.leadingIconPath,
    super.onPressed,
    super.trailingIconPath,
  })  : style = ButtonStyleSet.withIconWhite,
        super(
          styles: ButtonStyleSet.withIconWhite,
        );

  /// Botão com icone e texto
  /// Fundo [transparente]
  /// Texto [gray5]
  /// Ícone [gray7]
  const QButton.withIconGray7({
    super.key,
    required super.behaviour,
    super.text,
    super.leadingIconPath,
    super.onPressed,
    super.trailingIconPath,
  })  : style = ButtonStyleSet.withIconGray7,
        super(
          styles: ButtonStyleSet.withIconGray7,
        );

  /// Botão com icone e texto
  /// Fundo [transparente]
  /// Texto [primaryBase]
  /// Ícone [secondaryBase]
  const QButton.withIconPrimaryBaseAndSecondaryBase({
    super.key,
    required super.behaviour,
    super.text,
    super.leadingIconPath,
    super.onPressed,
    super.trailingIconPath,
  })  : style = ButtonStyleSet.withIconPrimaryBaseAndSecondaryBase,
        super(
          styles: ButtonStyleSet.withIconPrimaryBaseAndSecondaryBase,
        );

  /// Botão com icone e texto
  /// Fundo [gray1]
  /// Texto [gray5]
  /// Ícone [black]
  const QButton.filter({
    super.key,
    required super.behaviour,
    super.text,
    super.leadingIconPath,
    super.onPressed,
    super.trailingIconPath,
  })  : style = ButtonStyleSet.filter,
        super(
          styles: ButtonStyleSet.filter,
        );

  /// Botão com texto
  /// Fundo [Secondary]
  /// Texto [Primary]
  const QButton.cashback({
    super.key,
    required super.behaviour,
    super.text,
    super.onPressed,
  })  : style = ButtonStyleSet.cashback,
        super(
          styles: ButtonStyleSet.cashback,
        );

  /// Botão com texto
  /// Fundo [primary]
  /// Texto [gray3] quando desabilitado
  /// Texto [Branco] quando habilitado
  const QButton.primaryBaseDisableGray3({
    super.key,
    required super.behaviour,
    super.text,
    super.onPressed,
  })  : style = ButtonStyleSet.primaryBaseDisableGray3,
        super(
          styles: ButtonStyleSet.primaryBaseDisableGray3,
        );

  /// Botão com texto
  /// Fundo [Secondary]
  /// Texto [Primary]
  const QButton.dashedBorder({
    super.key,
    required super.behaviour,
    super.text,
    super.onPressed,
  })  : style = ButtonStyleSet.dashedBorder,
        super(
          styles: ButtonStyleSet.dashedBorder,
        );

  /// Botao com fundo na cor [branco]
  /// Texto [primary]
  const QButton.white({
    super.key,
    required super.behaviour,
    super.text,
    super.onPressed,
    super.buttonSemantics,
    super.hintSemantics,
  })  : style = ButtonStyleSet.white,
        super(
          styles: ButtonStyleSet.white,
        );
}
