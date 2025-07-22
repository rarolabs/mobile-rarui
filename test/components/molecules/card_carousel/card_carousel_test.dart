import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/rarui.dart';

void main() {
  testWidgets('RCardCarousel: Deve renderizar o componente corretamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RCardCarousel(
            title: "Title",
            subtitle: "Subtitle",
            actionLabel: "Action",
            cardIcon: RIcon(Icons.abc),
            onTap: () {},
          ),
        ),
      ),
    );
    final titleTextFinder = find.text("Title");
    expect(titleTextFinder, findsOne);
    final subtitleTextFinder = find.text("Subtitle");
    expect(subtitleTextFinder, findsOne);
    final actionTextFinder = find.text("Action");
    expect(actionTextFinder, findsOne);
    final iconFinder = find.byIcon(Icons.abc);
    expect(iconFinder, findsOne);
  });
}
