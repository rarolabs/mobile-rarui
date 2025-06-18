import 'text_click_specs.dart';
import 'text_click_style.dart';

enum TextClickStyleSet {
  standard;

  const TextClickStyleSet();

  TextClickStyles get specs => switch (this) {
        standard => TextClickSpecs.standardStyle,
      };
}
