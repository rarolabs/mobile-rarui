import 'face_detector_specs.dart';
import 'face_detector_style.dart';

enum FaceDetectorStyleSet {
  regular;

  const FaceDetectorStyleSet();

  FaceDetectorStyles get specs {
    return switch (this) {
      regular => FaceDetectorSpecs.regularStyle,
    };
  }
}
