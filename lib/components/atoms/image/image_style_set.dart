part of 'image_specs.dart';

enum ImageStyleSet {
  standard;

  const ImageStyleSet();

  LabelStyles get specs {
    return switch (this) {
      standard => ImageSpecs.standardStyle,
    };
  }
}
