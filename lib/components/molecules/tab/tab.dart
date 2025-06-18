import 'tab_specs.dart';
import 'tab_style_set.dart';

class QTab extends TabSpecs {
  final TabStyleSet styleSet;

  const QTab({
    super.key,
    required super.behaviour,
    required this.styleSet,
    required super.tabs,
    super.onTabChanged,
    required super.screens,
    super.tabLabelPadding,
    super.tabBarHeightInPercent,
    super.isScrollable,
    super.tabController,
    super.initialIndex,
  }) : super(style: styleSet);

  /// Construtor de tab para [login]
  /// Contem 2 tabs e 2 telas
  const QTab.login({
    super.key,
    required super.behaviour,
    required super.tabs,
    super.onTabChanged,
    required super.screens,
    super.tabController,
    super.initialIndex,
  })  : styleSet = TabStyleSet.standard,
        super(
          style: TabStyleSet.standard,
          tabBarHeightInPercent: 0.12,
        );

  /// Construtor de tab para [pix]
  /// Podem Conter N tabs e N telas
  const QTab.pix({
    super.key,
    required super.behaviour,
    required super.tabs,
    super.onTabChanged,
    required super.screens,
    super.tabLabelPadding,
    super.tabController,
    super.isScrollable = false,
    super.initialIndex,
  })  : styleSet = TabStyleSet.pix,
        super(style: TabStyleSet.pix);

  /// Construtor de tab para [transferência]
  /// Podem Conter N tabs e N telas
  const QTab.transfer({
    super.key,
    required super.behaviour,
    required super.tabs,
    super.onTabChanged,
    required super.screens,
    super.tabLabelPadding,
    super.tabController,
  })  : styleSet = TabStyleSet.transfer,
        super(
          style: TabStyleSet.transfer,
          isScrollable: false,
        );
}
