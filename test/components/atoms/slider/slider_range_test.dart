import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/rarui.dart';

void main() {
  late ValueNotifier<RangeValues> initialValue =
      ValueNotifier(RangeValues(0.0, 0.5));
  late Widget widget;
  setUpAll(() {
    widget = ListenableBuilder(
        listenable: initialValue,
        builder: (context, _) {
          return RSliderRange(
            values: initialValue.value,
            onChanged: (value) {
              initialValue.value = value;
            },
          );
        });
  });
  testWidgets('RSliderRange: deve renderizar o componente corretamente',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
    final rSliderRangeFinder = find.byType(RSliderRange);
    expect(rSliderRangeFinder, findsOneWidget);
    var rSliderRange = tester.widget<RSliderRange>(rSliderRangeFinder);
    expect(rSliderRange.values.start, 0.0);
    expect(rSliderRange.values.end, 0.5);
  });

  testWidgets('RSLiderRange: deve alterar o valor do componente corretamente',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
    var sliderRangeFinder = find.byType(RSliderRange);
    var sliderRange = tester.widget<RSliderRange>(sliderRangeFinder);
    expect(sliderRange.values.start, 0.0);
    await tester.drag(sliderRangeFinder, Offset(100.0, 0.0));
    await tester.pumpAndSettle();
    sliderRangeFinder = find.byType(RSliderRange);
    sliderRange = tester.widget<RSliderRange>(sliderRangeFinder);
    expect(sliderRange.values.end, greaterThan(0.5));
  });
}
