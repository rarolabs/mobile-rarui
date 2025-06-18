import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/icon/icon.dart';
import 'package:rarUI/components/atoms/icon/icon_specs.dart';
import 'package:rarUI/components/molecules/text_icon/text_icon.dart';
import 'package:rarUI/shared_widget/loading_widget.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  group('Testes do TextIcon |', () {
    const String testTitle = 'Título de Teste';
    const String testSvgPath = 'assets/icons/credit_card.svg';
    const regular = Behaviour.regular;
    const loading = Behaviour.loading;

    // Função para criar o widget de teste
    Widget createTestWidget({
      required Widget body,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: body,
        ),
      );
    }

    testWidgets('Deve renderizar o TextIcon.regular no estado regular', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          body: const QTextIcon.standard(
            title: testTitle,
            behaviour: regular,
            leadingIconPath: testSvgPath,
          ),
        ),
      );

      // Verifica se o widget TextIcon foi renderizado
      expect(find.byType(QTextIcon), findsOneWidget);

      // Verifica se o título é renderizado
      expect(find.text(testTitle), findsOneWidget);

      // Verifica se o widget QIcon é renderizado
      final qIconFinder = find.byType(QIcon);
      expect(qIconFinder, findsOneWidget);

      // Obtém a instância do QIcon
      final QIcon qIcon = tester.widget<QIcon>(qIconFinder);

      // Verifica as propriedades do QIcon
      expect(qIcon.behaviour, regular);
      expect(qIcon.svgPath, testSvgPath);
      expect(qIcon.style, IconStyleSet.size28Gray5);
    });

    testWidgets('Deve renderizar o LoadingWidget quando o estado de TextIcon.regular for loading',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          body: const QTextIcon.standard(
            title: testTitle,
            behaviour: loading,
            leadingIconPath: testSvgPath,
          ),
        ),
      );

      // Verifica se o widget LoadingWidget é renderizado
      expect(find.byType(LoadingWidget), findsOneWidget);
    });

    testWidgets('Deve renderizar o TextIcon.ciano no estado regular', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          body: const QTextIcon.body16IconCiano(
            title: testTitle,
            behaviour: regular,
            leadingIconPath: testSvgPath,
          ),
        ),
      );

      // Verifica se o widget TextIcon foi renderizado
      expect(find.byType(QTextIcon), findsOneWidget);

      // Verifica se o título é renderizado
      expect(find.text(testTitle), findsOneWidget);

      // Verifica se o widget QIcon é renderizado
      final qIconFinder = find.byType(QIcon);
      expect(qIconFinder, findsOneWidget);

      // Obtém a instância do QIcon
      final QIcon qIcon = tester.widget<QIcon>(qIconFinder);

      // Verifica as propriedades do QIcon
      expect(qIcon.behaviour, regular);
      expect(qIcon.svgPath, testSvgPath);
      expect(qIcon.style, IconStyleSet.size28Ciano);
    });

    testWidgets('Deve renderizar o LoadingWidget quando o estado de TextIcon.ciano for loading',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          body: const QTextIcon.body16IconCiano(
            title: testTitle,
            behaviour: loading,
            leadingIconPath: testSvgPath,
          ),
        ),
      );

      // Verifica se o widget LoadingWidget é renderizado
      expect(find.byType(LoadingWidget), findsOneWidget);
    });
  });
}
