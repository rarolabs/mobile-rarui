import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/molecules/otp_timer/otp_timer.dart';

void main() {
  testWidgets('ROtpTimer mostra código OTP inicial e atualiza após conclusão',
      (WidgetTester tester) async {
    String otpCode = 'Texto Inicial';
    final onCompleteCalled = ValueNotifier<bool>(false);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ROtpTimer(
            duration: const Duration(seconds: 1),
            strokeWidth: 8.0,
            width: 150,
            height: 150,
            borderColor: Colors.green,
            otpCodeLabel: otpCode,
            onComplete: () {
              onCompleteCalled.value = true;
              return '654321';
            },
          ),
        ),
      ),
    );

    expect(find.text('Texto Inicial'), findsOneWidget);

    await tester.pump(const Duration(seconds: 2));
    await tester.pump();

    expect(find.text('654321'), findsOneWidget);
    expect(onCompleteCalled.value, isTrue);
  });
}
