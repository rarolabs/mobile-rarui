import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/tokens.dart';
import '../../atoms/label/label_specs.dart';
import '../../molecules/button/button_specs.dart';
import '../../molecules/text_icon/text_icon_style_set.dart';
import 'instructions_photo_component.dart';
import 'instructions_photo_style.dart';

class InstructionsPhotoSpecs extends InstructionsPhotoComponent {
  const InstructionsPhotoSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    super.onPressedBackButton,
    required super.appBarTitle,
    required super.title,
    required super.subtitle,
    required super.textIcons,
    required super.textButton,
    required super.onPressedButton,
    super.semanticsLabel,
    super.semanticsHint,
  });

  static FaceDetectorStyles get regularStyle {
    return FaceDetectorStyles(
      sharedStyle: InstructionsPhotoSharedStyle(
        loadingStyle: LoadingStyle(
          size: Size.zero,
          baseColor: QTheme.colors.transparent,
          highlightColor: QTheme.colors.transparent,
        ),
      ),
      regular: InstructionsPhotoStyle(
        titleLabelStyle: LabelStyleSet.h5Lato20Gray5Bold,
        subtitleLabelStyle: LabelStyleSet.captionRoboto14Gray4Regular,
        textIconStyleSet: TextIconStyleSet.body16IconCiano,
        buttonStyle: ButtonStyleSet.primaryBase,
      ),
    );
  }
}
