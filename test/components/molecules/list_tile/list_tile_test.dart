import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/molecules/list_tile/list_tile.dart';

void main() {
  testWidgets(
      'RListTile: deve renderizar corretamente as propriedades passadas',
      (tester) async {
    const leading = Text('leading');
    // iniciando widget

    await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: RListTile(leading: leading))));

    // verificando se o widget foi criado
    expect(find.byType(RListTile), findsOneWidget);

    // Verificando se o leading foi criado
    final listTile = tester.widget<RListTile>(find.byType(RListTile));
    expect(listTile.leading, leading);
  });
}
