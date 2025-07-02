import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/avatar/avatar.dart';

void main() {
  group('RAvatar Widget Tests', () {
    testWidgets('Renderiza RAvatar com CircleAvatar e sem topNumber',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RAvatar(
              radius: 20,
              child: Text('A'),
            ),
          ),
        ),
      );

      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.text('A'), findsOneWidget);
      expect(find.text('null'), findsNothing); // topNumber ausente
    });

    testWidgets('Exibe topNumber quando fornecido',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RAvatar(
              topNumber: 42,
              radius: 20,
            ),
          ),
        ),
      );

      expect(find.textContaining('42'), findsOneWidget);
    });

    testWidgets('Aplica cor vermelha no topNumber em modo claro',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: RAvatar(
              topNumber: 1,
              radius: 20,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(Positioned),
              matching: find.byType(Container),
            )
            .first,
      );

      final BoxDecoration? decoration = container.decoration as BoxDecoration?;
      expect(decoration?.color, equals(Colors.red));
    });

    testWidgets('Aplica cor personalizada do CircleAvatar',
        (WidgetTester tester) async {
      const customColor = Colors.green;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RAvatar(
              backgroundColor: customColor,
              radius: 30,
            ),
          ),
        ),
      );

      final avatar = tester.widget<CircleAvatar>(find.byType(CircleAvatar));
      expect(avatar.backgroundColor, equals(customColor));
    });
  });
}
