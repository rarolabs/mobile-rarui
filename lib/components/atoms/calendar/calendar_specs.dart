import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import 'calendar_component.dart';
import 'calendar_style.dart';

part 'calendar_style_set.dart';

class CalendarSpecs extends CalendarComponent {
  const CalendarSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    super.locale,
    super.firstDate,
    super.currentDate,
    super.lastDate,
    super.onSelectedDate,
    super.lastDateCanBeSelected,
    super.labelSemantics,
    super.hintSemantics,
    super.disabledWeekends,
  });

  static CalendarStyles get standard => CalendarStyles(
        shared: CalendarSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(double.maxFinite, QSizes.x316),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
        ),
        regular: CalendarStyle(
          monthStyle: QTheme.fonts.paragraphRoboto16Bold,
          dayOfWeekStyle: QTheme.fonts.bodyRoboto16SemiBold,
          dateStyle: QTheme.fonts.bodyRoboto14Regular,
          selectedColor: QTheme.colors.primaryColorBase,
          textSelectedColor: QTheme.colors.white,
          textDisabledColor: QTheme.colors.gray3,
          backgroundColor: QTheme.colors.transparent,
          borderColor: QTheme.colors.transparent,
          iconActiveColor: QTheme.colors.secondaryColorBase,
          iconDisableColor: QTheme.colors.gray2,
          disabledColor: QTheme.colors.gray3,
        ),
        disabled: CalendarStyle(
          monthStyle: QTheme.fonts.paragraphRoboto16Bold,
          dayOfWeekStyle: QTheme.fonts.bodyRoboto16SemiBold,
          dateStyle: QTheme.fonts.bodyRoboto14Regular,
          selectedColor: QTheme.colors.gray5,
          textSelectedColor: QTheme.colors.white,
          textDisabledColor: QTheme.colors.gray3,
          backgroundColor: QTheme.colors.transparent,
          borderColor: QTheme.colors.transparent,
          iconActiveColor: QTheme.colors.gray2,
          iconDisableColor: QTheme.colors.gray2,
          disabledColor: QTheme.colors.gray3,
        ),
      );
}
