part of 'slider_specs.dart';

enum SliderSet {
  primary(SliderSpecs.primaryStyle);

  final SliderStyles Function() build;

  const SliderSet(this.build);
}
