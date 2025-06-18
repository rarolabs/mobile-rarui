import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/tokens.dart';
import 'bottom_sheet_component.dart';
import 'bottom_sheet_style.dart';

part 'bottom_sheet_style_set.dart';

class BottomSheetSpecs extends BottomSheetComponent {
  const BottomSheetSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    super.title,
    super.titleAlign,
    super.bottomSheetSet,
    required super.content,
    super.primaryButton,
    super.secondaryButton,
  });

  static BottomSheetStyles get standardStyle {
    return BottomSheetStyles(
      shared: BottomSheetSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.maxFinite, QSizes.x800),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: BottomSheetStyle(
        paddingBottomSheet: const EdgeInsets.fromLTRB(
          QSizes.x36,
          QSizes.x52,
          QSizes.x36,
          QSizes.x24,
        ),
        titlePadding: const EdgeInsets.only(bottom: QSizes.x16),
        primaryButtonPadding: const EdgeInsets.only(top: QSizes.x24, bottom: QSizes.x8),
        secondaryButtonPadding: EdgeInsets.zero,
        backgroundHandle: QTheme.colors.gray1,
        foregroundHandle: QTheme.colors.primaryColorBase,
        backgroundColor: QTheme.colors.white,
      ),
    );
  }

  static BottomSheetStyles get radioStyle {
    return BottomSheetStyles(
      shared: BottomSheetSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.maxFinite, QSizes.x800),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: BottomSheetStyle(
        paddingBottomSheet: const EdgeInsets.fromLTRB(
          QSizes.x12,
          QSizes.x52,
          QSizes.x12,
          QSizes.x24,
        ),
        titlePadding: const EdgeInsets.only(bottom: QSizes.x8),
        primaryButtonPadding: const EdgeInsets.only(top: QSizes.x24, bottom: QSizes.x8),
        secondaryButtonPadding: EdgeInsets.zero,
        backgroundHandle: QTheme.colors.gray1,
        foregroundHandle: QTheme.colors.primaryColorBase,
        backgroundColor: QTheme.colors.white,
      ),
    );
  }

  static BottomSheetStyles get deleteStyle {
    return BottomSheetStyles(
      shared: BottomSheetSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.maxFinite, QSizes.x800),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: BottomSheetStyle(
        paddingBottomSheet: const EdgeInsets.fromLTRB(
          QSizes.x24,
          QSizes.x52,
          QSizes.x24,
          QSizes.x24,
        ),
        titlePadding: const EdgeInsets.only(bottom: QSizes.x8),
        primaryButtonPadding: const EdgeInsets.only(
          top: QSizes.x24,
          bottom: QSizes.x8,
        ),
        secondaryButtonPadding: EdgeInsets.zero,
        backgroundHandle: QTheme.colors.gray1,
        foregroundHandle: QTheme.colors.primaryColorBase,
        backgroundColor: QTheme.colors.white,
      ),
    );
  }

  static BottomSheetStyles get calendarStyle {
    return BottomSheetStyles(
      shared: BottomSheetSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x200, QSizes.x200),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: BottomSheetStyle(
        paddingBottomSheet: const EdgeInsets.fromLTRB(
          QSizes.x12,
          QSizes.x24,
          QSizes.x12,
          QSizes.x16,
        ),
        titlePadding: const EdgeInsets.only(bottom: QSizes.x8),
        primaryButtonPadding: const EdgeInsets.only(
          top: QSizes.x24,
          bottom: QSizes.x8,
          left: QSizes.x24,
          right: QSizes.x24,
        ),
        secondaryButtonPadding: const EdgeInsets.symmetric(horizontal: QSizes.x24),
        backgroundHandle: QTheme.colors.gray1,
        foregroundHandle: QTheme.colors.primaryColorBase,
        backgroundColor: QTheme.colors.white,
      ),
    );
  }

  static BottomSheetStyles get searchStyle {
    return BottomSheetStyles(
      shared: BottomSheetSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x200, QSizes.x200),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: BottomSheetStyle(
        paddingBottomSheet: const EdgeInsets.fromLTRB(
          QSizes.x12,
          QSizes.x8,
          QSizes.x12,
          QSizes.x16,
        ),
        titlePadding: const EdgeInsets.only(bottom: QSizes.x8),
        primaryButtonPadding: const EdgeInsets.only(
          top: QSizes.x24,
          bottom: QSizes.x8,
          left: QSizes.x24,
          right: QSizes.x24,
        ),
        secondaryButtonPadding: const EdgeInsets.symmetric(horizontal: QSizes.x24),
        backgroundHandle: QTheme.colors.gray1,
        foregroundHandle: QTheme.colors.primaryColorBase,
        backgroundColor: QTheme.colors.white,
      ),
    );
  }

  static BottomSheetStyles get listTileStyle {
    return BottomSheetStyles(
      shared: BottomSheetSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.maxFinite, QSizes.x800),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: BottomSheetStyle(
        paddingBottomSheet: const EdgeInsets.fromLTRB(
          QSizes.x12,
          QSizes.x52,
          QSizes.x12,
          QSizes.x24,
        ),
        titlePadding: const EdgeInsets.only(bottom: QSizes.x8),
        primaryButtonPadding: const EdgeInsets.only(top: QSizes.x24, bottom: QSizes.x8),
        secondaryButtonPadding: EdgeInsets.zero,
        backgroundHandle: QTheme.colors.gray1,
        foregroundHandle: QTheme.colors.primaryColorBase,
        backgroundColor: QTheme.colors.white,
      ),
    );
  }

  static BottomSheetStyles get couponStyle {
    return BottomSheetStyles(
      shared: BottomSheetSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.maxFinite, QSizes.x800),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: BottomSheetStyle(
        paddingBottomSheet: const EdgeInsets.fromLTRB(
          QSizes.x36,
          QSizes.x52,
          QSizes.x36,
          QSizes.x24,
        ),
        titlePadding: const EdgeInsets.only(bottom: QSizes.x16),
        primaryButtonPadding: const EdgeInsets.symmetric(
          vertical: QSizes.x12,
        ),
        secondaryButtonPadding: EdgeInsets.zero,
        backgroundHandle: QTheme.colors.gray1,
        foregroundHandle: QTheme.colors.primaryColorBase,
        backgroundColor: QTheme.colors.white,
      ),
    );
  }
}
