import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/rarui.dart';

void main() {
  late Key buttonKey;
  late Key rSearchModalKey;
  late Widget widget;
  late List<String> options;
  String selectedValue = "";

  setUpAll(() {
    buttonKey = Key("button-key");
    rSearchModalKey = Key("search-modal-key");
    options = [
      "001 BCO DO BRASIL S.A",
      "003 BCO DA AMAZONIA S.A",
      "004 BCO DO NORDESTE DO BRASIL S.A",
      "010 CREDICOAMO",
      "012 BANCO INBURSA",
    ];

    widget = MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              StatefulBuilder(
                builder: (BuildContext context, setState) => RElevatedButton(
                  key: buttonKey,
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => RSearchModal<String>(
                      key: rSearchModalKey,
                      title: "Nome do banco",
                      subtitle:
                          "Digite o nome do banco ou o número da agência.",
                      searchLabel: "Busca",
                      searchHintText: "Digite o nome da instituição",
                      searchItems: options
                          .map((option) =>
                              RSearchModalItem(value: option, label: option))
                          .toList(),
                      onSelected: (value) {
                        selectedValue = value;
                      },
                      filterCondition: (value, item) {
                        return item.label
                            .toLowerCase()
                            .contains(value.toLowerCase());
                      },
                    ),
                  ),
                  child: const Text("Search"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  });

  testWidgets("RSearchModal: deve renderizar o componente corretamente",
      (tester) async {
    await tester.pumpWidget(widget);
    final searchButtonFinder = find.byKey(buttonKey);
    await tester.tap(searchButtonFinder);
    await tester.pumpAndSettle();
    final rSearchModalFinder = find.byKey(rSearchModalKey);
    expect(rSearchModalFinder, findsOneWidget);
    expect(find.text("Nome do banco"), findsOne);
    expect(
        find.text("Digite o nome do banco ou o número da agência."), findsOne);
  });

  testWidgets("RSearchModal: deve selecionar um itemcorretamente",
      (tester) async {
    await tester.pumpWidget(widget);
    final searchButtonFinder = find.byKey(buttonKey);
    await tester.tap(searchButtonFinder);
    await tester.pumpAndSettle();
    final rSearchModalFinder = find.byKey(rSearchModalKey);
    expect(rSearchModalFinder, findsOneWidget);
    final inputFinder = find.byType(RTextFormField);
    await tester.enterText(inputFinder, "001");
    await tester.pumpAndSettle();
    final itemFinder = find.text("001 BCO DO BRASIL S.A");
    expect(itemFinder, findsOne);
    await tester.tap(itemFinder);
    await tester.pumpAndSettle();
    expect(selectedValue, "001 BCO DO BRASIL S.A");
  });
}
