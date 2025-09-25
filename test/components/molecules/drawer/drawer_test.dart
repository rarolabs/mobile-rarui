import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/molecules/drawer/drawer.dart';

void main() {
  testWidgets('RDrawer: deve rederizar o widget corretamente', (tester) async {
    final widget = RDrawer(
      backgroundColor: Colors.white,
      elevation: 10,
      width: 200,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      semanticLabel: 'teste',
      surfaceTintColor: Colors.blue,
      child: Container(
        color: Colors.red,
      ),
    );

    await tester.pumpWidget(MaterialApp(home: widget));
    expect(find.byType(RDrawer), findsOneWidget);

    final drawer = tester.widget<RDrawer>(find.byType(RDrawer));
    final drawerChild = drawer.child as Container?;

    expect(drawer.backgroundColor, Colors.white);
    expect(drawer.elevation, 10);
    expect(drawer.width, 200);
    expect(drawer.shadowColor, Colors.black);
    expect(drawer.shape,
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
    expect(drawer.semanticLabel, 'teste');
    expect(drawer.surfaceTintColor, Colors.blue);

    expect(drawerChild, isA<Container>());
    expect(drawerChild?.color, Colors.red);
  });
}
