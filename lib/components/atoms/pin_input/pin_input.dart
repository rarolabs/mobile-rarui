import 'pin_input_specs.dart';

class QPinInput extends PinInputSpecs {
  /// Style configuration for [QPinInput]
  final PinInputStyleSet style;

  const QPinInput({
    super.key,
    required this.style,
    required super.behaviour,
    super.length = 6,
    super.onCompleted,
    super.autofocus = false,
    super.obscureText = true,
    super.textSemantics,
    super.hintSemantics,
    super.textEditingController,
  }) : super(styles: style);

  const QPinInput.standard({
    super.key,
    required super.behaviour,
    super.length = 6,
    super.onCompleted,
    super.autofocus = false,
    super.obscureText = true,
    super.textSemantics,
    super.hintSemantics,
    super.textEditingController,
  })  : style = PinInputStyleSet.h2Lato32Bold,
        super(styles: PinInputStyleSet.h2Lato32Bold);
}
