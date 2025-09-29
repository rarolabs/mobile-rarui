import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/atoms/loading/linear_progress_indicator.dart';

void main() {
  testWidgets('RLinearProgressIndicator: deve renderizar corretamente',
      (tester) async {
    final widget = await const RLinearProgressIndicator(
      backgroundColor: Colors.red,
      borderRadius: 10,
      color: Colors.blue,
      minHeight: 10,
      stopIndicatorColor: Colors.green,
      stopIndicatorRadius: 10,
      trackGap: 10,
      value: 0.5,
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.yellow),
      semanticsLabel: 'test',
      semanticsValue: 'test',
    );

    // Validando se o widget foi renderizado
    await tester.pumpWidget(MaterialApp(home: widget));
    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    final progressIndicator = tester
        .widget<LinearProgressIndicator>(find.byType(LinearProgressIndicator));

    // Validando backgroundColor
    final backgroundColor = progressIndicator.backgroundColor;
    expect(backgroundColor, Colors.red);

    // Validando borderRadius
    final borderRadius = progressIndicator.borderRadius;
    expect(borderRadius, BorderRadius.circular(10));

    // Validando color
    final color = progressIndicator.color;
    expect(color, Colors.blue);

    // Validando minHeight
    final minHeight = progressIndicator.minHeight;
    expect(minHeight, 10);

    // Validando stopIndicatorColor
    final stopIndicatorColor = progressIndicator.stopIndicatorColor;
    expect(stopIndicatorColor, Colors.green);

    // Validando stopIndicatorRadius
    final stopIndicatorRadius = progressIndicator.stopIndicatorRadius;
    expect(stopIndicatorRadius, 10);

    // Validando trackGap
    final trackGap = progressIndicator.trackGap;
    expect(trackGap, 10);

    // Validando value
    final value = progressIndicator.value;
    expect(value, 0.5);

    // Validando valueColor
    final valueColor = progressIndicator.valueColor;
    expect(valueColor, const AlwaysStoppedAnimation<Color>(Colors.yellow));

    // Validando semanticsLabel
    final semanticsLabel = progressIndicator.semanticsLabel;
    expect(semanticsLabel, 'test');

    // Validando semanticsValue
    final semanticsValue = progressIndicator.semanticsValue;
    expect(semanticsValue, 'test');
  });
}
