import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/rarui.dart';

void main() {
  testWidgets(
      'RSearchBar: deve renderizar corretamente as propriedades passadas',
      (tester) async {
    const leading = Icon(Icons.person);
    const trailing = [Icon(Icons.search)];
    // iniciando widget

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RSearchBar(
            controller: TextEditingController(),
            leading: leading,
            trailing: trailing,
          ),
        ),
      ),
    );

    // verificando se o widget foi criado
    expect(find.byType(RSearchBar), findsOneWidget);

    // Verificando se o leading e trailing foram criados
    final searchBar = tester.widget<RSearchBar>(find.byType(RSearchBar));
    expect(searchBar.leading, leading);
    expect(searchBar.trailing, trailing);
  });
}
