import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/tokens.dart';
import '../../atoms/label/label_specs.dart';
import '../../molecules/button/button_specs.dart';
import 'face_detector_component.dart';
import 'face_detector_style.dart';

class FaceDetectorSpecs extends FaceDetectorComponent {
  const FaceDetectorSpecs({
    super.key,
    required super.behaviour,
    required super.cameraController,
    required super.styles,
    super.onPressedBackButton,
    required super.appBarTitle,
    required super.headerLabel,
    required super.textButtonCancel,
    required super.onDetectFace,
    required super.onCancel,
    super.semanticsLabel,
    super.semanticsHint,
  });

  static FaceDetectorStyles get regularStyle {
    return FaceDetectorStyles(
      sharedStyle: FaceDetectorSharedStyle(
        loadingStyle: LoadingStyle(
          size: Size.zero,
          baseColor: QTheme.colors.transparent,
          highlightColor: QTheme.colors.transparent,
        ),
      ),
      regular: FaceDetectorStyle(
        headerLabelStyle: LabelStyleSet.h5Roboto20Gray8Bold,
        cancelButtonStyle: ButtonStyleSet.tertiaryGray9,
      ),
    );
  }
}
