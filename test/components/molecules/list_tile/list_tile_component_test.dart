import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/icon/icon.dart';
import 'package:rarUI/components/atoms/label/label.dart';
import 'package:rarUI/components/atoms/label/label_specs.dart';
import 'package:rarUI/components/molecules/list_tile/list_tile.dart';
import 'package:rarUI/theme/theme_data.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

// Função auxiliar para configurar o ambiente padrão
Widget wrapWithMaterialApp(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: child,
    ),
  );
}

// Variáveis reutilizáveis
const tituloTeste = 'Título do Teste';
const subtituloTeste = 'Subtítulo do Teste';
const leadingIconKey = Key('leading-icon');
const trailingIconKey = Key('trailing-icon');
const gestureTileKey = Key('gesture-list-tile');
const containerTileKey = Key('container-list-tile');
const spaceTileKey = Key('space-list-tile');
const regular = Behaviour.regular;
const loading = Behaviour.loading;
const disabled = Behaviour.disabled;
final mail = QTheme.svgs.mail;
final formatListBulleted = QTheme.svgs.formatListBulleted;
final arrowForward = QTheme.svgs.arrowForward;
final edit = QTheme.svgs.edit;
final notifications = QTheme.svgs.notifications;
const bodyRoboto14Gray5Medium = LabelStyleSet.bodyRoboto14Gray5Medium;
final gray2 = QTheme.colors.gray2;

