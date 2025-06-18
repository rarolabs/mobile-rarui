import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/label/label_specs.dart';
import 'tab_component.dart';
import 'tab_style.dart';

class TabSpecs extends TabComponent {
  const TabSpecs({
    super.key,
    required super.behaviour,
    required super.style,
    required super.tabs,
    required super.screens,
    super.tabBarHeightInPercent,
    super.onTabChanged,
    super.isScrollable,
    super.tabLabelPadding,
    super.tabController,
    super.initialIndex,
  });

  /// Estilos padrão para o tab
  static QTabStyles get standardStyle => QTabStyles(
        shared: QTabSharedStyle(
          loadingStyle: LoadingStyle(
            size: Size.zero,
            baseColor: QTheme.colors.gray1,
            highlightColor: QTheme.colors.gray2,
          ),
        ),
        regular: QTabStyle(
          indicatorColor: QTheme.colors.secondaryColorBase,
          unselectedLabelColor: QTheme.colors.gray1,
          labelColor: QTheme.colors.secondaryColorBase,
          dividerColor: QTheme.colors.gray1,
          labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        ),
        disabled: QTabStyle(
          indicatorColor: QTheme.colors.gray3,
          unselectedLabelColor: QTheme.colors.gray3,
          labelColor: QTheme.colors.gray3,
          dividerColor: QTheme.colors.gray3,
          labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        ),
      );

  /// Estilos padrão para o tab pix
  static QTabStyles get pixStyle => QTabStyles(
        shared: QTabSharedStyle(
          loadingStyle: LoadingStyle(
            size: Size.zero,
            baseColor: QTheme.colors.gray1,
            highlightColor: QTheme.colors.gray2,
          ),
        ),
        regular: QTabStyle(
          tabScrollPhysics: const ClampingScrollPhysics(),
          indicatorColor: QTheme.colors.secondaryColorBase,
          unselectedLabelColor: QTheme.colors.gray4,
          labelColor: QTheme.colors.gray5,
          dividerColor: QTheme.colors.gray2,
          labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        ),
        disabled: QTabStyle(
          indicatorColor: QTheme.colors.gray3,
          unselectedLabelColor: QTheme.colors.gray3,
          labelColor: QTheme.colors.gray3,
          dividerColor: QTheme.colors.gray3,
          labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        ),
      );

  /// Estilos padrão para o tab history
  static QTabStyles historyStyle() => QTabStyles(
        shared: QTabSharedStyle(
          loadingStyle: LoadingStyle(
            size: Size.zero,
            baseColor: QTheme.colors.gray1,
            highlightColor: QTheme.colors.gray2,
          ),
        ),
        regular: QTabStyle(
          tabScrollPhysics: const NeverScrollableScrollPhysics(),
          indicatorColor: QTheme.colors.secondaryColorBase,
          unselectedLabelColor: QTheme.colors.gray3,
          labelColor: QTheme.colors.gray5,
          dividerColor: Colors.transparent,
          labelStyle: LabelStyleSet.paragraphRoboto16SecondaryBold,
          unselectedLabelStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(
            color: QTheme.colors.gray2,
          ),
          indicatorWeight: 2,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 24),
        ),
        disabled: QTabStyle(
          indicatorColor: QTheme.colors.gray3,
          unselectedLabelColor: QTheme.colors.gray3,
          labelColor: QTheme.colors.gray3,
          dividerColor: Colors.transparent,
          labelStyle: LabelStyleSet.paragraphRoboto16Gray3Bold,
          unselectedLabelStyle: QTheme.fonts.paragraphRoboto16Regular.copyWith(
            color: QTheme.colors.gray3,
          ),
          indicatorWeight: 2,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 24),
        ),
      );

  /// Estilos padrão para o tab transferência
  static QTabStyles get transferStyle => QTabStyles(
        shared: QTabSharedStyle(
          loadingStyle: LoadingStyle(
            size: Size.zero,
            baseColor: QTheme.colors.gray1,
            highlightColor: QTheme.colors.gray2,
          ),
        ),
        regular: QTabStyle(
          tabScrollPhysics: const NeverScrollableScrollPhysics(),
          indicatorColor: QTheme.colors.secondaryColorBase,
          unselectedLabelColor: QTheme.colors.gray4,
          labelColor: QTheme.colors.gray5,
          dividerColor: QTheme.colors.gray1,
          labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        ),
        disabled: QTabStyle(
          indicatorColor: QTheme.colors.gray3,
          unselectedLabelColor: QTheme.colors.gray3,
          labelColor: QTheme.colors.gray3,
          dividerColor: QTheme.colors.gray3,
          labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        ),
      );
}
