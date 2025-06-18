part of 'card_icon_specs.dart';

enum CardIconStyleSet {
  size80x68,
  size100x80,
  size108x88,
  sizeExpansive,
  size80x68Error;

  const CardIconStyleSet();

  CardIconStyles get specs {
    return switch (this) {
      size80x68 => CardIconSpecs.size80x68Style,
      size100x80 => CardIconSpecs.size100x80Style,
      size108x88 => CardIconSpecs.size108x88Style,
      sizeExpansive => CardIconSpecs.sizeExpansiveStyle,
      size80x68Error => CardIconSpecs.size80x68ErrorStyle,
    };
  }
}
