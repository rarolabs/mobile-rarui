import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/label/label.dart';

void main() {
  testWidgets('QLabel deve renderizar corretamente', (tester) async {
    final widget = const QLabel(
      text: 'Texto de Exemplo',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      semanticsLabel: 'Label semântico',
      semanticsIdentifier: 'Identificador semântico',
    );

    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    expect(find.byType(QLabel), findsOneWidget);

    final textWidget = tester.widget<Text>(find.byType(Text));

    expect(textWidget.data, 'Texto de Exemplo');

    final textStyle = textWidget.style;
    expect(textStyle?.fontSize, 18);
    expect(textStyle?.fontWeight, FontWeight.bold);
    expect(textStyle?.color, Colors.red);
    expect(textWidget.textAlign, TextAlign.center);
    expect(textWidget.maxLines, 1);
    expect(textWidget.overflow, TextOverflow.ellipsis);


    final semantics = tester.getSemantics(find.byType(QLabel));
    expect(semantics.label, 'Label semântico');
    expect(semantics.identifier, 'Identificador semântico');
  });
}
