import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/rarui.dart';

void main() {
  testWidgets('RSliverAppBarLarge: deve renderizar corretamente',
      (tester) async {
    final rSliverAppBarLargeKey = const Key("sliver_app_bar_large");
    final widget = RSliverAppBarLarge(
      key: rSliverAppBarLargeKey,
      title: Text('Sliver App Bar Large'),
      backgroundColor: Colors.red,
      leading: Icon(Icons.arrow_back),
      actions: [
        Icon(Icons.search),
      ],
      centerTitle: true,
      expandedHeight: 300,
    );

    await tester.pumpWidget(MaterialApp(
        home: CustomScrollView(
      slivers: [widget],
    )));

    final sliverAppBar =
        tester.widget<RSliverAppBarLarge>(find.byType(RSliverAppBarLarge));

    final componentFinder = find.byKey(rSliverAppBarLargeKey);
    expect(componentFinder, findsOneWidget);

    expect(sliverAppBar.centerTitle, isTrue);
    expect(sliverAppBar.backgroundColor, Colors.red);
    expect(sliverAppBar.leading, isA<Icon>());
    expect(sliverAppBar.title, isA<Text>());
    expect(sliverAppBar.pinned, false);
    expect(sliverAppBar.expandedHeight, 300);
  });
}
