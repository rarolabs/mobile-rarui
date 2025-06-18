import 'text_icon_specs.dart';
import 'text_icon_style.dart';

enum TextIconStyleSet {
  standard,
  body16IconCiano,
  body16IconSecondary,
  body14,
  body14BoldSecondary;

  const TextIconStyleSet();

  TextIconStyles get specs => switch (this) {
        standard => TextIconSpecs.standardStyle,
        body16IconCiano => TextIconSpecs.cianoStyle,
        body16IconSecondary => TextIconSpecs.secondaryStyle,
        body14 => TextIconSpecs.body14Style,
        body14BoldSecondary => TextIconSpecs.body14NegritoSecondaryStyle,
      };
}
