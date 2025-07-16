import 'package:flutter/material.dart';
import 'package:rarUI/components/molecules/tabs/secondary_tab.dart';

class RSecondaryTabBar extends StatefulWidget {
  const RSecondaryTabBar({
    super.key,
    required this.tabs,
    required this.tabsContent,
    this.isScrollable = false,
    this.dividerColor,
    this.dividerHeight,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
  }) : assert(tabs.length == tabsContent.length);

  final List<RSecondaryTab> tabs;
  final List<Widget> tabsContent;
  final Color? indicatorColor;
  final bool isScrollable;
  final Color? dividerColor;
  final double? dividerHeight;
  final Color? labelColor;
  final Color? unselectedLabelColor;

  @override
  State<RSecondaryTabBar> createState() => RSecondaryTabBarState();
}

class RSecondaryTabBarState extends State<RSecondaryTabBar> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
    );
  }

  void updateIndex(int newIndex) {
    _tabController.animateTo(newIndex);
  }

  int get currentTabIndex => _tabController.index;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar.secondary(
          controller: _tabController,
          tabs: widget.tabs,
          indicatorColor: widget.indicatorColor,
          isScrollable: widget.isScrollable,
          dividerColor: widget.dividerColor,
          dividerHeight: widget.dividerHeight,
          labelColor: widget.labelColor,
          unselectedLabelColor: widget.unselectedLabelColor,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.tabsContent,
          ),
        ),
      ],
    );
  }
}
