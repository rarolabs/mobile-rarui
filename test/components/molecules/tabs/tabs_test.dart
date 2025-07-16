import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/tabs/primary_tab.dart';
import 'package:rarUI/components/molecules/tabs/primary_tab_bar.dart';
import 'package:rarUI/components/molecules/tabs/secondary_tab.dart';
import 'package:rarUI/components/molecules/tabs/secondary_tab_bar.dart';

import '../../utils/widget_tester_extension.dart';

void main() {
  testWidgets('Componente é renderizado - Primary.', (tester) async {
    Key rTabKey = const Key("PrimaryTabBar");
    String label1 = "Tab #1";
    String label2 = "Tab #2";

    await tester.pumpMaterialComponent(
      RPrimaryTabBar(
        key: rTabKey,
        tabs: [
          RPrimaryTab(label: label1),
          RPrimaryTab(label: label2),
        ],
        tabsContent: [
          Container(color: Colors.red),
          Container(color: Colors.blue),
        ],
      ),
    );

    final componentFinder = find.byKey(rTabKey);
    expect(componentFinder, findsOneWidget);

    final findText1 = find.text(label1);
    final findText2 = find.text(label1);
    expect(findText1, findsOneWidget);
    expect(findText2, findsOneWidget);
  });

  testWidgets('Componente é renderizado - Secondary.', (tester) async {
    Key rTabKey = const Key("SecondaryTabBar");
    String label1 = "Tab #11";
    String label2 = "Tab #22";

    await tester.pumpMaterialComponent(
      RSecondaryTabBar(
        key: rTabKey,
        tabs: [
          RSecondaryTab(label: label1, badgeText: '12'),
          RSecondaryTab(
            label: label2,
            badgeText: '99+',
          ),
        ],
        tabsContent: [
          Container(color: Colors.red),
          Container(color: Colors.blue),
        ],
      ),
    );

    final componentFinder = find.byKey(rTabKey);
    expect(componentFinder, findsOneWidget);

    final findText1 = find.text(label1);
    final findText2 = find.text(label1);
    expect(findText1, findsOneWidget);
    expect(findText2, findsOneWidget);
  });

  testWidgets('Testa mudança de aba.', (tester) async {
    GlobalKey<RPrimaryTabBarState> wKey = GlobalKey();
    String label1 = "Carros";
    String label2 = "Naves";

    await tester.pumpMaterialComponent(
      RPrimaryTabBar(
        key: wKey,
        tabs: [
          RPrimaryTab(
            label: label1,
            icon: Icon(Icons.car_crash_outlined),
          ),
          RPrimaryTab(label: label2, icon: Icon(Icons.airplanemode_active)),
        ],
        tabsContent: [
          Container(
            color: Colors.amber,
            child: Text("V1"),
          ),
          Container(
            color: Colors.greenAccent,
            child: Text("V2"),
          ),
        ],
      ),
    );
    int? currentTabIndex = wKey.currentState?.currentTabIndex;
    expect(currentTabIndex, 0);

    wKey.currentState?.updateIndex(1);
    await tester.pump();

    currentTabIndex = wKey.currentState?.currentTabIndex;
    expect(currentTabIndex, 1);
  });
}
