import 'package:flutter/material.dart';

import '../../../theme/sizes.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../../atoms/atoms.dart';
import 'tab_style.dart';
import 'tab_style_set.dart';

class TabComponent extends StatelessWidget with Component<QTabStyle, QTabSharedStyle> {
  /// Responsável por definir o comportamento do componente
  final Behaviour behaviour;

  /// Responsável por definir o estilo do componente
  final TabStyleSet style;

  /// Lista de tabs
  final List<String> tabs;

  /// Lista de telas
  final List<Widget> screens;

  /// Função que será chamada quando o usuário mudar de tab
  final Function(int)? onTabChanged;

  /// Altura do tabbar em porcentagem da altura da tela
  final num? tabBarHeightInPercent;

  /// Se o tabbar deve ser scrollavel
  final bool isScrollable;

  /// Padding do label do tab
  final EdgeInsetsGeometry? tabLabelPadding;

  /// Controller do tab
  final TabController? tabController;

  /// Index da tab inicial
  final int initialIndex;

  const TabComponent({
    super.key,
    required this.behaviour,
    required this.style,
    required this.tabs,
    required this.screens,
    this.tabController,
    this.onTabChanged,
    this.tabBarHeightInPercent,
    this.isScrollable = false,
    this.tabLabelPadding,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Style(
      shared: style.specs.shared,
      regular: style.specs.regular,
      disabled: style.specs.disabled,
    );
    return render(context, behaviour, styles);
  }

  @override
  Widget whenRegular(
    QTabStyle style,
    QTabSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _BaseTab(
      key: key,
      behaviour: behaviour,
      tabs: tabs,
      screens: screens,
      style: style,
      onTap: onTabChanged,
      tabBarHeightInPercent: tabBarHeightInPercent,
      isScrollable: isScrollable,
      tabLabelPadding: tabLabelPadding,
      tabController: tabController,
      initialIndex: initialIndex,
    );
  }

  @override
  Widget whenDisabled(
    QTabStyle style,
    QTabSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _BaseTab(
      key: key,
      behaviour: behaviour,
      tabs: tabs,
      screens: screens,
      style: style,
      onTap: onTabChanged,
      tabBarHeightInPercent: tabBarHeightInPercent,
      isScrollable: isScrollable,
      tabLabelPadding: tabLabelPadding,
      tabController: tabController,
      initialIndex: initialIndex,
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
        Behaviour.loading: Behaviour.regular,
      };
}

class _BaseTab extends StatefulWidget {
  final Behaviour behaviour;
  final List<String> tabs;
  final List<Widget> screens;
  final QTabStyle style;
  final Function(int)? onTap;
  final TabController? tabController;

  final num? tabBarHeightInPercent;
  final bool isScrollable;
  final EdgeInsetsGeometry? tabLabelPadding;
  final int initialIndex;

  const _BaseTab({
    super.key,
    required this.behaviour,
    required this.tabs,
    required this.style,
    required this.screens,
    this.tabBarHeightInPercent,
    this.tabController,
    this.onTap,
    this.isScrollable = false,
    this.tabLabelPadding,
    this.initialIndex = 0,
  });

  @override
  State<_BaseTab> createState() => _BaseTabState();
}

class _BaseTabState extends State<_BaseTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late double _previousIndex;

  @override
  void initState() {
    super.initState();
    if (widget.tabController == null) {
      _initializeTabController();
    } else {
      _tabController = widget.tabController!;
    }
    _tabController.animation?.addListener(_onSwipe);
    _previousIndex = _tabController.index.toDouble();
  }

  void _initializeTabController() {
    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
      initialIndex: widget.initialIndex,
    );
  }

  void _onSwipe() {
    final currentIndex = _tabController.animation?.value ?? _previousIndex;
    final newIndex = currentIndex.round();

    if (newIndex != _previousIndex) {
      widget.onTap!(newIndex);
      _previousIndex = newIndex.toDouble();
    }
  }

  @override
  void dispose() {
    _tabController.animation?.removeListener(_onSwipe);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = widget.tabs;
    final screens = widget.screens;

    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.sizeOf(context).height * (widget.tabBarHeightInPercent ?? QSizes.x0),
      ),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: IgnorePointer(
              ignoring: widget.behaviour == Behaviour.disabled,
              child: TabBar(
                controller: _tabController,
                onTap: widget.onTap,
                isScrollable: widget.isScrollable,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: QSizes.x8,
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: widget.style.indicatorColor,
                      width: QSizes.x4,
                    ),
                  ),
                ),
                tabAlignment: widget.isScrollable ? TabAlignment.center : TabAlignment.fill,
                labelPadding: widget.tabLabelPadding ?? EdgeInsets.zero,
                indicatorColor: widget.style.indicatorColor,
                unselectedLabelColor: widget.style.unselectedLabelColor,
                labelColor: widget.style.labelColor,
                dividerColor: widget.style.dividerColor,
                unselectedLabelStyle: widget.style.unselectedLabelStyle,
                tabs: tabs
                    .map((text) => Tab(
                            child: QLabel(
                          style: widget.style.labelStyle,
                          behaviour: widget.behaviour,
                          text: text,
                        ),),)
                    .toList(),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: widget.style.tabScrollPhysics,
              children: screens,
            ),
          ),
        ],
      ),
    );
  }
}
