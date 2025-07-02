import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/refresh_indicator/refresh_indicator.dart';

void main() {
  group('RRefreshIndicator Tests', () {
    testWidgets('Should render with default values',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: RRefreshIndicator(
            onRefresh: () async {},
            child: ListView(children: [Text('Test Content')]),
          ),
        ),
      ));

      expect(find.byType(RefreshIndicator), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('Should use custom colors when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RRefreshIndicator(
              onRefresh: () async {},
              color: Colors.red,
              backgroundColor: Colors.black,
              child: ListView(),
            ),
          ),
        ),
      );

      final refreshIndicator =
          tester.widget<RefreshIndicator>(find.byType(RefreshIndicator));
      expect(refreshIndicator.color, Colors.red);
      expect(refreshIndicator.backgroundColor, Colors.black);
    });

    testWidgets('Should use theme colors when custom colors not provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.light(primary: Colors.green),
            scaffoldBackgroundColor: Colors.white,
          ),
          home: Scaffold(
            body: RRefreshIndicator(
              onRefresh: () async {},
              child: ListView(),
            ),
          ),
        ),
      );

      final refreshIndicator =
          tester.widget<RefreshIndicator>(find.byType(RefreshIndicator));
      expect(refreshIndicator.color, Colors.green);
      expect(refreshIndicator.backgroundColor, Colors.white);
    });

    testWidgets('Should trigger refresh callback', (WidgetTester tester) async {
      bool refreshCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RRefreshIndicator(
              onRefresh: () async => refreshCalled = true,
              child: ListView(),
            ),
          ),
        ),
      );

      // Simulate pull-to-refresh gesture
      await tester.drag(find.byType(ListView), const Offset(0.0, 300.0));
      await tester.pumpAndSettle();

      expect(refreshCalled, isTrue);
    });
  });
}
