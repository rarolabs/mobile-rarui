import 'package:flutter/material.dart';

import '../../../shared_widget/loading_widget.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../../atoms/label/label.dart';
import '../../atoms/label/label_specs.dart';
import 'dropdownformfield_style.dart';
import 'dropdownformfield_style_set.dart';

class DropdownformfieldComponent<T> extends StatelessWidget
    with Component<QDropdownformfieldStyle, QDropdownformfieldSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Estilo do componente
  final DropdownformfieldStyleSet styles;

  /// Lista de itens do componente
  final List<T> items;

  /// Define o valor inicial do componente
  final T? initialValue;

  /// Label do componente
  final String? label;

  /// Hint do componente
  final String? hint;

  /// Define o texto de ajuda do componente
  final String? helperText;

  /// Define o texto de erro do componente
  final String? errorText;

  /// Define a função que será chamada quando o valor do componente mudar
  final void Function(dynamic value)? onChanged;

  /// Define a função que será chamada para validar o valor do componente
  final String? Function(String? value)? validator;

  /// Define a função que será chamada ao clicar no dropwdown desabilitado
  final VoidCallback? onTap;

  /// Define o node de foco do componente
  final FocusNode? focusNode;

  const DropdownformfieldComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.items,
    this.onChanged,
    this.label,
    this.hint,
    this.initialValue,
    this.helperText,
    this.errorText,
    this.validator,
    this.focusNode,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<QDropdownformfieldStyle, QDropdownformfieldSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    QDropdownformfieldStyle style,
    QDropdownformfieldSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      LoadingWidget(style: otherStyle.loadingStyle);

  @override
  Widget whenDisabled(
    QDropdownformfieldStyle style,
    QDropdownformfieldSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _Dropdownformfield<T>(
        style: style,
        behaviour: behaviour,
        items: items,
        label: label,
        hint: hint,
        onChanged: (v) {},
        initialValue: initialValue,
        helperText: helperText,
        errorText: errorText,
        validator: validator,
        focusNode: focusNode,
        onTap: onTap,
      );

  @override
  Widget whenRegular(
    QDropdownformfieldStyle style,
    QDropdownformfieldSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _Dropdownformfield<T>(
        style: style,
        behaviour: behaviour,
        items: items,
        label: label,
        validator: validator,
        hint: hint,
        helperText: helperText,
        errorText: errorText,
        onChanged: onChanged,
        focusNode: focusNode,
        initialValue: initialValue,
        onTap: onTap,
      );

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.processing: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
        Behaviour.error: Behaviour.regular,
      };
}

class _Dropdownformfield<T> extends StatefulWidget {
  final Behaviour behaviour;
  final QDropdownformfieldStyle style;
  final List<T> items;
  final T? initialValue;
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final void Function(dynamic value)? onChanged;
  final String? Function(String? value)? validator;
  final FocusNode? focusNode;
  final VoidCallback? onTap;

  const _Dropdownformfield({
    required this.behaviour,
    required this.style,
    required this.items,
    required this.onChanged,
    required this.label,
    required this.hint,
    required this.initialValue,
    required this.helperText,
    required this.errorText,
    required this.validator,
    required this.focusNode,
    required this.onTap,
  });

  @override
  State<_Dropdownformfield> createState() => _DropdownformfieldState();
}

class _DropdownformfieldState<T> extends State<_Dropdownformfield> {
  /// Variavel que controla se o componente entrou no estado de erro pelo validator
  final ValueNotifier<bool> _hasError = ValueNotifier(false);

  /// Ouve as mudanças no estado e sinaliza se existe algum erro
  void updateErrorState(bool hasErrorValue) {
    if (_hasError.value != hasErrorValue) _hasError.value = hasErrorValue;
  }

  /// Retorna o border do componente de acordo com o estado
  InputBorder? get _getBorderByState {
    if (_hasError.value) return widget.style.errorBorder;
    return widget.style.enabledBorder;
  }

  /// Retorna o estilo do label de acordo com o estado
  LabelStyleSet get _getLabelStyle {
    if (_hasError.value) {
      return widget.style.labelErrorStyle;
    }
    return widget.style.labelStyle;
  }

  /// Retorna o estilo do helper de acordo com o estado
  TextStyle? get _getHelperStyle {
    if (_hasError.value) return widget.style.helperErrorStyle;
    return widget.style.helperRegularStyle;
  }

  /// Disposes the error notifier
  @override
  void dispose() {
    _hasError.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.label,
      hint: widget.hint,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AbsorbPointer(
          absorbing: widget.onTap != null,
          child: ValueListenableBuilder<bool>(
            valueListenable: _hasError,
            builder: (context, hasError, __) => DropdownButtonFormField<T>(
              items: widget.items
                  .map(
                    (e) => DropdownMenuItem<T>(
                      value: e as T,
                      child: Text(
                        e.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                  .toList(),
              icon: Icon(Icons.keyboard_arrow_down_rounded, color: _getBorderByState?.borderSide.color),
              focusNode: widget.focusNode,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              hint: Text(widget.hint ?? '', style: widget.style.hintStyle),
              onChanged: widget.behaviour.isDisabled
                  ? null
                  : (value) {
                      widget.onChanged?.call(value);
                      if (widget.validator != null) {
                        final error = widget.validator!(value.toString());
                        updateErrorState(error != null);
                      }
                    },
              validator: (value) {
                final error = widget.validator?.call(value.toString());
                updateErrorState(error != null);
                return error;
              },
              isExpanded: true,
              style: widget.style.textStyle,
              value: widget.initialValue as T?,
              focusColor: QTheme.colors.transparent,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                enabled: widget.behaviour.isRegular || widget.behaviour.isError,
                errorStyle: widget.style.errorStyle,
                helperText: widget.helperText,
                helperStyle: _getHelperStyle,
                errorText: widget.errorText,
                focusedErrorBorder: widget.style.focusedErrorBorder,
                enabledBorder: _getBorderByState,
                focusedBorder: widget.style.focusedBorder,
                errorBorder: widget.style.errorBorder,
                disabledBorder: widget.style.disabledBorder,
                border: widget.style.enabledBorder,
                errorMaxLines: 2,
                label: Container(
                  padding: widget.style.labelPadding,
                  decoration: BoxDecoration(
                    color: widget.style.borderColorLabel,
                    borderRadius: BorderRadius.circular(QSizes.x4),
                  ),
                  child: QLabel(style: _getLabelStyle, behaviour: widget.behaviour, text: widget.label),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
