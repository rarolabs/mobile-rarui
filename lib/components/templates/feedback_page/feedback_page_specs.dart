import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';
import '../../molecules/button/button_specs.dart';
import 'feedback_page_component.dart';
import 'feedback_page_style.dart';

part 'feedback_page_style_set.dart';

class FeedbackPageSpecs extends FeedbackPageComponent {
  const FeedbackPageSpecs({
    super.key,
    required super.behaviour,
    super.primaryButtonBehaviour,
    required super.styles,
    required super.title,
    super.primaryButtonText,
    super.secondaryButtonText,
    super.descriptionTextList,
    super.onBackPressed,
    required super.onPrimaryButtonPressed,
    required super.onSecondaryButtonPressed,
    super.hintSemantics,
    super.labelSemantics,
    super.onPopInvokedWithResult,
  });

  /// Usado para feedbacks negativos
  static FeedbackPageStyles get error => FeedbackPageStyles(
        regular: FeedbackPageStyle(
          titleStyle: LabelStyleSet.h5Lato20Gray5Bold,
          descriptionStyle: LabelStyleSet.captionRoboto14Gray4Regular,
          primaryButtonStyle: ButtonStyleSet.primaryBase,
          secondaryButtonStyle: ButtonStyleSet.secondaryBase,
          feedbackIconPath: QTheme.svgs.feedbackError,
          feedbackIconStyle: IconStyleSet.size72ErrorBase,
          descriptionTextAlign: TextAlign.left,
        ),
        shared: FeedbackPageSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(QSizes.x108, QSizes.x32),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
        ),
      );

  /// Usado para feedbacks positivos
  static FeedbackPageStyles get success => FeedbackPageStyles(
        regular: FeedbackPageStyle(
          titleStyle: LabelStyleSet.h5Lato20Gray5Bold,
          descriptionStyle: LabelStyleSet.captionRoboto14Gray4Regular,
          primaryButtonStyle: ButtonStyleSet.primaryBase,
          feedbackIconPath: QTheme.svgs.feedbackSuccess,
          feedbackIconStyle: IconStyleSet.size72SuccessBase,
        ),
        shared: FeedbackPageSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(QSizes.x108, QSizes.x32),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
        ),
      );

  /// Usado para feedbacks de alerta
  static FeedbackPageStyles get warning => FeedbackPageStyles(
        regular: FeedbackPageStyle(
          titleStyle: LabelStyleSet.h5Lato20Gray5Bold,
          descriptionStyle: LabelStyleSet.captionRoboto14Gray4Regular,
          primaryButtonStyle: ButtonStyleSet.primaryBase,
          feedbackIconPath: QTheme.svgs.warning,
          feedbackIconStyle: IconStyleSet.size72WarningBase,
        ),
        shared: FeedbackPageSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(QSizes.x108, QSizes.x32),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
        ),
      );

  /// Usado para feedback ao encerrar a conta
  static FeedbackPageStyles get closeAccount => FeedbackPageStyles(
        regular: FeedbackPageStyle(
          titleStyle: LabelStyleSet.h5Lato20Gray5Bold,
          descriptionStyle: LabelStyleSet.captionRoboto14Gray4Regular,
          primaryButtonStyle: ButtonStyleSet.primaryRed,
          secondaryButtonStyle: ButtonStyleSet.secondaryBase,
          feedbackIconPath: QTheme.svgs.sentimentDissatisfied,
          feedbackIconStyle: IconStyleSet.size72Gray5,
          descriptionTextAlign: TextAlign.center,
        ),
        shared: FeedbackPageSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(QSizes.x108, QSizes.x32),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
        ),
      );

  /// Usado para feedback ao encerrar a conta com alguma pendência
  static FeedbackPageStyles get warningCloseAccount => FeedbackPageStyles(
        regular: FeedbackPageStyle(
          titleStyle: LabelStyleSet.h5Lato20Gray5Bold,
          descriptionStyle: LabelStyleSet.captionRoboto14Gray4Regular,
          primaryButtonStyle: ButtonStyleSet.primaryBase,
          secondaryButtonStyle: ButtonStyleSet.secondaryBase,
          feedbackIconPath: QTheme.svgs.attention,
          feedbackIconStyle: IconStyleSet.size72WarningLight,
          descriptionTextAlign: TextAlign.center,
        ),
        shared: FeedbackPageSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(QSizes.x108, QSizes.x32),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
        ),
      );
}
