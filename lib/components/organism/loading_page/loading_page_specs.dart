import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/circular_progress/circular_progress_specs.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';
import 'loading_page_component.dart';
import 'loading_page_style.dart';

part 'loading_page_style_set.dart';

class LoadingPageSpecs extends QLoadingPageComponent {
  const LoadingPageSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    super.title,
    super.description,
    super.onPressed,
    super.showCloseButton,
    super.labelSemantics,
    super.hintSemantics,
  });

  static LoadingPageStyles get loading {
    return LoadingPageStyles(
      shared: LoadingPageSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.white,
          highlightColor: QTheme.colors.white,
        ),
      ),
      regular: LoadingPageStyle(
        backgroundColor: QTheme.colors.primaryColorBase,
        titleLabelStyle: LabelStyleSet.h5Lato20WhiteBold,
        descriptionLabelStyle: LabelStyleSet.bodyRoboto16WhiteRegular,
        circularProgressStyle: CircularProgressStyleSet.large85Gray2Style,
        iconStyle: IconStyleSet.size14White,
      ),
    );
  }
}
