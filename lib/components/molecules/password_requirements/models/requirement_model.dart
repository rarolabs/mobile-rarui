class QRequirementModel {
  final String description;
  final bool Function(String) validator;

  QRequirementModel({
    required this.description,
    required this.validator,
  });
}
