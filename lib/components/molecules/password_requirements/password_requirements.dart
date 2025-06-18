import 'password_requirements_specs.dart';

class QPasswordRequirements extends PasswordRequirementsSpecs {
  /// Style configuration for [QPasswordRequirements]
  final PasswordRequirementsStyleSet style;

  QPasswordRequirements({
    required this.style,
    super.key,
    required super.behaviour,
    required super.headInfoText,
    required super.requirements,
    required super.passwordController,
    super.labelSemantics,
    super.hintSemantics,
  }) : super(styles: style.build());

  /// Componente de requisitos de senha com estilo padrão
  QPasswordRequirements.standard({
    super.key,
    required super.behaviour,
    required super.headInfoText,
    required super.requirements,
    required super.passwordController,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = PasswordRequirementsStyleSet.standard,
        super(
          styles: PasswordRequirementsStyleSet.standard.build(),
        );
}
