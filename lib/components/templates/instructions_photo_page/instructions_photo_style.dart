import '../../../shared_widget/loading_styles.dart';
import '../../atoms/label/label_specs.dart';
import '../../molecules/button/button_specs.dart';
import '../../molecules/text_icon/text_icon_style_set.dart';

class InstructionsPhotoSharedStyle {
  final LoadingStyle loadingStyle;

  InstructionsPhotoSharedStyle({required this.loadingStyle});
}

class InstructionsPhotoStyle {
  final LabelStyleSet titleLabelStyle;
  final LabelStyleSet subtitleLabelStyle;
  final TextIconStyleSet textIconStyleSet;
  final ButtonStyleSet buttonStyle;

  InstructionsPhotoStyle({
    required this.titleLabelStyle,
    required this.subtitleLabelStyle,
    required this.textIconStyleSet,
    required this.buttonStyle,
  });
}

class FaceDetectorStyles {
  final InstructionsPhotoSharedStyle sharedStyle;
  final InstructionsPhotoStyle regular;

  const FaceDetectorStyles({
    required this.sharedStyle,
    required this.regular,
  });
}
