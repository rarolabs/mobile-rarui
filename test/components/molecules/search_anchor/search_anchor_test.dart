import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/rarui.dart';

void main() {
  testWidgets(
      'RSearchAnchor: deve renderizar corretamente as propriedades passadas',
      (tester) async {
    const leading = Icon(Icons.person);
    const trailing = [Icon(Icons.search)];
    const searchBarKey = Key('searchBarKey');
    const suggestions = ['Sugestão 1', 'Sugestão 2'];

    // iniciando widget
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: RSearchAnchor(
      builder: (context, controller) {
        return RSearchBar(
          key: searchBarKey,
          controller: controller,
          leading: leading,
          trailing: trailing,
          onTap: () {
            controller.openView();
          },
        );
      },
      suggestionsBuilder: (context, controller) {
        return List.generate(suggestions.length, (index) {
          return Text(suggestions[index]);
        });
      },
    ))));

    // verificando se o widget foi criado
    expect(find.byType(RSearchAnchor), findsOneWidget);
    expect(find.byType(RSearchBar), findsOneWidget);

    // Verificando se o leading e trailing foram criados
    final searchBar = tester.widget<RSearchBar>(find.byType(RSearchBar));
    expect(searchBar.leading, leading);
    expect(searchBar.trailing, trailing);

    // Verificando se as sugestões estão funcionando corretamente
    await tester.tap(find.byKey(searchBarKey));
    expect(find.byKey(searchBarKey), findsOneWidget);
    expect(find.text(suggestions[0]), findsNothing);
    await tester.pumpAndSettle();
    expect(find.text(suggestions[0]), findsOneWidget);
  });
}
