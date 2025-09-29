import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/organisms/tab_pix/tab_pix.dart';
import 'package:rarui/components/organisms/tab_pix/tab_pix_list_tile_entity.dart';

void main() {
  final mockFirstTabItems = [
    TabPixListTileEntity(title: 'First Item 1', onTap: () {}),
    TabPixListTileEntity(title: 'First Item 2', onTap: () {}),
  ];

  final mockSecondTabItems = [
    TabPixListTileEntity(title: 'Second Item 1', onTap: () {}),
    TabPixListTileEntity(title: 'Second Item 2', onTap: () {}),
  ];

  group('RTabPix Tests', () {
    testWidgets('should render with basic configuration',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RTabPix(
              firstTabText: 'Tab 1',
              secondTabText: 'Tab 2',
              firstTabListTileTitles: mockFirstTabItems,
              secondTabListTileTitles: mockSecondTabItems,
            ),
          ),
        ),
      );

      expect(find.text('Tab 1'), findsOneWidget);
      expect(find.text('Tab 2'), findsOneWidget);

      expect(find.text('First Item 1'), findsOneWidget);
      expect(find.text('Second Item 1'), findsNothing);
    });

    testWidgets('should switch between tabs', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RTabPix(
              firstTabText: 'Tab 1',
              secondTabText: 'Tab 2',
              firstTabListTileTitles: mockFirstTabItems,
              secondTabListTileTitles: mockSecondTabItems,
            ),
          ),
        ),
      );

      // Tap on second tab
      await tester.tap(find.text('Tab 2'));
      await tester.pumpAndSettle();

      expect(find.text('Second Item 1'), findsOneWidget);
      expect(find.text('First Item 1'), findsNothing);
    });

    testWidgets('should render all list items in both tabs',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RTabPix(
              firstTabText: 'Tab 1',
              secondTabText: 'Tab 2',
              firstTabListTileTitles: mockFirstTabItems,
              secondTabListTileTitles: mockSecondTabItems,
            ),
          ),
        ),
      );

      expect(find.text('First Item 1'), findsOneWidget);
      expect(find.text('First Item 2'), findsOneWidget);

      await tester.tap(find.text('Tab 2'));
      await tester.pumpAndSettle();

      expect(find.text('Second Item 1'), findsOneWidget);
      expect(find.text('Second Item 2'), findsOneWidget);
    });

    testWidgets('should apply custom colors when provided',
        (WidgetTester tester) async {
      const testColor = Colors.red;
      const testUnselectedColor = Colors.grey;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RTabPix(
              firstTabText: 'Tab 1',
              secondTabText: 'Tab 2',
              firstTabListTileTitles: mockFirstTabItems,
              secondTabListTileTitles: mockSecondTabItems,
              labelColor: testColor,
              tabIndicatorColor: testColor,
              tabUnselectedLabelColor: testUnselectedColor,
            ),
          ),
        ),
      );

      final tabBar = tester.widget<TabBar>(find.byType(TabBar));
      expect(tabBar.labelColor, testColor);
      expect(tabBar.unselectedLabelColor, testUnselectedColor);
    });

    testWidgets('should respect isScrollable property',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RTabPix(
              firstTabText: 'Tab 1',
              secondTabText: 'Tab 2',
              firstTabListTileTitles: mockFirstTabItems,
              secondTabListTileTitles: mockSecondTabItems,
              isTabScrollable: true,
            ),
          ),
        ),
      );

      final tabBar = tester.widget<TabBar>(find.byType(TabBar));
      expect(tabBar.isScrollable, isTrue);
    });
  });
}
