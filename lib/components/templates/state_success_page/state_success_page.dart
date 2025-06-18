import 'state_success_page_specs.dart';

class QStateSuccessPage extends StateSuccessPageSpecs {
  /// Style configuration for [QButton]
  final StateSuccessPageStyleSet style;

  const QStateSuccessPage({
    required this.style,
    super.key,
    required super.behaviour,
    required super.title,
    required super.buttonText,
    required super.appBarTitle,
    required super.counterText,
    required super.appBarIconTap,
    required super.onButtonPressed,
    super.hintSemantics,
    super.labelSemantics,
  }) : super(styles: style);

  /// Tela de Estado de sucesso com botão tertiary
  const QStateSuccessPage.standard({
    super.key,
    required super.behaviour,
    required super.title,
    required super.buttonText,
    required super.appBarTitle,
    required super.counterText,
    required super.appBarIconTap,
    required super.onButtonPressed,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = StateSuccessPageStyleSet.standard,
        super(styles: StateSuccessPageStyleSet.standard);
}
