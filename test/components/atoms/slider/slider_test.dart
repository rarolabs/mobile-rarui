import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/rarui.dart';

void main() {
  late ValueNotifier<double> initialValue = ValueNotifier(0.0);
  late Widget widget;
  setUpAll(() {
    widget = ListenableBuilder(
        listenable: initialValue,
        builder: (context, _) {
          return RSlider(
            value: initialValue.value,
            showSubtitle: true,
            onChanged: (value) {
              initialValue.value = value;
            },
          );
        });
  });
  testWidgets('RSlider: deve renderizar o componente corretamente',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
    final rSliderFinder = find.byType(RSlider);
    expect(rSliderFinder, findsOneWidget);
    var rSlider = tester.widget<RSlider>(rSliderFinder);
    expect(rSlider.value, 0.0);
    expect(rSlider.showSubtitle, true);
    final textMinFinder = find.text(rSlider.min.toString());
    final textMaxFinder = find.text(rSlider.max.toString());
    expect(textMinFinder, findsOne);
    expect(textMaxFinder, findsOne);
  });

  testWidgets('RSLider: deve alterar o valor do componente corretamente',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
    var rSliderFinder = find.byType(RSlider);
    var rSlider = tester.widget<RSlider>(rSliderFinder);
    expect(rSlider.value, 0.0);
    var sliderFinder = find.byType(Slider);
    await tester.drag(sliderFinder, Offset(10.0, 0.0));
    await tester.pumpAndSettle();
    var slider = tester.widget<Slider>(sliderFinder);
    expect(slider.value, greaterThan(0.0));
  });
}
