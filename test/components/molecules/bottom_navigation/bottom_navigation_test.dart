import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/icon/icon_specs.dart';
import 'package:rarUI/components/molecules/bottom_navigation/bottom_navigation_component.dart';
import 'package:rarUI/components/molecules/bottom_navigation/bottom_navigation_specs.dart';
import 'package:rarUI/rarui.dart';
import 'package:rarUI/shared_widget/loading_widget.dart';

void main() {
  group(
    'Bottom Navigation - ',
    () {
      late List<String> list;
      late int index;

      setUp(() {
        index = 0;
        list = [
          QTheme.svgs.home,
          QTheme.svgs.pix,
          QTheme.svgs.pagamentos,
        ];
      });
      testWidgets(
        'Renderização do componente com Behaviour.regular',
        (tester) async {
          //Configuração do Widget
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                bottomNavigationBar: BottomNavigationComponent(
                  key: const Key('bottom_navigation'),
                  behaviour: Behaviour.regular,
                  styles: BottomNavigationStyleSet.standard.build(),
                  selectedIndex: index,
                  svgPaths: list,
                  iconStyle: IconStyleSet.size36White,
                ),
              ),
            ),
          );

          //Variável com informações do widget
          final bottomNavigationComponent = tester.widget<BottomNavigationComponent>(
            find.byKey(
              const Key('bottom_navigation'),
            ),
          );

          // Verificações
          expect(find.byType(BottomNavigationComponent), findsOneWidget);
          expect(find.byType(QIcon), findsExactly(3));
          expect(bottomNavigationComponent.behaviour, Behaviour.regular);
          expect(
            bottomNavigationComponent.styles.regular.backgroundColor,
            QTheme.colors.primaryColorBase,
          );
          expect(
            bottomNavigationComponent.styles.regular.indicatorColor,
            QTheme.colors.white.withAlpha(
              (25 * 255 / 100).toInt(),
            ),
          );
        },
      );

      testWidgets(
        'Renderização do componente com Behaviour.disabled',
        (tester) async {
          //Configuração do Widget
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                bottomNavigationBar: BottomNavigationComponent(
                  key: const Key('bottom_navigation'),
                  behaviour: Behaviour.disabled,
                  styles: BottomNavigationStyleSet.standard.build(),
                  selectedIndex: index,
                  svgPaths: list,
                  iconStyle: IconStyleSet.size36White,
                ),
              ),
            ),
          );

          //Variável com informações do widget
          final bottomNavigationComponent = tester.widget<BottomNavigationComponent>(
            find.byKey(
              const Key('bottom_navigation'),
            ),
          );

          // Verificações
          expect(find.byType(BottomNavigationComponent), findsOneWidget);
          expect(find.byType(QIcon), findsExactly(3));
          expect(bottomNavigationComponent.behaviour, Behaviour.disabled);
          expect(
            bottomNavigationComponent.styles.disabled.backgroundColor,
            QTheme.colors.gray3,
          );
          expect(
            bottomNavigationComponent.styles.regular.indicatorColor,
            QTheme.colors.white.withAlpha(
              (25 * 255 / 100).toInt(),
            ),
          );
        },
      );

      testWidgets(
        'Renderização do componente com Behaviour.loading',
        (tester) async {
          //Configuração do Widget
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                bottomNavigationBar: BottomNavigationComponent(
                  key: const Key('bottom_navigation'),
                  behaviour: Behaviour.loading,
                  styles: BottomNavigationStyleSet.standard.build(),
                  selectedIndex: index,
                  svgPaths: list,
                  iconStyle: IconStyleSet.size36White,
                ),
              ),
            ),
          );

          //Variável com informações do widget
          final bottomNavigationComponent = tester.widget<BottomNavigationComponent>(
            find.byKey(
              const Key('bottom_navigation'),
            ),
          );

          // Verificações
          expect(find.byType(LoadingWidget), findsOneWidget);
          expect(bottomNavigationComponent.behaviour, Behaviour.loading);
        },
      );

      testWidgets(
        'Ação do onDestinationSelected',
        (tester) async {
          //Configuração do Widget
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                bottomNavigationBar: BottomNavigationComponent(
                  key: const Key('bottom_navigation'),
                  behaviour: Behaviour.regular,
                  styles: BottomNavigationStyleSet.standard.build(),
                  selectedIndex: index,
                  svgPaths: list,
                  iconStyle: IconStyleSet.size36White,
                  onDestinationSelected: (i) {
                    index = i;
                  },
                ),
              ),
            ),
          );

          //Navegação pix
          await tester.tap(find.byKey(Key(QTheme.svgs.pix)));
          await tester.pumpAndSettle();

          // Verificações
          expect(index, 1);

          //Navegação pagamentos
          await tester.tap(find.byKey(Key(QTheme.svgs.pagamentos)));
          await tester.pumpAndSettle();

          // Verificações
          expect(index, 2);

          //Navegação home
          await tester.tap(find.byKey(Key(QTheme.svgs.home)));
          await tester.pumpAndSettle();

          // Verificações
          expect(index, 0);
        },
      );
    },
  );
}
