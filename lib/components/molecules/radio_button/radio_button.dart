import 'radio_button_set.dart';
import 'radio_button_specs.dart';

class QRadioButton extends RadioButtonSpecs {
  final RadioButtonSet style;

  QRadioButton({
    super.key,
    required this.style,
    required super.onChanged,
    required super.behaviour,
    super.radioBehaviour,
    required super.options,
    required super.withDivider,
    super.initialOption,
    super.hintSemantics,
    super.labelSemantics,
  }) : super(
          styles: style.build(),
        );

  QRadioButton.standard({
    super.key,
    required super.onChanged,
    required super.behaviour,
    super.radioBehaviour,
    required super.options,
    super.initialOption,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = RadioButtonSet.standard,
        super(
          styles: RadioButtonSet.standard.build(),
          withDivider: true,
        );

  QRadioButton.withoutDivider({
    super.key,
    required super.onChanged,
    required super.behaviour,
    super.radioBehaviour,
    required super.options,
    super.initialOption,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = RadioButtonSet.withoutDividerStyle,
        super(
          styles: RadioButtonSet.withoutDividerStyle.build(),
          withDivider: false,
        );
}
