import 'face_detector_specs.dart';
import 'face_detector_style_set.dart';

class QFaceDetectorPage extends FaceDetectorSpecs {
  final FaceDetectorStyleSet style;

  const QFaceDetectorPage({
    super.key,
    required super.behaviour,
    required super.cameraController,
    super.appBarTitle,
    required this.style,
    required super.headerLabel,
    required super.textButtonCancel,
    required super.onCancel,
    required super.onDetectFace,
    super.semanticsLabel,
    super.semanticsHint,
  }) : super(styles: style);

  const QFaceDetectorPage.regular({
    super.key,
    required super.behaviour,
    super.onPressedBackButton,
    required super.cameraController,
    super.appBarTitle,
    required super.headerLabel,
    required super.textButtonCancel,
    required super.onCancel,
    required super.onDetectFace,
    super.semanticsLabel,
    super.semanticsHint,
  })  : style = FaceDetectorStyleSet.regular,
        super(styles: FaceDetectorStyleSet.regular);
}
