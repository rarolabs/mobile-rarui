import 'dart:developer';

import 'package:auto_size_text_plus/auto_size_text_plus.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/text_click/text_click.dart';
import 'package:rarUI/shared_widget/loading_widget.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  group('Testes do TextClick |', () {
    // Função para criar o widget de teste
    Widget createTestWidget({required Widget body}) => MaterialApp(home: Scaffold(body: body));

    testWidgets('Deve renderizar o TextIcon.regular no estado regular', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          body: QTextClick.standard(
            behaviour: Behaviour.regular,
            text: QTextClickSpan.captionRoboto14Regular(
              text: 'Você concorda com nossos',
              children: [
                QTextClickSpan.captionRoboto14primaryBold(
                  text: 'Termos de Serviços',
                  recognizer: TapGestureRecognizer()..onTap = () => log('Termos de Serviços'),
                ),
                QTextClickSpan.captionRoboto14Regular(
                  text: ' e ',
                ),
                QTextClickSpan.captionRoboto14primaryBold(
                  text: 'Política de Privacidade',
                  recognizer: TapGestureRecognizer()..onTap = () => log('Política de Privacidade'),
                ),
              ],
            ),
          ),
        ),
      );

      // Verifica se o widget QTextClick foi renderizado
      expect(find.byType(QTextClick), findsOneWidget);

      // Verifica se o título é renderizado
      expect(find.byType(AutoSizeText), findsOneWidget);

      // Verifica se o widget Checkbox é renderizado
      expect(find.byType(Checkbox), findsOneWidget);
    });

    testWidgets('Deve renderizar o LoadingWidget quando o estado de QTextClick for loading',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          body: QTextClick.standard(
            behaviour: Behaviour.loading,
            text: QTextClickSpan.captionRoboto14Regular(
              text: 'Você concorda com nossos',
            ),
          ),
        ),
      );

      // Verifica se o widget LoadingWidget é renderizado
      expect(find.byType(LoadingWidget), findsOneWidget);
    });
  });
}
