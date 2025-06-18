import 'radio_button_specs.dart';
import 'radio_button_style.dart';

enum RadioButtonSet {
  standard(RadioButtonSpecs.standardStyle),
  withoutDividerStyle(RadioButtonSpecs.withoutDividerStyle);

  final QRadioButtonStyles Function() build;

  const RadioButtonSet(this.build);
}
