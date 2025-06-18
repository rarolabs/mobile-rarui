import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../shared_widget/loading_widget.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../../atoms/icon/icon.dart';
import '../../atoms/label/label.dart';
import '../../atoms/label/label_specs.dart';
import 'textformfield_style.dart';
import 'textformfield_style_set.dart';
import 'widgets/textformfield_get_sufix_icon_widget.dart';

class TextformfieldComponent extends StatelessWidget with Component<QTextformfieldStyle, QTextformfieldSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Estilo do componente
  final TextformfieldStyleSet styles;

  /// Controller do componente
  final TextEditingController? controller;

  /// Label do componente
  final String? label;

  /// Hint do componente
  final String? hint;

  /// Define o numero maximo de caracteres que o componente pode ter
  final int? maxLength;

  /// Define o valor inicial do componente
  final String? initialValue;

  /// Define o texto de ajuda do componente
  final String? helperText;

  /// Define o texto de erro do componente
  final String? errorText;

  /// Define a função que será chamada quando o valor do componente mudar
  final void Function(String value)? onChanged;

  /// Define a função que será chamada quando o icone de sufixo do componente for pressionado
  final void Function()? onSuffixIconPressed;

  /// Define a função que será chamada quando o icone de prefixo do componente for pressionado
  final void Function()? onPrefixIconPressed;

  /// Define a função que será chamada para validar o valor do componente
  final String? Function(String? value)? validator;

  /// Define os formatadores de entrada do componente
  final List<TextInputFormatter>? inputFormatters;

  /// Define a função que será chamada quando o componente for submetido
  final void Function(String)? onFieldSubmitted;

  /// Define a função que será chamada quando fecha o teclado virtual
  final void Function()? onEditingComplete;

  /// Define o node de foco do componente
  final FocusNode? focusNode;

  /// Define o tipo de teclado do componente
  final TextInputType? keyboardType;

  /// Define o comportamento do componente de acordo com o estado
  final TextFieldStates fieldState;

  /// Define a função que será chamada quando o icone de ajuda do componente for pressionado
  final VoidCallback? onHelperIconPressed;

  /// Define se o componente tem o icone de ajuda
  final bool? hasHelperIcon;

  /// Define a mensagem de tooltip do icone de ajuda
  final String? tooltipMessage;

  /// Define se o componente é uma senha
  final bool isPassword;

  /// Define se o componente tem o icone de prefixo
  final bool hasPrefixIcon;

  /// Define se o componente tem o icone de sufixo
  final bool hasSuffixIcon;

  /// Define o icone de prefixo
  final String? prefixIconSvgPath;

  /// Define o icone de sufixo
  final String? suffixIconSvgPath;

  /// Define um padding do scroll ao clicar no textfield
  final EdgeInsets? scrollPadding;

  /// Definir se o campo é editável ou não
  final bool readOnly;

  /// Função que será chamada quando o componente for pressionado e o componente estiver em estado de readonly
  final VoidCallback? onTap;

  /// Define o formato do texto que será exibido no componente
  final TextCapitalization? textCapitalization;

  const TextformfieldComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    this.controller,
    this.onChanged,
    this.label,
    this.hint,
    this.maxLength,
    this.initialValue,
    this.helperText,
    this.errorText,
    this.onSuffixIconPressed,
    this.onPrefixIconPressed,
    this.validator,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.focusNode,
    this.keyboardType,
    this.fieldState = TextFieldStates.regular,
    this.onHelperIconPressed,
    this.hasHelperIcon,
    this.tooltipMessage,
    this.isPassword = false,
    this.hasPrefixIcon = false,
    this.hasSuffixIcon = false,
    this.prefixIconSvgPath,
    this.suffixIconSvgPath,
    this.scrollPadding,
    this.onTap,
    this.readOnly = false,
    this.textCapitalization,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<QTextformfieldStyle, QTextformfieldSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    QTextformfieldStyle style,
    QTextformfieldSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      LoadingWidget(style: otherStyle.loadingStyle);

  @override
  Widget whenDisabled(
    QTextformfieldStyle style,
    QTextformfieldSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _BasicTextformfield(
        style: style,
        behaviour: behaviour,
        fieldState: fieldState,
        controller: controller,
        label: label,
        hint: hint,
        tooltipMessage: tooltipMessage,
        isPassword: isPassword,
        hasPrefixIcon: hasPrefixIcon,
        hasSuffixIcon: hasSuffixIcon,
        prefixIconSvgPath: prefixIconSvgPath,
        suffixIconSvgPath: suffixIconSvgPath,
        scrollPadding: scrollPadding,
        onChanged: null,
        onFieldSubmitted: null,
        onEditingComplete: null,
        onHelperIconPressed: null,
        errorText: null,
        helperText: null,
        focusNode: null,
        hasHelperIcon: null,
        initialValue: null,
        inputFormatters: const [],
        keyboardType: null,
        maxLength: null,
        onPrefixIconPressed: null,
        onSuffixIconPressed: null,
        validator: null,
        readOnly: readOnly,
        onTap: onTap,
        textCapitalization: textCapitalization,
      );

  @override
  Widget whenRegular(
    QTextformfieldStyle style,
    QTextformfieldSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _BasicTextformfield(
        style: style,
        behaviour: behaviour,
        fieldState: fieldState,
        controller: controller,
        label: label,
        validator: validator,
        hint: hint,
        maxLength: maxLength,
        initialValue: initialValue,
        helperText: helperText,
        errorText: errorText,
        onChanged: onChanged,
        onPrefixIconPressed: onPrefixIconPressed,
        onSuffixIconPressed: onSuffixIconPressed,
        focusNode: focusNode,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        onHelperIconPressed: onHelperIconPressed,
        hasHelperIcon: hasHelperIcon,
        tooltipMessage: tooltipMessage,
        isPassword: isPassword,
        hasPrefixIcon: hasPrefixIcon,
        hasSuffixIcon: hasSuffixIcon,
        prefixIconSvgPath: prefixIconSvgPath,
        suffixIconSvgPath: suffixIconSvgPath,
        scrollPadding: scrollPadding,
        readOnly: readOnly,
        onTap: onTap,
        textCapitalization: textCapitalization,
      );

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.processing: Behaviour.regular,
        Behaviour.error: Behaviour.regular,
      };
}

