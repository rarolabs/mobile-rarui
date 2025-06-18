import 'state_fail_page_specs.dart';

class QStateFailPage extends StateFailPageSpecs {
  /// Style configuration for [QButton]
  final StateFailPageStyleSet style;

  const QStateFailPage({
    required this.style,
    super.key,
    required super.behaviour,
    required super.title,
    required super.buttonText,
    required super.appBarTitle,
    required super.onButtonPressed,
    required super.appBarIconTap,
    super.description,
    super.hintSemantics,
  }) : super(styles: style);

  /// Tela de feedback de erro com botão do tipo tertiary
  const QStateFailPage.standard({
    super.key,
    required super.behaviour,
    required super.title,
    required super.buttonText,
    required super.appBarTitle,
    required super.appBarIconTap,
    required super.onButtonPressed,
    super.description,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = StateFailPageStyleSet.standard,
        super(styles: StateFailPageStyleSet.standard);
}
