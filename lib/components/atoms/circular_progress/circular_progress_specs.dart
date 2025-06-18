import 'dart:ui';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import 'circular_progress_component.dart';
import 'circular_progress_style.dart';

part 'circular_progress_style_set.dart';

class CircularProgressSpecs extends CircularProgressComponent {
  const CircularProgressSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    super.hintSemantics,
    super.labelSemantics,
  });

  static QCircularProgressStyles get small12Gray2Style {
    return QCircularProgressStyles(
      regular: CircularProgressStyle(
        color: QTheme.colors.gray2,
        backgroundColor: QTheme.colors.transparent,
        strokeWidth: QSizes.x4,
        radius: QSizes.x12,
      ),
      shared: CircularProgressSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(
            QSizes.x44,
            QSizes.x44,
          ),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
    );
  }

  static QCircularProgressStyles get small12SuccessColorBaseStyle {
    return QCircularProgressStyles(
      regular: CircularProgressStyle(
        color: QTheme.colors.successColorBase,
        backgroundColor: QTheme.colors.transparent,
        strokeWidth: QSizes.x4,
        radius: QSizes.x12,
      ),
      shared: CircularProgressSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(
            QSizes.x44,
            QSizes.x44,
          ),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
    );
  }

  static QCircularProgressStyles get small12ErrorColorBaseStyle {
    return QCircularProgressStyles(
      regular: CircularProgressStyle(
        color: QTheme.colors.errorColorBase,
        backgroundColor: QTheme.colors.transparent,
        strokeWidth: QSizes.x4,
        radius: QSizes.x12,
      ),
      shared: CircularProgressSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(
            QSizes.x44,
            QSizes.x44,
          ),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
    );
  }

  static QCircularProgressStyles get small12PrimaryColorBaseStyle {
    return QCircularProgressStyles(
      regular: CircularProgressStyle(
        color: QTheme.colors.primaryColorBase,
        backgroundColor: QTheme.colors.transparent,
        strokeWidth: QSizes.x4,
        radius: QSizes.x12,
      ),
      shared: CircularProgressSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(
            QSizes.x44,
            QSizes.x44,
          ),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
    );
  }

  static QCircularProgressStyles get large85Gray2Style {
    return QCircularProgressStyles(
      regular: CircularProgressStyle(
        color: QTheme.colors.gray2,
        backgroundColor: QTheme.colors.transparent,
        strokeWidth: QSizes.x16,
        radius: QSizes.x84,
      ),
      shared: CircularProgressSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(
            QSizes.x44,
            QSizes.x44,
          ),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
    );
  }
}