class _BasicTextformfield extends StatefulWidget {
  final QTextformfieldStyle style;
  final Behaviour behaviour;
  final TextEditingController? controller;
  final TextFieldStates fieldState;
  final int? maxLength;
  final String? label;
  final String? hint;
  final String? initialValue;
  final String? helperText;
  final String? errorText;
  final String? tooltipMessage;
  final String? prefixIconSvgPath;
  final String? suffixIconSvgPath;
  final VoidCallback? onPrefixIconPressed;
  final VoidCallback? onSuffixIconPressed;
  final VoidCallback? onHelperIconPressed;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool? hasHelperIcon;
  final bool isPassword;
  final bool hasPrefixIcon;
  final bool hasSuffixIcon;
  final EdgeInsets? scrollPadding;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextCapitalization? textCapitalization;

  const _BasicTextformfield({
    required this.behaviour,
    required this.fieldState,
    required this.style,
    required this.controller,
    required this.label,
    required this.onHelperIconPressed,
    required this.validator,
    required this.hint,
    required this.maxLength,
    required this.initialValue,
    required this.helperText,
    required this.errorText,
    required this.onChanged,
    required this.onSuffixIconPressed,
    required this.onPrefixIconPressed,
    required this.inputFormatters,
    required this.onFieldSubmitted,
    required this.onEditingComplete,
    required this.focusNode,
    required this.keyboardType,
    required this.hasHelperIcon,
    required this.tooltipMessage,
    required this.prefixIconSvgPath,
    required this.suffixIconSvgPath,
    required this.isPassword,
    required this.hasPrefixIcon,
    required this.hasSuffixIcon,
    required this.scrollPadding,
    required this.readOnly,
    required this.onTap,
    required this.textCapitalization,
  });

  @override
  State<_BasicTextformfield> createState() => _BasicTextformfieldState();
}

class _BasicTextformfieldState extends State<_BasicTextformfield> {
  /// Variavel que controla se o texto está oculto
  late final ValueNotifier<bool> _obscureText;

  /// Variavel que controla se o componente entrou no estado de erro pelo validator
  late final ValueNotifier<bool> _hasError;

  /// Variavel que controla o estado do componente
  late final ValueNotifier<TextFieldStates> _fieldState;

  @override
  void initState() {
    super.initState();
    _obscureText = ValueNotifier(widget.isPassword);
    _hasError = ValueNotifier(false);
    _fieldState = ValueNotifier(widget.fieldState);
  }

