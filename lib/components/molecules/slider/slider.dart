import '../../atoms/label/label_specs.dart';
import 'slider_specs.dart';

class QSlider extends SliderSpecs {
  /// Style configuration for [QSlider]
  final SliderSet style;

  QSlider({
    super.key,
    required this.style,
    required super.labelStyle,
    required super.behaviour,
    super.minValue,
    super.coinType,
    required super.currentValue,
    required super.maxValue,
    required super.onChanged,
    super.divisions,
  }) : super(styles: style.build());

  QSlider.money({
    super.key,
    required super.behaviour,
    super.minValue,
    super.coinType,
    required super.currentValue,
    required super.maxValue,
    required super.onChanged,
    super.divisions,
  })  : style = SliderSet.primary,
        super(
          styles: SliderSet.primary.build(),
          labelStyle: LabelStyleSet.captionRoboto12Gray5Regular,
        );
}
