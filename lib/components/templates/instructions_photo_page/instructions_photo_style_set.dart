import 'instructions_photo_specs.dart';
import 'instructions_photo_style.dart';

enum InstructionsPhotoStyleSet {
  regular;

  const InstructionsPhotoStyleSet();

  FaceDetectorStyles get specs {
    return switch (this) {
      regular => InstructionsPhotoSpecs.regularStyle,
    };
  }
}
