import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/label/label.dart';
import 'package:rarUI/components/molecules/password_requirements/models/requirement_model.dart';
import 'package:rarUI/components/molecules/password_requirements/password_requirements_component.dart';
import 'package:rarUI/components/molecules/password_requirements/password_requirements_specs.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  testWidgets('Deve validar se o componente de requisitos de senha está se comportando corretamente', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PasswordRequirementsComponent(
          behaviour: Behaviour.regular,
          styles: PasswordRequirementsStyleSet.standard.build(),
          headInfoText: 'Sua senha deve conter:',
          requirements: [
            QRequirementModel(
              description: 'Mínimo de 8 dígitos',
              validator: (value) {
                return value.length >= 8;
              },
            ),
          ],
          passwordController: TextEditingController(
            text: '123456',
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text('Mínimo de 8 dígitos'), findsOne);

    // Verificar se os labels de titulo e único requisito adicionado no teste estão presentes
    expect(find.byType(QLabel), findsExactly(2));
  });
}
