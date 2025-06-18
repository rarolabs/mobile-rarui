import '../../../shared_widget/loading_styles.dart';
import '../../atoms/label/label_specs.dart';
import '../../molecules/button/button_specs.dart';

class FaceDetectorSharedStyle {
  final LoadingStyle loadingStyle;

  FaceDetectorSharedStyle({required this.loadingStyle});
}

class FaceDetectorStyle {
  final LabelStyleSet headerLabelStyle;
  final ButtonStyleSet cancelButtonStyle;

  FaceDetectorStyle({
    required this.headerLabelStyle,
    required this.cancelButtonStyle,
  });
}

class FaceDetectorStyles {
  final FaceDetectorSharedStyle sharedStyle;
  final FaceDetectorStyle regular;

  const FaceDetectorStyles({
    required this.sharedStyle,
    required this.regular,
  });
}
