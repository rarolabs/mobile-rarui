import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/cards/card_filled.dart';

void main() {
  testWidgets('RCardFilled: deve renderizar corretamente', (tester) async {
    final widget = RCardFilled(
      borderOnForeground: true,
      size: Size(100, 100),
      color: Colors.white,
      elevation: 1,
      margin: EdgeInsets.all(10),
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      surfaceTintColor: Colors.white,
      clipBehavior: Clip.hardEdge,
      semanticContainer: true,
      child: Container(
        color: Colors.red,
      ),
    );

    await tester.pumpWidget(MaterialApp(home: widget));

    final card = tester.widget<RCardFilled>(find.byType(RCardFilled));
    final cardChild = card.child as Container;

    expect(card.borderOnForeground, isTrue);
    expect(card.size, Size(100, 100));
    expect(card.color, equals(Colors.white));
    expect(card.elevation, equals(1));
    expect(card.margin, equals(EdgeInsets.all(10)));
    expect(card.shadowColor, equals(Colors.black));
    expect(card.shape, equals(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
    expect(card.surfaceTintColor, equals(Colors.white));
    expect(card.clipBehavior, equals(Clip.hardEdge));
    expect(card.semanticContainer, isTrue);
    expect(cardChild.color, equals(Colors.red));
  });
}
