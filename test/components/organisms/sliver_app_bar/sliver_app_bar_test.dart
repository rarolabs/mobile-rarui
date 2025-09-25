import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/rarui.dart';

void main() {
  testWidgets('RSliverAppBar: deve renderizar corretamente', (tester) async {
    final rAppBarKey = const Key("sliver_app_bar");
    final widget = RSliverAppBar(
      key: rAppBarKey,
      title: Text('Sliver App Bar'),
      backgroundColor: Colors.red,
      leading: Icon(Icons.arrow_back),
      actions: [
        Icon(Icons.search),
      ],
      centerTitle: true,
      pinned: true,
      expandedHeight: 200,
    );

    await tester.pumpWidget(MaterialApp(
        home: CustomScrollView(
      slivers: [widget],
    )));

    final sliverAppBar =
        tester.widget<RSliverAppBar>(find.byType(RSliverAppBar));

    final componentFinder = find.byKey(rAppBarKey);
    expect(componentFinder, findsOneWidget);

    expect(sliverAppBar.centerTitle, isTrue);
    expect(sliverAppBar.backgroundColor, Colors.red);
    expect(sliverAppBar.leading, isA<Icon>());
    expect(sliverAppBar.title, isA<Text>());
    expect(sliverAppBar.pinned, true);
    expect(sliverAppBar.expandedHeight, 200);
  });
}
