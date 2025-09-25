import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/molecules/toast/toast.dart';
import 'package:rarui/utils/extensions/theme_extension.dart';

void main() {
  Widget createTestWidget({required Widget child}) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        extensions: [
          ExtraColors(
            success: ColorScheme.fromSeed(seedColor: Colors.green),
            warning: ColorScheme.fromSeed(seedColor: Colors.orange),
            error: ColorScheme.fromSeed(seedColor: Colors.red),
            info: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
        ],
      ),
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('RToast Widget Tests', () {
    testWidgets('deve exibir RToast com estilo success corretamente',
        (WidgetTester tester) async {
      const String title = 'Sucesso';
      const String message = 'Operação realizada com sucesso!';

      await tester.pumpWidget(
        createTestWidget(
          child: RToast(
            title: title,
            message: message,
            style: RToastStyle.success,
            isDense: false,
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.text(message), findsOneWidget);
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('deve exibir RToast com estilo warning corretamente',
        (WidgetTester tester) async {
      const String title = 'Aviso';
      const String message = 'Atenção com esta operação!';

      await tester.pumpWidget(
        createTestWidget(
          child: RToast(
            title: title,
            message: message,
            style: RToastStyle.warning,
            isDense: false,
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.text(message), findsOneWidget);
      expect(find.byIcon(Icons.warning), findsOneWidget);
    });

    testWidgets('deve exibir RToast com estilo error corretamente',
        (WidgetTester tester) async {
      const String title = 'Erro';
      const String message = 'Ocorreu um erro na operação!';

      await tester.pumpWidget(
        createTestWidget(
          child: RToast(
            title: title,
            message: message,
            style: RToastStyle.error,
            isDense: false,
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.text(message), findsOneWidget);
      expect(find.byIcon(Icons.error), findsOneWidget);
    });

    testWidgets('deve exibir RToast com estilo info corretamente',
        (WidgetTester tester) async {
      const String title = 'Informação';
      const String message = 'Esta é uma informação importante!';

      await tester.pumpWidget(
        createTestWidget(
          child: RToast(
            title: title,
            message: message,
            style: RToastStyle.info,
            isDense: false,
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.text(message), findsOneWidget);
      expect(find.byIcon(Icons.info), findsOneWidget);
    });

    testWidgets('deve exibir RToast com estilo custom corretamente',
        (WidgetTester tester) async {
      const String title = 'Custom';
      const String message = 'Toast customizado!';

      await tester.pumpWidget(
        createTestWidget(
          child: RToast(
            title: title,
            message: message,
            style: RToastStyle.custom,
            isDense: false,
            customColor: Colors.purple,
            customIcon: Icons.star,
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.text(message), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('deve exibir botão quando buttonText é fornecido',
        (WidgetTester tester) async {
      const String title = 'Toast com botão';
      const String message = 'Este toast tem um botão!';
      const String buttonText = 'Clique aqui';
      bool buttonPressed = false;

      await tester.pumpWidget(
        createTestWidget(
          child: RToast(
            title: title,
            message: message,
            style: RToastStyle.info,
            isDense: false,
            buttonText: buttonText,
            buttonAction: () {
              buttonPressed = true;
            },
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.text(message), findsOneWidget);
      expect(find.text(buttonText), findsOneWidget);

      await tester.tap(find.text(buttonText));
      await tester.pump();

      expect(buttonPressed, isTrue);
    });

    testWidgets('deve exibir botão de fechar quando onClose é fornecido',
        (WidgetTester tester) async {
      const String title = 'Toast com close';
      const String message = 'Este toast pode ser fechado!';
      bool closePressed = false;

      await tester.pumpWidget(
        createTestWidget(
          child: RToast(
            title: title,
            message: message,
            style: RToastStyle.info,
            isDense: false,
            onClose: () {
              closePressed = true;
            },
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.text(message), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close));
      await tester.pump();

      expect(closePressed, isTrue);
    });

    testWidgets('deve usar tamanhos diferentes quando isDense é true',
        (WidgetTester tester) async {
      const String title = 'Toast denso';
      const String message = 'Este toast é denso!';

      await tester.pumpWidget(
        createTestWidget(
          child: RToast(
            title: title,
            message: message,
            style: RToastStyle.success,
            isDense: true,
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.text(message), findsOneWidget);

      // Verificar se o ícone tem o tamanho correto (16 para dense)
      final Icon icon = tester.widget<Icon>(find.byIcon(Icons.check_circle));
      expect(icon.size, equals(16));
    });

    testWidgets('deve aplicar diferentes tipos de toast (clean, soft, solid)',
        (WidgetTester tester) async {
      const String title = 'Toast Solid';
      const String message = 'Este toast é sólido!';

      await tester.pumpWidget(
        createTestWidget(
          child: RToast(
            title: title,
            message: message,
            style: RToastStyle.success,
            type: RToastType.solid,
            isDense: false,
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.text(message), findsOneWidget);

      // Verificar se o container existe
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets(
        'deve falhar assertion quando style é custom mas customColor ou customIcon são null',
        (WidgetTester tester) async {
      expect(
        () => RToast(
          title: 'Teste',
          message: 'Teste custom sem parâmetros',
          style: RToastStyle.custom,
          isDense: false,
          // customColor e customIcon não fornecidos
        ),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}
