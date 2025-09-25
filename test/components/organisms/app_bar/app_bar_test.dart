import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/rarui.dart';

void main() {
  testWidgets('RAppBar: deve renderizar corretamente', (tester) async {
    final rAppBarKey = const Key("app_bar");
    final widget = RAppBar(
      key: rAppBarKey,
      title: Text('App Bar'),
      backgroundColor: Colors.red,
      leading: Icon(Icons.arrow_back),
      actions: [
        Icon(Icons.search),
      ],
      centerTitle: true,
    );

    await tester.pumpWidget(MaterialApp(home: widget));

    final appBar = tester.widget<RAppBar>(find.byType(RAppBar));

    expect(appBar.centerTitle, isTrue);
    expect(appBar.backgroundColor, Colors.red);
    final componentFinder = find.byKey(rAppBarKey);
    expect(componentFinder, findsOneWidget);
    expect(appBar.leading, isA<Icon>());
    expect(appBar.title, isA<Text>());
  });
}
