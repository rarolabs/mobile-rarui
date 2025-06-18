part of 'password_requirements_specs.dart';

enum PasswordRequirementsStyleSet {
  standard(PasswordRequirementsSpecs.standardStyle);

  final PasswordRequirementsStyles Function() build;

  const PasswordRequirementsStyleSet(this.build);
}
