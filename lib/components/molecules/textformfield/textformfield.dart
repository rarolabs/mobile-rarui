import '../../../theme/theme_data.dart';
import 'textformfield_specs.dart';
import 'textformfield_style_set.dart';

class QTextformfield extends TextformfieldSpecs {
  final TextformfieldStyleSet style;

  const QTextformfield({
    super.key,
    required super.controller,
    super.label,
    required super.behaviour,
    required this.style,
    super.fieldState,
    super.hint,
    super.onChanged,
    super.onFieldSubmitted,
    super.onEditingComplete,
    super.onPrefixIconPressed,
    super.onSuffixIconPressed,
    super.validator,
    super.inputFormatters,
    super.focusNode,
    super.keyboardType,
    super.readOnly,
    super.textCapitalization,
  }) : super(styles: style);

  /// Textformfield apenas para texto
  /// Contem apenas icones de estado, sem icones de prefixo e sufixo
  const QTextformfield.standard({
    super.key,
    super.controller,
    required super.behaviour,
    super.fieldState,
    super.hint,
    super.label,
    super.onChanged,
    super.onFieldSubmitted,
    super.onEditingComplete,
    super.validator,
    super.initialValue,
    super.inputFormatters,
    super.focusNode,
    super.maxLength,
    super.helperText,
    super.errorText,
    super.keyboardType,
    super.hasHelperIcon,
    super.onHelperIconPressed,
    super.tooltipMessage,
    super.scrollPadding,
    super.readOnly,
    super.onTap,
    super.textCapitalization,
  })  : style = TextformfieldStyleSet.standard,
        super(
          styles: TextformfieldStyleSet.standard,
        );

  /// Textformfield apenas para senha
  /// Contem icones de estado e icone de sufixo para controle de visibilidade da senha
  const QTextformfield.password({
    super.key,
    super.controller,
    required super.behaviour,
    super.fieldState,
    super.hint,
    super.label,
    super.onChanged,
    super.onFieldSubmitted,
    super.onEditingComplete,
    super.onPrefixIconPressed,
    super.onSuffixIconPressed,
    super.validator,
    super.initialValue,
    super.inputFormatters,
    super.focusNode,
    super.maxLength,
    super.helperText,
    super.errorText,
    super.keyboardType,
    super.scrollPadding,
    super.readOnly,
    super.onTap,
    super.textCapitalization,
  })  : style = TextformfieldStyleSet.password,
        super(
          styles: TextformfieldStyleSet.password,
          isPassword: true,
          hasSuffixIcon: true,
        );

  /// Textformfield pesquisa
  /// Contem icone de pesquisa sem ação no prefixo
  QTextformfield.search({
    super.key,
    required super.controller,
    required super.behaviour,
    super.fieldState,
    super.hint,
    super.label,
    super.onChanged,
    super.onFieldSubmitted,
    super.onEditingComplete,
    super.inputFormatters,
    super.focusNode,
    super.maxLength,
    super.helperText,
    super.errorText,
    super.keyboardType,
    super.scrollPadding,
    super.readOnly,
    super.onTap,
    super.textCapitalization,
  })  : style = TextformfieldStyleSet.search,
        super(
          styles: TextformfieldStyleSet.search,
          hasPrefixIcon: true,
          prefixIconSvgPath: QTheme.svgs.search,
        );

  /// Textformfield dropdown
  /// Contem no sufixo com um onPress
  const QTextformfield.sufixIcon({
    super.key,
    required super.controller,
    required super.behaviour,
    required super.fieldState,
    required super.onSuffixIconPressed,
    required super.suffixIconSvgPath,
    super.validator,
    super.hint,
    super.label,
    super.onChanged,
    super.onFieldSubmitted,
    super.onEditingComplete,
    super.inputFormatters,
    super.focusNode,
    super.maxLength,
    super.helperText,
    super.errorText,
    super.keyboardType,
    super.scrollPadding,
    super.readOnly,
  })  : style = TextformfieldStyleSet.suffixIcon,
        super(
          styles: TextformfieldStyleSet.suffixIcon,
          hasSuffixIcon: true,
        );
}
