import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import '../../../theme/sizes.dart';
import '../../atoms/atoms.dart';
import 'models/requirement_model.dart';
import 'password_requirements_style.dart';

class PasswordRequirementsComponent extends StatelessWidget
    with Component<PasswordRequirementsStyle, PasswordRequirementsSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Estilo do componente
  final PasswordRequirementsStyles styles;

  /// Título dos requisitos
  final String headInfoText;

  /// Lista de requisitos para a senha
  final List<QRequirementModel> requirements;

  /// Controlador de texto da senha para validação
  final TextEditingController passwordController;

  // Texto de acessibilidade
  final String? labelSemantics;

  //Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  PasswordRequirementsComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.headInfoText,
    required this.requirements,
    required this.passwordController,
    this.labelSemantics,
    this.hintSemantics,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<PasswordRequirementsStyle, PasswordRequirementsSharedStyle>(
      shared: styles.shared,
      regular: styles.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    PasswordRequirementsStyle style,
    PasswordRequirementsSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Center(
      child: Column(
        spacing: QSizes.x4,
        children: [
          LoadingWidget(style: otherStyle.loadingStyle),
          LoadingWidget(style: otherStyle.loadingStyle),
        ],
      ),
    );
  }

  @override
  Widget whenRegular(
    PasswordRequirementsStyle style,
    PasswordRequirementsSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: Column(
        spacing: QSizes.x8,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QLabel.captionRoboto14Gray5Bold(behaviour: behaviour, text: headInfoText),
          ...requirements.map(
            (requirement) => QLabel.captionRoboto14SuccessRegular(
              behaviour: passwordController.text.isEmpty
                  ? Behaviour.disabled
                  : requirement.validator(passwordController.text)
                      ? Behaviour.regular
                      : Behaviour.error,
              text: requirement.description,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.processing: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
        Behaviour.error: Behaviour.regular,
      };
}
