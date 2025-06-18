import 'dropdownformfield_specs.dart';
import 'dropdownformfield_style_set.dart';

class QDropdownformfield<T> extends DropdownformfieldSpecs<T> {
  final DropdownformfieldStyleSet style;

  const QDropdownformfield({
    super.key,
    super.label,
    required this.style,
    required super.behaviour,
    required super.items,
    super.onChanged,
    super.hint,
    super.validator,
    super.focusNode,
    super.onTap,
  }) : super(styles: style);

  /// Dropdownformfield apenas para texto
  /// Contem apenas icones de estado, sem icones de prefixo e sufixo
  const QDropdownformfield.standard({
    super.key,
    required super.behaviour,
    required super.items,
    super.onChanged,
    super.hint,
    super.label,
    super.validator,
    super.initialValue,
    super.focusNode,
    super.helperText,
    super.errorText,
    super.onTap,
  })  : style = DropdownformfieldStyleSet.standard,
        super(styles: DropdownformfieldStyleSet.standard);
}
