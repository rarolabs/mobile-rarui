import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/atoms.dart';
import 'package:rarUI/components/molecules/button/button_component.dart';
import 'package:rarUI/components/molecules/button/button_specs.dart';
import 'package:rarUI/shared_widget/loading_widget.dart';
import 'package:rarUI/theme/theme_data.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  int aux = 0;

  setUp(() {
    aux = 0;
  });

  group('QButton - ', () {
    group('Variação Primary - ', () {
      testWidgets('Renderização com Behaviour.regular', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.regular,
                key: const Key('button'),
                styles: ButtonStyleSet.primaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );
        //Variável com informações do widget
        final buttonComponent = tester.widget<ButtonComponent>(
          find.byKey(
            const Key('button'),
          ),
        );

        final Color? backgroundColor = buttonComponent.styles.specs.regular.buttonStyle.backgroundColor?.resolve({});

        //Verificações
        expect(find.byType(ButtonComponent), findsOneWidget);
        expect(find.text('botao'), findsOneWidget);
        expect(buttonComponent.behaviour, Behaviour.regular);
        expect(backgroundColor, QTheme.colors.primaryColorBase);
      });

      testWidgets('Renderização com Behaviour.loading', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.loading,
                key: const Key('button'),
                styles: ButtonStyleSet.primaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );
        //Variável com informações do widget
        final buttonComponent = tester.widget<ButtonComponent>(
          find.byKey(
            const Key('button'),
          ),
        );

        //Verificações
        expect(find.byType(ButtonComponent), findsOneWidget);
        expect(find.byType(LoadingWidget), findsOneWidget);
        expect(buttonComponent.behaviour, Behaviour.loading);
      });

      testWidgets('Renderização com Behaviour.disabled', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.disabled,
                key: const Key('button'),
                styles: ButtonStyleSet.primaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );
        //Variável com informações do widget
        final buttonComponent = tester.widget<ButtonComponent>(
          find.byKey(
            const Key('button'),
          ),
        );

        final Color? backgroundColor = buttonComponent.styles.specs.disabled.buttonStyle.backgroundColor?.resolve({});

        //Verificações
        expect(find.byType(ButtonComponent), findsOneWidget);
        expect(find.text('botao'), findsOneWidget);
        expect(buttonComponent.behaviour, Behaviour.disabled);
        expect(backgroundColor, QTheme.colors.gray2);
      });

      testWidgets('Renderização com Behaviour.processing', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.processing,
                key: const Key('button'),
                styles: ButtonStyleSet.primaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );
        //Variável com informações do widget
        final buttonComponent = tester.widget<ButtonComponent>(
          find.byKey(
            const Key('button'),
          ),
        );

        final Color? backgroundColor = buttonComponent.styles.specs.processing.buttonStyle.backgroundColor?.resolve({});

        //Verificações
        expect(find.byType(ButtonComponent), findsOneWidget);
        expect(find.byType(QCircularProgress), findsOneWidget);
        expect(buttonComponent.behaviour, Behaviour.processing);
        expect(backgroundColor, QTheme.colors.primaryColorBase);
      });

      testWidgets('onTap com Behaviour.regular', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.regular,
                key: const Key('button'),
                styles: ButtonStyleSet.primaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );

        //Ação Botão
        await tester.tap(find.byKey(const Key('button')));
        await tester.pumpAndSettle();

        //Verificações
        expect(aux, 1);
      });

      testWidgets('onTap com Behaviour.disabled', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.disabled,
                key: const Key('button'),
                styles: ButtonStyleSet.primaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );

        //Ação Botão
        await tester.tap(find.byKey(const Key('button')));
        await tester.pumpAndSettle();

        //Verificações
        expect(aux, 0);
      });
    });

    group('Variação Secondary - ', () {
      testWidgets('Renderização com Behaviour.regular', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.regular,
                key: const Key('button'),
                styles: ButtonStyleSet.secondaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );
        //Variável com informações do widget
        final buttonComponent = tester.widget<ButtonComponent>(
          find.byKey(
            const Key('button'),
          ),
        );

        final Color? backgroundColor = buttonComponent.styles.specs.regular.buttonStyle.backgroundColor?.resolve({});
        final BorderSide? borderColor = buttonComponent.styles.specs.regular.buttonStyle.side?.resolve({});

        //Verificações
        expect(find.byType(ButtonComponent), findsOneWidget);
        expect(find.text('botao'), findsOneWidget);
        expect(buttonComponent.behaviour, Behaviour.regular);
        expect(backgroundColor, QTheme.colors.transparent);
        expect(borderColor?.color, QTheme.colors.primaryColorBase);
      });

      testWidgets('Renderização com Behaviour.loading', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.loading,
                key: const Key('button'),
                styles: ButtonStyleSet.secondaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );
        //Variável com informações do widget
        final buttonComponent = tester.widget<ButtonComponent>(
          find.byKey(
            const Key('button'),
          ),
        );

        //Verificações
        expect(find.byType(ButtonComponent), findsOneWidget);
        expect(find.byType(LoadingWidget), findsOneWidget);
        expect(buttonComponent.behaviour, Behaviour.loading);
      });

      testWidgets('Renderização com Behaviour.disabled', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.disabled,
                key: const Key('button'),
                styles: ButtonStyleSet.secondaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );
        //Variável com informações do widget
        final buttonComponent = tester.widget<ButtonComponent>(
          find.byKey(
            const Key('button'),
          ),
        );

        final Color? backgroundColor = buttonComponent.styles.specs.disabled.buttonStyle.backgroundColor?.resolve({});
        final BorderSide? borderColor = buttonComponent.styles.specs.disabled.buttonStyle.side?.resolve({});

        //Verificações
        expect(find.byType(ButtonComponent), findsOneWidget);
        expect(find.text('botao'), findsOneWidget);
        expect(buttonComponent.behaviour, Behaviour.disabled);
        expect(backgroundColor, QTheme.colors.transparent);
        expect(borderColor?.color, QTheme.colors.gray2);
      });

      testWidgets('Renderização com Behaviour.processing', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.processing,
                key: const Key('button'),
                styles: ButtonStyleSet.secondaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );
        //Variável com informações do widget
        final buttonComponent = tester.widget<ButtonComponent>(
          find.byKey(
            const Key('button'),
          ),
        );

        final Color? backgroundColor = buttonComponent.styles.specs.processing.buttonStyle.backgroundColor?.resolve({});
        final BorderSide? borderColor = buttonComponent.styles.specs.processing.buttonStyle.side?.resolve({});

        //Verificações
        expect(find.byType(ButtonComponent), findsOneWidget);
        expect(find.byType(QCircularProgress), findsOneWidget);
        expect(buttonComponent.behaviour, Behaviour.processing);
        expect(backgroundColor, QTheme.colors.transparent);
        expect(borderColor?.color, QTheme.colors.primaryColorBase);
      });

      testWidgets('onTap com Behaviour.regular', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.regular,
                key: const Key('button'),
                styles: ButtonStyleSet.secondaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );

        //Ação Botão
        await tester.tap(find.byKey(const Key('button')));
        await tester.pumpAndSettle();

        //Verificações
        expect(aux, 1);
      });

      testWidgets('onTap com Behaviour.disabled', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.disabled,
                key: const Key('button'),
                styles: ButtonStyleSet.secondaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );

        //Ação Botão
        await tester.tap(find.byKey(const Key('button')));
        await tester.pumpAndSettle();

        //Verificações
        expect(aux, 0);
      });
    });

    group('Variação Tertiary - ', () {
      testWidgets('Renderização com Behaviour.regular', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.regular,
                key: const Key('button'),
                styles: ButtonStyleSet.tertiaryPrimaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );
        //Variável com informações do widget
        final buttonComponent = tester.widget<ButtonComponent>(
          find.byKey(
            const Key('button'),
          ),
        );

        final Color? backgroundColor = buttonComponent.styles.specs.regular.buttonStyle.backgroundColor?.resolve({});
        final Color? overlayColor = buttonComponent.styles.specs.regular.buttonStyle.overlayColor?.resolve({});

        //Verificações
        expect(find.byType(ButtonComponent), findsOneWidget);
        expect(find.text('botao'), findsOneWidget);
        expect(buttonComponent.behaviour, Behaviour.regular);
        expect(backgroundColor, QTheme.colors.transparent);
        expect(overlayColor, QTheme.colors.transparent);
      });

      testWidgets('Renderização com Behaviour.loading', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.loading,
                key: const Key('button'),
                styles: ButtonStyleSet.tertiaryPrimaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );
        //Variável com informações do widget
        final buttonComponent = tester.widget<ButtonComponent>(
          find.byKey(
            const Key('button'),
          ),
        );

        //Verificações
        expect(find.byType(ButtonComponent), findsOneWidget);
        expect(find.byType(LoadingWidget), findsOneWidget);
        expect(buttonComponent.behaviour, Behaviour.loading);
      });

      testWidgets('Renderização com Behaviour.disabled', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.disabled,
                key: const Key('button'),
                styles: ButtonStyleSet.tertiaryPrimaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );
        //Variável com informações do widget
        final buttonComponent = tester.widget<ButtonComponent>(
          find.byKey(
            const Key('button'),
          ),
        );

        final Color? backgroundColor = buttonComponent.styles.specs.disabled.buttonStyle.backgroundColor?.resolve({});
        final Color? overlayColor = buttonComponent.styles.specs.disabled.buttonStyle.overlayColor?.resolve({});

        //Verificações
        expect(find.byType(ButtonComponent), findsOneWidget);
        expect(find.text('botao'), findsOneWidget);
        expect(buttonComponent.behaviour, Behaviour.disabled);
        expect(backgroundColor, QTheme.colors.transparent);
        expect(overlayColor, QTheme.colors.transparent);
      });

      testWidgets('Renderização com Behaviour.processing', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.processing,
                key: const Key('button'),
                styles: ButtonStyleSet.tertiaryPrimaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );
        //Variável com informações do widget
        final buttonComponent = tester.widget<ButtonComponent>(
          find.byKey(
            const Key('button'),
          ),
        );

        final Color? backgroundColor = buttonComponent.styles.specs.processing.buttonStyle.backgroundColor?.resolve({});
        final Color? overlayColor = buttonComponent.styles.specs.processing.buttonStyle.overlayColor?.resolve({});

        //Verificações
        expect(find.byType(ButtonComponent), findsOneWidget);
        expect(find.byType(QCircularProgress), findsOneWidget);
        expect(buttonComponent.behaviour, Behaviour.processing);
        expect(backgroundColor, QTheme.colors.transparent);
        expect(overlayColor, QTheme.colors.transparent);
      });

      testWidgets('onTap com Behaviour.regular', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.regular,
                key: const Key('button'),
                styles: ButtonStyleSet.tertiaryPrimaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );

        //Ação Botão
        await tester.tap(find.byKey(const Key('button')));
        await tester.pumpAndSettle();

        //Verificações
        expect(aux, 1);
      });

      testWidgets('onTap com Behaviour.disabled', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.disabled,
                key: const Key('button'),
                styles: ButtonStyleSet.tertiaryPrimaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );

        //Ação Botão
        await tester.tap(find.byKey(const Key('button')));
        await tester.pumpAndSettle();

        //Verificações
        expect(aux, 0);
      });
    });

    group('Variação with icon - ', () {
      testWidgets('Renderização com Behaviour.regular', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.regular,
                key: const Key('button'),
                styles: ButtonStyleSet.withIconPrimaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );
        //Variável com informações do widget
        final buttonComponent = tester.widget<ButtonComponent>(
          find.byKey(
            const Key('button'),
          ),
        );

        final Color? backgroundColor = buttonComponent.styles.specs.regular.buttonStyle.backgroundColor?.resolve({});
        final Color? overlayColor = buttonComponent.styles.specs.regular.buttonStyle.overlayColor?.resolve({});

        //Verificações
        expect(find.byType(ButtonComponent), findsOneWidget);
        expect(find.text('botao'), findsOneWidget);
        expect(buttonComponent.behaviour, Behaviour.regular);
        expect(backgroundColor, QTheme.colors.transparent);
        expect(overlayColor, QTheme.colors.transparent);
      });

      testWidgets('Renderização com Behaviour.loading', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.loading,
                key: const Key('button'),
                styles: ButtonStyleSet.withIconPrimaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );
        //Variável com informações do widget
        final buttonComponent = tester.widget<ButtonComponent>(
          find.byKey(
            const Key('button'),
          ),
        );

        //Verificações
        expect(find.byType(ButtonComponent), findsOneWidget);
        expect(find.byType(LoadingWidget), findsOneWidget);
        expect(buttonComponent.behaviour, Behaviour.loading);
      });

      testWidgets('Renderização com Behaviour.disabled', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.disabled,
                key: const Key('button'),
                styles: ButtonStyleSet.withIconPrimaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );
        //Variável com informações do widget
        final buttonComponent = tester.widget<ButtonComponent>(
          find.byKey(
            const Key('button'),
          ),
        );

        final Color? backgroundColor = buttonComponent.styles.specs.disabled.buttonStyle.backgroundColor?.resolve({});
        final Color? overlayColor = buttonComponent.styles.specs.disabled.buttonStyle.overlayColor?.resolve({});

        //Verificações
        expect(find.byType(ButtonComponent), findsOneWidget);
        expect(find.text('botao'), findsOneWidget);
        expect(buttonComponent.behaviour, Behaviour.disabled);
        expect(backgroundColor, QTheme.colors.transparent);
        expect(overlayColor, QTheme.colors.transparent);
      });

      testWidgets('Renderização com Behaviour.processing', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.processing,
                key: const Key('button'),
                styles: ButtonStyleSet.withIconPrimaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );
        //Variável com informações do widget
        final buttonComponent = tester.widget<ButtonComponent>(
          find.byKey(
            const Key('button'),
          ),
        );

        final Color? backgroundColor = buttonComponent.styles.specs.processing.buttonStyle.backgroundColor?.resolve({});
        final Color? overlayColor = buttonComponent.styles.specs.processing.buttonStyle.overlayColor?.resolve({});

        //Verificações
        expect(find.byType(ButtonComponent), findsOneWidget);
        expect(find.byType(QCircularProgress), findsOneWidget);
        expect(buttonComponent.behaviour, Behaviour.processing);
        expect(backgroundColor, QTheme.colors.transparent);
        expect(overlayColor, QTheme.colors.transparent);
      });

      testWidgets('onTap com Behaviour.regular', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.regular,
                key: const Key('button'),
                styles: ButtonStyleSet.withIconPrimaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );

        //Ação Botão
        await tester.tap(find.byKey(const Key('button')));
        await tester.pumpAndSettle();

        //Verificações
        expect(aux, 1);
      });

      testWidgets('onTap com Behaviour.disabled', (tester) async {
        //Configuração do Widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ButtonComponent(
                behaviour: Behaviour.disabled,
                key: const Key('button'),
                styles: ButtonStyleSet.withIconPrimaryBase,
                text: 'botao',
                onPressed: () {
                  aux++;
                },
                hintSemantics: 'test hintSemantics',
                buttonSemantics: 'test labelSemantics',
              ),
            ),
          ),
        );

        //Ação Botão
        await tester.tap(find.byKey(const Key('button')));
        await tester.pumpAndSettle();

        //Verificações
        expect(aux, 0);
      });
    });
  });
}
