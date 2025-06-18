import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/circular_progress/circular_progress_component.dart';
import 'package:rarUI/components/atoms/circular_progress/circular_progress_specs.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  testWidgets('QCircularProgress', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CircularProgressComponent(
            behaviour: Behaviour.regular,
            key: Key('circular-progress'),
            styles: CircularProgressStyleSet.small12Gray2Style,
            hintSemantics: 'test hintSemantics',
            labelSemantics: 'test labelSemantics',
          ),
        ),
      ),
    );
    expect(find.byType(CircularProgressComponent), findsOneWidget);
  });
}
