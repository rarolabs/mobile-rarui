import 'dart:ui';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import 'bottom_navigation_component.dart';
import 'bottom_navigation_style.dart';

part 'bottom_navigation_style_set.dart';

class BottomNavigationSpecs extends BottomNavigationComponent {
  const BottomNavigationSpecs({
    required super.behaviour,
    required super.styles,
    required super.selectedIndex,
    required super.iconStyle,
    super.onDestinationSelected,
    super.svgPaths,
    super.key,
  });

  /// Estilo usado para a construção do [BottomNavigation] na cor [primaryColorBase]
  static QBottomNavigationStyles standard() {
    return QBottomNavigationStyles(
      regular: QBottomNavigationStyle(
        backgroundColor: QTheme.colors.primaryColorBase,
        indicatorColor: QTheme.colors.white.withAlpha((25 * 255 / 100).toInt()),
        height: QSizes.x76,
      ),
      shared: QBottomNavigationSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x76),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QBottomNavigationStyle(
        backgroundColor: QTheme.colors.gray3,
        indicatorColor: QTheme.colors.white.withAlpha((25 * 255 / 100).toInt()),
        height: QSizes.x76,
      ),
    );
  }
}
