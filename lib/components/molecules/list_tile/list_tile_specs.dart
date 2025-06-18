import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/divider/divider_specs.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';
import '../../atoms/toggle/toggle_specs.dart';
import '../list_tile/list_tile_component.dart';
import '../list_tile/list_tile_style.dart';

class ListTileSpecs extends ListTileComponent {
  const ListTileSpecs({
    super.key,
    required super.styles,
    required super.title,
    super.statusText,
    super.subtitle,
    super.onPressed,
    required super.behaviour,
    super.hintSemantics,
    super.labelSemantics,
    super.onPressedTrailingIcon,
    super.svgPathLeading,
    super.svgPathTrailing,
    super.trailingLabel,
    super.trailingToggle,
    super.valueToggle,
    super.onPressedToggle,
    super.trailingRadio,
    super.valueRadio,
    super.onPressedRadio,
  });

  /// Representa o ListTile principal, incluíndo leadingIcon, trailingIcon, title e subTitle
  static QListTileStyles get standardStyle => QListTileStyles(
        shared: QListTileSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(double.infinity, QSizes.x68),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
          titleStyle: LabelStyleSet.bodyRoboto14Gray5Medium,
          subtitleStyle: LabelStyleSet.captionRoboto12Gray5Regular,
          dividerStyleSet: DividerStyleSet.standard,
          trailingLabelStyle: LabelStyleSet.captionRoboto12Gray5Bold,
        ),
        regular: QListTileStyle(
          centralized: true,
          verticalPadding: QSizes.x20,
          spaceBetweenTexts: QSizes.x4,
          trailingIconStyle: IconStyleSet.size24Gray5,
          leadingIconStyle: IconStyleSet.size24Gray5,
        ),
        disabled: QListTileStyle(
          activeColor: QTheme.colors.gray2,
          centralized: true,
          verticalPadding: QSizes.x20,
          spaceBetweenTexts: QSizes.x4,
          trailingIconStyle: IconStyleSet.size24SecondaryBase,
          leadingIconStyle: IconStyleSet.size24SecondaryBase,
        ),
      );
  static QListTileStyles get standardDisabledWithStatusText => QListTileStyles(
        shared: QListTileSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(double.infinity, QSizes.x68),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
          titleStyle: LabelStyleSet.bodyRoboto14Gray3Medium,
          statusStyle: LabelStyleSet.bodyRoboto14Gray5Medium,
          subtitleStyle: LabelStyleSet.captionRoboto12Gray3Regular,
          dividerStyleSet: DividerStyleSet.standard,
          trailingLabelStyle: LabelStyleSet.captionRoboto12Gray5Bold,
        ),
        regular: QListTileStyle(
          centralized: true,
          verticalPadding: QSizes.x20,
          spaceBetweenTexts: QSizes.x4,
          trailingIconStyle: IconStyleSet.size24Gray5,
          leadingIconStyle: IconStyleSet.size24Gray3,
        ),
        disabled: QListTileStyle(
          activeColor: QTheme.colors.gray2,
          centralized: true,
          verticalPadding: QSizes.x20,
          spaceBetweenTexts: QSizes.x4,
          trailingIconStyle: IconStyleSet.size24SecondaryBase,
          leadingIconStyle: IconStyleSet.size24SecondaryBase,
        ),
      );

  static QListTileStyles get standardDisabledWithStatusTextMiniTrailingIcon => QListTileStyles(
        shared: QListTileSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(double.infinity, QSizes.x68),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
          titleStyle: LabelStyleSet.bodyRoboto14Gray3Medium,
          statusStyle: LabelStyleSet.bodyRoboto14Gray5Medium,
          subtitleStyle: LabelStyleSet.captionRoboto12Gray3Regular,
          dividerStyleSet: DividerStyleSet.standard,
          trailingLabelStyle: LabelStyleSet.captionRoboto12Gray5Bold,
        ),
        regular: QListTileStyle(
          centralized: true,
          verticalPadding: QSizes.x20,
          spaceBetweenTexts: QSizes.x4,
          trailingIconStyle: IconStyleSet.size16Gray5,
          leadingIconStyle: IconStyleSet.size16Gray5,
          addSpaceBetweenTrailingIconAndLabel: QSizes.x4,
        ),
        disabled: QListTileStyle(
          activeColor: QTheme.colors.gray2,
          centralized: true,
          verticalPadding: QSizes.x20,
          spaceBetweenTexts: QSizes.x4,
          trailingIconStyle: IconStyleSet.size16SecondaryBase,
          leadingIconStyle: IconStyleSet.size16SecondaryBase,
          addSpaceBetweenTrailingIconAndLabel: QSizes.x4,
        ),
      );

  static QListTileStyles get standardDisabledWithStatusTextMiniSecondaryTrailingIcon => QListTileStyles(
        shared: QListTileSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(double.infinity, QSizes.x68),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
          titleStyle: LabelStyleSet.bodyRoboto14Gray3Medium,
          statusStyle: LabelStyleSet.bodyRoboto14Gray5Medium,
          subtitleStyle: LabelStyleSet.captionRoboto12Gray3Regular,
          dividerStyleSet: DividerStyleSet.standard,
          trailingLabelStyle: LabelStyleSet.captionRoboto12Gray5Bold,
        ),
        regular: QListTileStyle(
          centralized: true,
          verticalPadding: QSizes.x20,
          spaceBetweenTexts: QSizes.x4,
          trailingIconStyle: IconStyleSet.size16SecondaryBase,
          leadingIconStyle: IconStyleSet.size16SecondaryBase,
          addSpaceBetweenTrailingIconAndLabel: QSizes.x4,
        ),
        disabled: QListTileStyle(
          activeColor: QTheme.colors.gray2,
          centralized: true,
          verticalPadding: QSizes.x20,
          spaceBetweenTexts: QSizes.x4,
          trailingIconStyle: IconStyleSet.size16SecondaryBase,
          leadingIconStyle: IconStyleSet.size16SecondaryBase,
          addSpaceBetweenTrailingIconAndLabel: QSizes.x4,
        ),
      );

  static QListTileStyles get standardTrailingSecondary0 => QListTileStyles(
        shared: QListTileSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(double.infinity, QSizes.x68),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
          dividerStyleSet: DividerStyleSet.standard,
          titleStyle: LabelStyleSet.bodyRoboto14Gray5SemiBold,
          subtitleStyle: LabelStyleSet.captionRoboto12Gray5Regular,
          trailingLabelStyle: LabelStyleSet.captionRoboto12Gray5Bold,
        ),
        regular: QListTileStyle(
          centralized: true,
          verticalPadding: QSizes.x20,
          spaceBetweenTexts: QSizes.x4,
          leadingIconStyle: IconStyleSet.size24Gray5,
          trailingIconStyle: IconStyleSet.size24SecondaryBase,
        ),
        disabled: QListTileStyle(
          activeColor: QTheme.colors.gray2,
          centralized: false,
          verticalPadding: QSizes.x20,
          trailingIconStyle: IconStyleSet.size24SecondaryBase,
          leadingIconStyle: IconStyleSet.size24SecondaryBase,
          spaceBetweenTexts: QSizes.x4,
        ),
      );

  /// Representa o ListTile sem incluír o subTitle
  static QListTileStyles get standardTrailingSuccessStyle => QListTileStyles(
        shared: QListTileSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(double.infinity, QSizes.x68),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
          dividerStyleSet: DividerStyleSet.standard,
          titleStyle: LabelStyleSet.bodyRoboto14Gray5SemiBold,
          subtitleStyle: LabelStyleSet.captionRoboto12Gray4Regular,
          trailingLabelStyle: LabelStyleSet.captionRoboto12Gray5Bold,
        ),
        regular: QListTileStyle(
          centralized: true,
          verticalPadding: QSizes.x20,
          leadingIconStyle: IconStyleSet.size24Gray5,
          trailingIconStyle: IconStyleSet.size16Success0,
        ),
        disabled: QListTileStyle(
          centralized: true,
          activeColor: QTheme.colors.gray2,
          verticalPadding: QSizes.x20,
          leadingIconStyle: IconStyleSet.size24Gray5,
          trailingIconStyle: IconStyleSet.size16Success0,
        ),
      );

  /// Representa o ListTile sem incluír o leadingIcon
  static QListTileStyles get titleCaption14Gray4SubtitleRoboto14Gray5Style => QListTileStyles(
        shared: QListTileSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(double.infinity, QSizes.x108),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
          dividerStyleSet: DividerStyleSet.standard,
          subtitleStyle: LabelStyleSet.bodyRoboto16Gray5Medium,
          titleStyle: LabelStyleSet.captionRoboto14Gray4Regular,
          trailingLabelStyle: LabelStyleSet.captionRoboto12Gray5Bold,
        ),
        regular: QListTileStyle(
          verticalPadding: QSizes.x16,
          spaceBetweenTexts: QSizes.x4,
          leadingIconStyle: IconStyleSet.size24Gray5,
          trailingIconStyle: IconStyleSet.size24SecondaryBase,
        ),
        disabled: QListTileStyle(
          verticalPadding: QSizes.x16,
          spaceBetweenTexts: QSizes.x4,
          leadingIconStyle: IconStyleSet.size24Gray5,
          trailingIconStyle: IconStyleSet.size24Gray5,
        ),
      );

  /// Representa o ListTile sem incluír o leadingIcon
  static QListTileStyles get radioStyle => QListTileStyles(
        shared: QListTileSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(double.infinity, QSizes.x108),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
          dividerStyleSet: DividerStyleSet.standard,
          subtitleStyle: LabelStyleSet.captionRoboto12Gray4Regular,
          titleStyle: LabelStyleSet.bodyRoboto14Gray5Medium,
          trailingLabelStyle: LabelStyleSet.captionRoboto12Gray5Bold,
        ),
        regular: QListTileStyle(
          verticalPadding: QSizes.x16,
          spaceBetweenTexts: QSizes.x4,
          leadingIconStyle: IconStyleSet.size24Gray5,
          trailingIconStyle: IconStyleSet.size24Gray5,
        ),
        disabled: QListTileStyle(
          verticalPadding: QSizes.x16,
          spaceBetweenTexts: QSizes.x4,
          leadingIconStyle: IconStyleSet.size24Gray5,
          trailingIconStyle: IconStyleSet.size24Gray5,
        ),
      );

  /// Representa o ListTile sem incluír o leadingIcon
  static QListTileStyles get titleCaption14Gray4SubtitleRoboto16Gray5Style => QListTileStyles(
        shared: QListTileSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(double.infinity, QSizes.x108),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
          dividerStyleSet: DividerStyleSet.standard,
          titleStyle: LabelStyleSet.captionRoboto14Gray4Regular,
          subtitleStyle: LabelStyleSet.bodyRoboto16Gray5Medium,
          trailingLabelStyle: LabelStyleSet.captionRoboto14Gray4Regular,
        ),
        regular: QListTileStyle(
          verticalPadding: QSizes.x24,
          spaceBetweenTexts: QSizes.x4,
          leadingIconStyle: IconStyleSet.size24Gray5,
          trailingIconStyle: IconStyleSet.size24Gray5,
        ),
        disabled: QListTileStyle(
          verticalPadding: QSizes.x24,
          spaceBetweenTexts: QSizes.x4,
          leadingIconStyle: IconStyleSet.size24Gray5,
          trailingIconStyle: IconStyleSet.size24Gray5,
        ),
      );

  /// Representa o ListTile sem incluír o leadingIcon
  static QListTileStyles get titleRoboto14Gray4SubtitleRoboto14Gray5Style => QListTileStyles(
        shared: QListTileSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(double.infinity, QSizes.x108),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
          dividerStyleSet: DividerStyleSet.standard,
          subtitleStyle: LabelStyleSet.bodyRoboto14Gray5Medium,
          titleStyle: LabelStyleSet.captionRoboto14Gray4Regular,
          trailingLabelStyle: LabelStyleSet.bodyRoboto14Gray5Medium,
        ),
        regular: QListTileStyle(
          verticalPadding: QSizes.x12,
          spaceBetweenTexts: QSizes.x4,
          leadingIconStyle: IconStyleSet.size24Gray5,
          trailingIconStyle: IconStyleSet.size20SecondaryBase,
        ),
        disabled: QListTileStyle(
          verticalPadding: QSizes.x12,
          spaceBetweenTexts: QSizes.x4,
          leadingIconStyle: IconStyleSet.size24Gray5,
          trailingIconStyle: IconStyleSet.size24Gray5,
        ),
      );

  /// Representa o ListTile principal, incluíndo leadingIcon, trailingIcon, title e subTitle
  static QListTileStyles get standardErrorStyle => QListTileStyles(
        shared: QListTileSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(double.infinity, QSizes.x68),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
          titleStyle: LabelStyleSet.bodyRoboto14ErrorRegular,
          subtitleStyle: LabelStyleSet.bodyRoboto14ErrorRegular,
          dividerStyleSet: DividerStyleSet.standard,
          trailingLabelStyle: LabelStyleSet.captionRoboto12Gray5Bold,
        ),
        regular: QListTileStyle(
          centralized: true,
          verticalPadding: QSizes.x20,
          spaceBetweenTexts: QSizes.x4,
          trailingIconStyle: IconStyleSet.size24Error,
          leadingIconStyle: IconStyleSet.size24Error,
        ),
        disabled: QListTileStyle(
          activeColor: QTheme.colors.gray2,
          centralized: true,
          verticalPadding: QSizes.x20,
          spaceBetweenTexts: QSizes.x4,
          leadingIconStyle: IconStyleSet.size24Gray5,
          trailingIconStyle: IconStyleSet.size24Gray5,
        ),
      );

  /// Representa o ListTile principal, incluíndo leadingIcon, trailingIcon, title e subTitle
  static QListTileStyles get transactionStyle => QListTileStyles(
        shared: QListTileSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(double.infinity, QSizes.x68),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
          titleStyle: LabelStyleSet.bodyRoboto14Gray5Medium,
          subtitleStyle: LabelStyleSet.captionRoboto12Gray4Regular,
          dividerStyleSet: DividerStyleSet.standard,
          trailingLabelStyle: LabelStyleSet.captionRoboto14Gray5Bold,
        ),
        regular: QListTileStyle(
          centralized: true,
          verticalPadding: QSizes.x20,
          spaceBetweenTexts: QSizes.x4,
          trailingIconStyle: IconStyleSet.size24Error,
          leadingIconStyle: IconStyleSet.size24Error,
        ),
        disabled: QListTileStyle(
          activeColor: QTheme.colors.gray2,
          centralized: true,
          verticalPadding: QSizes.x20,
          spaceBetweenTexts: QSizes.x4,
          leadingIconStyle: IconStyleSet.size24Gray5,
          trailingIconStyle: IconStyleSet.size24Gray5,
        ),
      );

  static QListTileStyles get toogleStyle => QListTileStyles(
        shared: QListTileSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(double.infinity, QSizes.x68),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
          dividerStyleSet: DividerStyleSet.standard,
          titleStyle: LabelStyleSet.bodyRoboto14Gray5SemiBold,
          subtitleStyle: LabelStyleSet.captionRoboto12Gray5Regular,
          trailingLabelStyle: LabelStyleSet.captionRoboto12Gray5Bold,
          trailingToggleStyle: ToggleStyleSet.secundaryColor,
        ),
        regular: QListTileStyle(
          centralized: true,
          verticalPadding: QSizes.x20,
          spaceBetweenTexts: QSizes.x4,
          leadingIconStyle: IconStyleSet.size24Gray5,
          trailingIconStyle: IconStyleSet.size24SecondaryBase,
        ),
        disabled: QListTileStyle(
          activeColor: QTheme.colors.gray2,
          centralized: false,
          verticalPadding: QSizes.x20,
          trailingIconStyle: IconStyleSet.size24SecondaryBase,
          leadingIconStyle: IconStyleSet.size24SecondaryBase,
          spaceBetweenTexts: QSizes.x4,
        ),
      );
}
