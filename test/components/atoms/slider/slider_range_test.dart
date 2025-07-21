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
            showSubtitle: true,
            showInputs: true,
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
    final minTextFinder = find.text(rSliderRange.min.toString());
    final maxTextFinder = find.text(rSliderRange.min.toString());
    expect(minTextFinder, findsNWidgets(2));
    expect(maxTextFinder, findsNWidgets(2));
  });

  testWidgets('RSLiderRange: deve alterar o valor do componente corretamente',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
    var sliderRangeFinder = find.byType(RSliderRange);
    var sliderRange = tester.widget<RSliderRange>(sliderRangeFinder);
    expect(sliderRange.values.start, 0.0);
    final minInputFinder = find.byType(RTextFormField).first;
    final maxInputFinder = find.byType(RTextFormField).last;
    await tester.enterText(minInputFinder, "0.1");
    await tester.enterText(maxInputFinder, "0.8");
    await tester.pumpAndSettle();
    expect(find.text("0.1"), findsOne);
    expect(find.text("0.8"), findsOne);
  });
}
