import 'proof_page_specs.dart';

class QProofPage extends ProofPageSpecs {
  /// Style configuration for [QProofPage]
  final ProofPageStyleSet style;

  const QProofPage({
    required this.style,
    super.key,
    required super.behaviour,
    required super.title,
    required super.subtitle,
    required super.firstSectionTitleText,
    required super.details,
    required super.firstSection,
    required super.secondSectionTitleText,
    required super.secondSection,
    required super.endSection,
    required super.logoImagePath,
    super.observationText,
    required super.secondaryButtonText,
    required super.onBackPressed,
    super.labelSemantics,
    super.hintSemantics,
    required super.onScreenShotPressed,
  }) : super(styles: style);

  /// Variação padrão do componente de comprovante
  const QProofPage.standard({
    super.key,
    required super.behaviour,
    required super.title,
    required super.subtitle,
    super.firstSectionTitleText,
    super.details,
    required super.firstSection,
    super.secondSectionTitleText,
    required super.secondSection,
    super.endSection,
    required super.logoImagePath,
    super.observationText,
    required super.secondaryButtonText,
    required super.onScreenShotPressed,
    required super.onBackPressed,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = ProofPageStyleSet.standard,
        super(
          styles: ProofPageStyleSet.standard,
        );
}