  @override
  void didUpdateWidget(_BasicTextformfield oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.fieldState != widget.fieldState) {
      _fieldState.value = widget.fieldState;
    }
  }

  /// Ouve as mudanças no estado e sinaliza se existe algum erro
  void updateErrorState(bool hasErrorValue) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_hasError.value != hasErrorValue) _hasError.value = hasErrorValue;
    });
  }

  /// Retorna o border do componente de acordo com o estado
  InputBorder? get _getBorderByState {
    if (_hasError.value) return widget.style.errorBorder;
    switch (_fieldState.value) {
      case TextFieldStates.success:
        return widget.style.successBorder;
      case TextFieldStates.warning:
        return widget.style.warningBorder;
      default:
        return widget.style.enabledBorder;
    }
  }

  /// Retorna o estilo do label de acordo com o estado
  LabelStyleSet get _getLabelStyle {
    if (_hasError.value) {
      return widget.style.labelErrorStyle;
    }
    switch (_fieldState.value) {
      case TextFieldStates.success:
        return widget.style.labelSuccessStyle;
      case TextFieldStates.warning:
        return widget.style.labelWarningStyle;
      default:
        return widget.style.labelStyle;
    }
  }

  /// Retorna o estilo do helper de acordo com o estado
  TextStyle? get _getHelperStyle {
    if (_hasError.value) return widget.style.helperErrorStyle;
    switch (_fieldState.value) {
      case TextFieldStates.success:
        return widget.style.helperSuccessStyle;
      case TextFieldStates.warning:
        return widget.style.helperWarningStyle;
      default:
        return widget.style.helperRegularStyle;
    }
  }

  /// Disposes the error notifier
  @override
  void dispose() {
    _fieldState.dispose();
    _obscureText.dispose();
    _hasError.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.label,
      hint: widget.hint,
      child: ListenableBuilder(
        listenable: Listenable.merge([
          _fieldState,
          _obscureText,
          _hasError,
        ]),
        builder: (context, child) => TextFormField(
          onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
          maxLength: widget.maxLength,
          initialValue: widget.initialValue,
          enabled: widget.behaviour != Behaviour.disabled,
          obscureText: _obscureText.value,
          controller: widget.controller,
          cursorColor: widget.style.cursorColor,
          readOnly: widget.readOnly,
          onChanged: (value) {
            widget.onChanged?.call(value);
            if (widget.validator != null) {
              final error = widget.validator!(value);
              updateErrorState(error != null);
            }
          },
          validator: (value) {
            final error = widget.validator?.call(value);
            updateErrorState(error != null);
            return error;
          },
          scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(QSizes.x20),
          inputFormatters: widget.inputFormatters,
          onFieldSubmitted: widget.onFieldSubmitted,
          onEditingComplete: widget.onEditingComplete,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          cursorHeight: QSizes.x16,
          onTap: widget.onTap,
          style: widget.style.textStyle,
          textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Container(
              padding: widget.style.labelPadding,
              decoration: BoxDecoration(
                color: widget.style.borderColorLabel,
                borderRadius: BorderRadius.circular(QSizes.x4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: QSizes.x4,
                children: [
                  QLabel(
                    style: _getLabelStyle,
                    behaviour: widget.behaviour,
                    text: widget.label,
                  ),
                  if (widget.hasHelperIcon ?? false)
                    Tooltip(
                      message: widget.tooltipMessage,
                      triggerMode: TooltipTriggerMode.tap,
                      preferBelow: false,
                      child: QIcon(
                        behaviour: widget.behaviour,
                        svgPath: QTheme.svgs.helper,
                        onPressed: widget.onHelperIconPressed,
                        style: widget.style.helperIconStyle,
                      ),
                    ),
                ],
              ),
            ),
            hintText: widget.hint,
            hintStyle: widget.style.hintStyle,
            errorStyle: widget.style.errorStyle,
            helperText: widget.helperText,
            helperStyle: _getHelperStyle,
            errorText: widget.errorText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(QSizes.x8),
            ),
            focusedErrorBorder: widget.style.focusedErrorBorder,
            enabledBorder: _getBorderByState,
            focusedBorder: widget.style.focusedBorder,
            errorBorder: widget.style.errorBorder,
            disabledBorder: widget.style.disabledBorder,
            errorMaxLines: 2,
            prefixIcon: widget.hasPrefixIcon && (widget.prefixIconSvgPath ?? '').isNotEmpty
                ? QIcon(
                    behaviour: widget.behaviour,
                    svgPath: widget.prefixIconSvgPath ?? '',
                    onPressed: widget.onPrefixIconPressed,
                    style: widget.style.prefixIconStyle,
                  )
                : null,
            suffixIcon: !widget.hasSuffixIcon
                ? null
                : TextformfieldGetSufixIconWidget(
                    behaviour: widget.behaviour,
                    fieldState: _fieldState.value,
                    hasSuffixIcon: widget.hasSuffixIcon,
                    isPassword: widget.isPassword,
                    passwordIconPath: _obscureText.value ? QTheme.svgs.visibility : QTheme.svgs.visibilityHide,
                    suffixIconPath: widget.suffixIconSvgPath ?? '',
                    suffixIconStyle: widget.style.suffixIconStyle,
                    errorIconPath: QTheme.svgs.error,
                    successIconPath: QTheme.svgs.done,
                    warningIconPath: QTheme.svgs.warning,
                    errorIconStyle: widget.style.errorIconStyle,
                    successIconStyle: widget.style.successIconStyle,
                    warningIconStyle: widget.style.warningIconStyle,
                    hasError: _hasError.value,
                    onPressedEnabled:
                        widget.behaviour != Behaviour.disabled && _fieldState.value == TextFieldStates.regular,
                    onPressed: () {
                      if (widget.isPassword) _obscureText.value = !_obscureText.value;

                      widget.onSuffixIconPressed?.call();
                    },
                  ),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }
}

enum TextFieldStates {
  regular,
  success,
  warning,
  disabled;
}
