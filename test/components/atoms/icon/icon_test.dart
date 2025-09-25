import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/atoms/atoms.dart';

void main() {
  late RIcon widget;

  setUpAll(() {
    widget = RIcon(
      Icons.abc,
      size: 24.0,
      color: Colors.amber,
    );
  });

  testWidgets('RIcon: deve renderizar o componente corretamente',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
    final rIconFinder = find.byType(RIcon);
    expect(rIconFinder, findsOneWidget);
    final rIcon = tester.widget<RIcon>(rIconFinder);
    expect(rIcon.icon, Icons.abc);
    expect(rIcon.size, 24.0);
    expect(rIcon.color, Colors.amber);
  });
}