void main() {
  group(
    'Testes do QListTile.regular |',
    () {
      testWidgets(
        'Deve renderizar corretamente o QListTile com os ícones e texto fornecidos',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            wrapWithMaterialApp(
              QListTile.standard(
                behaviour: regular,
                title: tituloTeste,
                subtitle: subtituloTeste,
                svgPathLeading: mail,
                svgPathTrailing: formatListBulleted,
                onPressed: () {},
              ),
            ),
          );

          expect(find.text(tituloTeste), findsOneWidget);
          expect(find.text(subtituloTeste), findsOneWidget);
          expect(find.byKey(leadingIconKey), findsOneWidget);

          final QIcon leadingIconWidget = tester.widget<QIcon>(find.byKey(leadingIconKey));
          final QIcon trailingIconWidget = tester.widget<QIcon>(find.byKey(trailingIconKey));

          expect(leadingIconWidget.svgPath, mail);
          expect(trailingIconWidget.svgPath, formatListBulleted);
        },
      );

      testWidgets(
        'Deve chamar o callback onPressed ao clicar no QListTile',
        (WidgetTester tester) async {
          bool onPressedCalled = false;

          await tester.pumpWidget(
            wrapWithMaterialApp(
              QListTile.standard(
                behaviour: regular,
                title: tituloTeste,
                subtitle: subtituloTeste,
                svgPathLeading: mail,
                svgPathTrailing: formatListBulleted,
                onPressed: () => onPressedCalled = true,
              ),
            ),
          );

          await tester.tap(find.byType(QListTile));
          await tester.pump();

          expect(onPressedCalled, isTrue);
        },
      );

      testWidgets(
        'Deve renderizar o estado "disabled" corretamente',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            wrapWithMaterialApp(
              QListTile.standard(
                behaviour: disabled,
                title: tituloTeste,
                subtitle: subtituloTeste,
                svgPathLeading: mail,
                svgPathTrailing: formatListBulleted,
                onPressed: () {},
              ),
            ),
          );

          expect(
            tester.widget<GestureDetector>(find.byKey(gestureTileKey)).onTap,
            isNull,
          );

          final container = tester.widget<DecoratedBox>(find.byKey(containerTileKey));
          final decoration = container.decoration as BoxDecoration;
          expect(decoration.color, equals(gray2));
        },
      );

      testWidgets(
        'Deve exibir os estilos padrão do QListTile.regular',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            wrapWithMaterialApp(
              QListTile.standard(
                behaviour: regular,
                title: tituloTeste,
                subtitle: subtituloTeste,
                svgPathLeading: mail,
                svgPathTrailing: formatListBulleted,
                onPressed: () {},
              ),
            ),
          );

          final QLabel titleLabel = tester.widget(find.widgetWithText(QLabel, tituloTeste));
          expect(titleLabel.style, LabelStyleSet.bodyRoboto14Gray5Medium);

          final QLabel subTitleLabel = tester.widget(find.widgetWithText(QLabel, subtituloTeste));
          expect(subTitleLabel.style, LabelStyleSet.captionRoboto12Gray5Regular);
        },
      );
    },
  );

  group(
    'Testes do QListTile.standard |',
    () {
      testWidgets(
        'Deve renderizar corretamente o QListTile com os ícones e texto fornecidos',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            wrapWithMaterialApp(
              QListTile.standard(
                behaviour: regular,
                title: tituloTeste,
                svgPathLeading: notifications,
                onPressed: () {},
              ),
            ),
          );

          expect(find.byKey(leadingIconKey), findsOneWidget);

          final QIcon leadingIconWidget = tester.widget<QIcon>(find.byKey(leadingIconKey));

          expect(leadingIconWidget.svgPath, notifications);

          expect(find.text(tituloTeste), findsOneWidget);
        },
      );

      testWidgets(
        'Deve chamar o callback onPressed ao clicar no QListTile',
        (WidgetTester tester) async {
          bool onPressedCalled = false;

          await tester.pumpWidget(
            wrapWithMaterialApp(
              QListTile.standard(
                behaviour: regular,
                title: tituloTeste,
                svgPathLeading: notifications,
                onPressed: () => onPressedCalled = true,
              ),
            ),
          );

          await tester.tap(find.byType(QListTile));
          await tester.pump();

          expect(onPressedCalled, isTrue);
        },
      );

      testWidgets(
        'Deve renderizar o estado "disabled" corretamente',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            wrapWithMaterialApp(
              QListTile.standard(
                behaviour: disabled,
                title: tituloTeste,
                svgPathLeading: notifications,
                onPressed: () {},
              ),
            ),
          );

          expect(
            tester.widget<GestureDetector>(find.byKey(gestureTileKey)).onTap,
            isNull,
          );

          final container = tester.widget<DecoratedBox>(find.byKey(containerTileKey));
          final decoration = container.decoration as BoxDecoration;
          expect(decoration.color, equals(gray2));
        },
      );
    },
  );

  group(
    'Testes do standardTrailingSecondary0 |',
    () {
      testWidgets(
        'Deve renderizar corretamente o QListTile com o ícone e texto fornecidos',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            wrapWithMaterialApp(
              QListTile.standardTrailingSecondary0(
                behaviour: regular,
                title: tituloTeste,
                svgPathTrailing: formatListBulleted,
                onPressed: () {},
              ),
            ),
          );

          expect(find.byKey(trailingIconKey), findsOneWidget);

          final QIcon trailingIconWidget = tester.widget<QIcon>(find.byKey(trailingIconKey));

          expect(trailingIconWidget.svgPath, formatListBulleted);
          expect(find.text(tituloTeste), findsOneWidget);
        },
      );

      testWidgets(
        'Deve chamar o callback onPressed ao clicar no QListTile',
        (WidgetTester tester) async {
          bool onPressedCalled = false;

          await tester.pumpWidget(
            wrapWithMaterialApp(
              QListTile.standardTrailingSecondary0(
                behaviour: regular,
                title: tituloTeste,
                onPressed: () => onPressedCalled = true,
              ),
            ),
          );

          await tester.tap(find.byType(QListTile));
          await tester.pump();

          expect(onPressedCalled, isTrue);
        },
      );

      testWidgets(
        'Deve exibir os estilos padrão do standardTrailingSecondary0',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            wrapWithMaterialApp(
              QListTile.standardTrailingSecondary0(
                behaviour: regular,
                title: tituloTeste,
                onPressed: () {},
              ),
            ),
          );

          final QLabel titleLabel = tester.widget(find.widgetWithText(QLabel, tituloTeste));
          expect(titleLabel.style, LabelStyleSet.bodyRoboto14Gray5SemiBold);
        },
      );
    },
  );

  group(
    'Testes do QListTile.standard |',
    () {
      testWidgets(
        'Deve renderizar corretamente o QListTile com o título, subtítulo e trailingIcon',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            wrapWithMaterialApp(
              QListTile.standard(
                behaviour: regular,
                title: tituloTeste,
                subtitle: subtituloTeste,
                onPressed: () {},
              ),
            ),
          );

          expect(find.text(tituloTeste), findsOneWidget);
          expect(find.text(subtituloTeste), findsOneWidget);
        },
      );

      testWidgets(
        'Deve chamar o callback onPressedTrailingIcon ao clicar no trailingIcon',
        (WidgetTester tester) async {
          bool onPressedCalled = false;

          await tester.pumpWidget(
            wrapWithMaterialApp(
              QListTile.standard(
                behaviour: regular,
                title: tituloTeste,
                subtitle: subtituloTeste,
                svgPathTrailing: formatListBulleted,
                onPressedTrailingIcon: () => onPressedCalled = true,
              ),
            ),
          );

          await tester.tap(find.byKey(trailingIconKey));
          await tester.pump();

          expect(onPressedCalled, isTrue);
        },
      );

      testWidgets(
        'Deve renderizar o estado "disabled" corretamente',
        (WidgetTester tester) async {
          bool onPressedCalled = false;
          await tester.pumpWidget(
            wrapWithMaterialApp(
              QListTile.standard(
                behaviour: disabled,
                title: tituloTeste,
                subtitle: subtituloTeste,
                svgPathTrailing: formatListBulleted,
                onPressedTrailingIcon: () => onPressedCalled = true,
              ),
            ),
          );

          await tester.tap(find.byKey(trailingIconKey));
          await tester.pump();

          /// Deve continuar falso, pois onPressedTrailingIcon tem que estar desabilitado.
          expect(onPressedCalled, isFalse);
        },
      );
    },
  );
}
