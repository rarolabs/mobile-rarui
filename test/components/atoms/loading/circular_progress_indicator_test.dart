import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/loading/circular_progress_indicator.dart';

void main() {
  testWidgets('Deve renderizar o widget RCircularProgressIndicator corretamente', (tester) async {
    const key = Key('circular_progress_indicator');
    final widget = const RCircularProgressIndicator(
      key: key,
      backgroundColor: Colors.red,
      color: Colors.blue,
      strokeWidth: 2,
      strokeCap: StrokeCap.round,
      strokeAlign: BorderSide.strokeAlignOutside,
      value: 0.5,
      valueColor: AlwaysStoppedAnimation(Colors.green),
      constraints: BoxConstraints(maxWidth: 100, maxHeight: 100),
      padding: EdgeInsets.all(10),
      semanticsLabel: 'Loading',
      semanticsValue: '0.5',
      trackGap: 10,
    );

    await tester.pumpWidget(MaterialApp(home: widget));

    // Validando se o widget foi renderizado
    expect(find.byKey(key), findsOneWidget);
    expect(find.byType(RCircularProgressIndicator), findsOneWidget);

    final RCircularProgressIndicator circularProgress = tester.widget(find.byKey(key));

    expect(circularProgress.backgroundColor, equals(Colors.red));
    expect(circularProgress.color, equals(Colors.blue));
    expect(circularProgress.strokeWidth, equals(2));
    expect(circularProgress.strokeCap, equals(StrokeCap.round));
    expect(circularProgress.strokeAlign, equals(BorderSide.strokeAlignOutside));
    expect(circularProgress.value, equals(0.5));
    expect(circularProgress.valueColor, isNotNull);
    expect(circularProgress.constraints, equals(BoxConstraints(maxWidth: 100, maxHeight: 100)));
    expect(circularProgress.trackGap, equals(10));
    expect(circularProgress.padding, equals(EdgeInsets.all(10)));
    expect(circularProgress.semanticsLabel, equals('Loading'));
    expect(circularProgress.semanticsValue, equals('0.5'));
  });
}
