import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/label/label_specs.dart';
import '../../molecules/button/button_specs.dart';
import '../../molecules/list_tile/list_tile_style_set.dart';
import 'proof_page_component.dart';
import 'proof_page_style.dart';

part 'proof_page_style_set.dart';

class ProofPageSpecs extends ProofPageComponent {
  const ProofPageSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.title,
    required super.subtitle,
    super.firstSectionTitleText,
    super.details,
    required super.firstSection,
    super.secondSectionTitleText,
    required super.secondSection,
    super.endSection,
    required super.logoImagePath,
    super.observationText,
    required super.secondaryButtonText,
    required super.onScreenShotPressed,
    required super.onBackPressed,
    super.labelSemantics,
    super.hintSemantics,
  });

  /// Estilo padrão comprovante de pagamento
  static ProofPageStyles get standard {
    return ProofPageStyles(
      regular: ProofPageStyle(
        titleStyle: LabelStyleSet.h5Lato20Gray5Bold,
        subtitleStyle: LabelStyleSet.captionRoboto14Gray4Regular,
        inlineTitleStyle: LabelStyleSet.captionRoboto14Gray4Regular,
        inlineValueStyle: LabelStyleSet.bodyRoboto14Gray5Medium,
        listTileStyle: ListTileStyleSet.titleCaption14Gray4SubtitleRoboto14Gray5,
        sectionTitleStyle: LabelStyleSet.bodyRoboto16Gray5Medium,
        observationTitleStyle: LabelStyleSet.captionRoboto14Gray3Regular,
        buttonStyleSet: ButtonStyleSet.primaryBase,
      ),
      shared: ProofPageSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
    );
  }
}
