import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/label/label.dart';
import 'package:rarUI/components/atoms/label/label_specs.dart';
import 'package:rarUI/components/molecules/otp_timer/otp_timer_component.dart';
import 'package:rarUI/components/molecules/otp_timer/otp_timer_style_set.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  testWidgets('Deve validar se o componente esta rendenrizando e se comportando corretamente', (tester) async {
    bool isComplete = false;

    await tester.pumpWidget(
      MaterialApp(
        home: OtpTimerComponent(
          behaviour: Behaviour.regular,
          styles: OtpTimerStyleSet.standard.build(),
          otpCodeLabelStyle: LabelStyleSet.h1Lato42SecondaryColorBaseBold,
          duration: const Duration(seconds: 5),
          otpCodeLabel: '123456',
          onComplete: () {
            isComplete = true;
          },
        ),
      ),
    );

    await tester.pump(const Duration(seconds: 6));
    expect(find.text('123456'), findsOne);

    final textStyleFinder = find.byWidgetPredicate(
      (widget) => widget is QLabel && widget.style == LabelStyleSet.h1Lato42SecondaryColorBaseBold,
    );

    expect(textStyleFinder, findsOne);
    expect(isComplete, isTrue);
  });
}
