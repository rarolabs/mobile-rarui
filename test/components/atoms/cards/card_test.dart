import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/cards/card.dart';

void main() {
  testWidgets('RCard: deve renderizar corretamente', (tester) async {
    final widget = RCard(
      size: Size(100, 100),
      borderOnForeground: true,
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

    final card = tester.widget<RCard>(find.byType(RCard));
    final cardChild = card.child as Container;

    expect(card.borderOnForeground, isTrue);
    expect(card.size, Size(100, 100));
    expect(card.color, Colors.white);
    expect(card.elevation, 1);
    expect(card.margin, EdgeInsets.all(10));
    expect(card.shadowColor, Colors.black);
    expect(card.shape, RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
    expect(card.surfaceTintColor, Colors.white);
    expect(card.clipBehavior, Clip.hardEdge);
    expect(card.semanticContainer, isTrue);
    expect(card.child, isA<Container>());
    expect(cardChild.color, Colors.red);
  });
}
