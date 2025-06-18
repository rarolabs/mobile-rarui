import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/rarui.dart';
import 'package:rarUI/shared_widget/loading_widget.dart';

void main() {
  group('Password Page - ', () {
    testWidgets('Construção correta do template', (tester) async {
      const behaviour = Behaviour.regular;
      final controller = TextEditingController();

      // Construção do componente
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QPasswordPage.standardLeftText(
              appBarTitle: 'appBarTitle',
              title: 'title',
              body: 'body',
              pinInputBehaviour: behaviour,
              tertiaryButtonBehaviour: behaviour,
              tertiaryButtonLabel: 'tertiary',
              tertiaryButtonOnPressed: () {},
              primaryButtonBehaviour: behaviour,
              primaryButtonLabel: 'primary',
              primaryButtonOnPressed: () {},
              secondaryButtonLabel: 'secondary',
              secondaryButtonBehaviour: behaviour,
              secondaryButtonOnPressed: () {},
              pinInputController: controller,
            ),
          ),
        ),
      );

      // Validações
      expect(find.byType(QLabel), findsExactly(6));
      expect(find.byType(QPinInput), findsOneWidget);
      expect(find.byType(QButton), findsExactly(3));
      expect(find.text('title'), findsOne);
      expect(find.text('body'), findsOne);
      expect(find.text('tertiary'), findsOne);
      expect(find.text('primary'), findsOne);
      expect(find.text('secondary'), findsOne);
    });

    testWidgets('Construção correta do template sem title', (tester) async {
      const behaviour = Behaviour.regular;
      final controller = TextEditingController();

      // Construção do componente
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QPasswordPage.standardLeftText(
              appBarTitle: 'appBarTitle',
              body: 'body',
              pinInputBehaviour: behaviour,
              tertiaryButtonBehaviour: behaviour,
              tertiaryButtonLabel: 'tertiary',
              tertiaryButtonOnPressed: () {},
              primaryButtonBehaviour: behaviour,
              primaryButtonLabel: 'primary',
              primaryButtonOnPressed: () {},
              secondaryButtonLabel: 'secondary',
              secondaryButtonBehaviour: behaviour,
              secondaryButtonOnPressed: () {},
              pinInputController: controller,
            ),
          ),
        ),
      );

      // Validações
      expect(find.byType(QLabel), findsExactly(5));
      expect(find.byType(QPinInput), findsOneWidget);
      expect(find.byType(QButton), findsExactly(3));
      expect(find.text('title'), findsNothing);
      expect(find.text('body'), findsOne);
      expect(find.text('tertiary'), findsOne);
      expect(find.text('primary'), findsOne);
      expect(find.text('secondary'), findsOne);
    });

    testWidgets('Construção correta do template sem body', (tester) async {
      const behaviour = Behaviour.regular;
      final controller = TextEditingController();

      // Construção do componente
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QPasswordPage.standardLeftText(
              appBarTitle: 'appBarTitle',
              title: 'title',
              pinInputBehaviour: behaviour,
              tertiaryButtonBehaviour: behaviour,
              tertiaryButtonLabel: 'tertiary',
              tertiaryButtonOnPressed: () {},
              primaryButtonBehaviour: behaviour,
              primaryButtonLabel: 'primary',
              primaryButtonOnPressed: () {},
              secondaryButtonLabel: 'secondary',
              secondaryButtonBehaviour: behaviour,
              secondaryButtonOnPressed: () {},
              pinInputController: controller,
            ),
          ),
        ),
      );

      // Validações
      expect(find.byType(QLabel), findsExactly(5));
      expect(find.byType(QPinInput), findsOneWidget);
      expect(find.byType(QButton), findsExactly(3));
      expect(find.text('title'), findsOne);
      expect(find.text('body'), findsNothing);
      expect(find.text('tertiary'), findsOne);
      expect(find.text('primary'), findsOne);
      expect(find.text('secondary'), findsOne);
    });

    testWidgets('Construção correta do template sem tertiaryButton', (tester) async {
      const behaviour = Behaviour.regular;
      final controller = TextEditingController();

      // Construção do componente
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QPasswordPage.standardLeftText(
              appBarTitle: 'appBarTitle',
              title: 'title',
              body: 'body',
              pinInputBehaviour: behaviour,
              primaryButtonBehaviour: behaviour,
              primaryButtonLabel: 'primary',
              primaryButtonOnPressed: () {},
              secondaryButtonLabel: 'secondary',
              secondaryButtonBehaviour: behaviour,
              secondaryButtonOnPressed: () {},
              pinInputController: controller,
            ),
          ),
        ),
      );

      // Validações
      expect(find.byType(QLabel), findsExactly(5));
      expect(find.byType(QPinInput), findsOneWidget);
      expect(find.byType(QButton), findsExactly(2));
      expect(find.text('title'), findsOne);
      expect(find.text('body'), findsOne);
      expect(find.text('tertiary'), findsNothing);
      expect(find.text('primary'), findsOne);
      expect(find.text('secondary'), findsOne);
    });

    testWidgets('Construção correta do template sem primaryButton', (tester) async {
      const behaviour = Behaviour.regular;
      final controller = TextEditingController();

      // Construção do componente
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QPasswordPage.standardLeftText(
              appBarTitle: 'appBarTitle',
              title: 'title',
              body: 'body',
              pinInputBehaviour: behaviour,
              tertiaryButtonBehaviour: behaviour,
              tertiaryButtonLabel: 'tertiary',
              tertiaryButtonOnPressed: () {},
              secondaryButtonLabel: 'secondary',
              secondaryButtonBehaviour: behaviour,
              secondaryButtonOnPressed: () {},
              pinInputController: controller,
            ),
          ),
        ),
      );

      // Validações
      expect(find.byType(QLabel), findsExactly(5));
      expect(find.byType(QPinInput), findsOneWidget);
      expect(find.byType(QButton), findsExactly(2));
      expect(find.text('title'), findsOne);
      expect(find.text('body'), findsOne);
      expect(find.text('tertiary'), findsOne);
      expect(find.text('primary'), findsNothing);
      expect(find.text('secondary'), findsOne);
    });

    testWidgets('Construção correta do template sem secondaryButton', (tester) async {
      const behaviour = Behaviour.regular;
      final controller = TextEditingController();

      // Construção do componente
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QPasswordPage.standardLeftText(
              appBarTitle: 'appBarTitle',
              title: 'title',
              body: 'body',
              pinInputBehaviour: behaviour,
              tertiaryButtonBehaviour: behaviour,
              tertiaryButtonLabel: 'tertiary',
              tertiaryButtonOnPressed: () {},
              primaryButtonBehaviour: behaviour,
              primaryButtonLabel: 'primary',
              primaryButtonOnPressed: () {},
              pinInputController: controller,
            ),
          ),
        ),
      );

      // Validações
      expect(find.byType(QLabel), findsExactly(5));
      expect(find.byType(QPinInput), findsOneWidget);
      expect(find.byType(QButton), findsExactly(2));
      expect(find.text('title'), findsOne);
      expect(find.text('body'), findsOne);
      expect(find.text('tertiary'), findsOne);
      expect(find.text('primary'), findsOne);
      expect(find.text('secondary'), findsNothing);
    });

    testWidgets('Construção correta do template em loading', (tester) async {
      const behaviour = Behaviour.loading;
      final controller = TextEditingController();

      // Construção do componente
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QPasswordPage.standardLeftText(
              appBarTitle: 'appBarTitle',
              title: 'title',
              body: 'body',
              pinInputBehaviour: behaviour,
              tertiaryButtonBehaviour: behaviour,
              tertiaryButtonLabel: 'tertiary',
              tertiaryButtonOnPressed: () {},
              primaryButtonBehaviour: behaviour,
              primaryButtonLabel: 'primary',
              primaryButtonOnPressed: () {},
              pinInputController: controller,
            ),
          ),
        ),
      );

      // Validações
      expect(find.byType(LoadingWidget), findsExactly(4));
    });

    testWidgets('onTap do TertiaryButton', (tester) async {
      int aux = 0;
      const String buttonName = 'tertiary';
      const behaviour = Behaviour.regular;
      final controller = TextEditingController();

      // Construção do componente
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QPasswordPage.standardLeftText(
              appBarTitle: 'appBarTitle',
              pinInputBehaviour: behaviour,
              tertiaryButtonBehaviour: behaviour,
              tertiaryButtonLabel: buttonName,
              tertiaryButtonOnPressed: () {
                aux++;
              },
              pinInputController: controller,
            ),
          ),
        ),
      );

      //Clik do botão
      await tester.tap(find.text(buttonName));
      await tester.pumpAndSettle();

      // Validações
      expect(aux, 1);
    });

    testWidgets('onTap do PrimaryButton', (tester) async {
      int aux = 0;
      const buttonName = 'primary';
      const behaviour = Behaviour.regular;
      final controller = TextEditingController();

      // Construção do componente
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QPasswordPage.standardLeftText(
              appBarTitle: 'appBarTitle',
              pinInputBehaviour: behaviour,
              primaryButtonBehaviour: behaviour,
              primaryButtonLabel: buttonName,
              primaryButtonOnPressed: () {
                aux++;
              },
              pinInputController: controller,
            ),
          ),
        ),
      );

      //enter text on pinInput
      await tester.enterText(find.byType(QPinInput), '123456');
      await tester.pumpAndSettle();

      //Click do Botão
      await tester.tap(find.text(buttonName));
      await tester.pumpAndSettle();

      // Validações
      expect(aux, 1);
    });

    testWidgets('onTap do SecondaryButton', (tester) async {
      int aux = 0;
      const buttonName = 'secondary';
      const behaviour = Behaviour.regular;
      final controller = TextEditingController();

      // Construção do componente
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QPasswordPage.standardLeftText(
              appBarTitle: 'appBarTitle',
              pinInputBehaviour: behaviour,
              secondaryButtonLabel: buttonName,
              secondaryButtonBehaviour: behaviour,
              secondaryButtonOnPressed: () {
                aux++;
              },
              pinInputController: controller,
            ),
          ),
        ),
      );

      //Click do botão
      await tester.tap(find.text(buttonName));
      await tester.pumpAndSettle();

      // Validações
      expect(aux, 1);
    });
  });
}
