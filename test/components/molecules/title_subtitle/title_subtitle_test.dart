import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/atoms/label/label.dart';
import 'package:rarui/components/molecules/title_subtitle/title_subtitle.dart';

void main() {
  testWidgets('RTitleSubtitle exibe título e subtítulo corretamente',
      (WidgetTester tester) async {
    const title = 'Título de Teste';
    const subTitle = 'Subtítulo de Teste';
    const spaceBetween = 8.0;

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
          body: RTitleSubtitle(
              title: title, subTitle: subTitle, spaceBetween: spaceBetween)),
    ));

    expect(find.text(title), findsOneWidget);

    expect(find.text(subTitle), findsOneWidget);

    expect(find.byType(RLabel), findsNWidgets(2));

    final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
    expect(sizedBox.height, spaceBetween);
  });
}
