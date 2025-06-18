import 'package:flutter/material.dart';

import '../../../rarui.dart';
import '../../../shared_widget/loading_widget.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import 'radio_button_style.dart';

class RadioButtonComponent extends StatelessWidget with Component<QRadioButtonStyle, QRadioButtonSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Comportamento do radio
  final Behaviour radioBehaviour;

  /// Estilo do componente
  final QRadioButtonStyles styles;

  /// Se o componente vem com alguma opção selecionada
  final int? initialOption;

  /// Função de callback que retorna um indice da lista de opções
  final void Function(int value)? onChanged;

  /// Hint de semântica do componente
  final String? hintSemantics;

  /// Label de semântica do componente
  final String? labelSemantics;

  /// List de opções do componente
  final List<QRadionOptionsModel> options;

  /// Insere ou não um divider no final do componente
  final bool withDivider;

  RadioButtonComponent({
    super.key,
    required this.behaviour,
    this.radioBehaviour = Behaviour.regular,
    required this.styles,
    required this.options,
    required this.onChanged,
    this.initialOption,
    this.hintSemantics,
    this.labelSemantics,
    required this.withDivider,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<QRadioButtonStyle, QRadioButtonSharedStyle>(
      shared: styles.shared,
      regular: styles.regular,
      disabled: styles.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenRegular(
    QRadioButtonStyle style,
    QRadioButtonSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _BasicRadioButton(
      initialOption: initialOption,
      behaviour: behaviour,
      radioBehaviour: radioBehaviour,
      style: style,
      options: options,
      onChanged: onChanged,
      hintSemantics: hintSemantics,
      labelSemantics: labelSemantics,
      withDivider: withDivider,
    );
  }

  @override
  Widget whenDisabled(
    QRadioButtonStyle style,
    QRadioButtonSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _BasicRadioButton(
      initialOption: initialOption,
      behaviour: behaviour,
      radioBehaviour: radioBehaviour,
      style: style,
      options: options,
      onChanged: onChanged,
      hintSemantics: hintSemantics,
      labelSemantics: labelSemantics,
      withDivider: withDivider,
    );
  }

  @override
  Widget whenLoading(
    QRadioButtonStyle style,
    QRadioButtonSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };
}

class _BasicRadioButton extends StatefulWidget {
  final Behaviour behaviour;

  final Behaviour radioBehaviour;

  final QRadioButtonStyle style;

  final List<QRadionOptionsModel> options;

  final void Function(int value)? onChanged;

  final int? initialOption;

  final String? hintSemantics;

  final String? labelSemantics;

  final bool withDivider;

  const _BasicRadioButton({
    required this.behaviour,
    required this.radioBehaviour,
    required this.style,
    required this.onChanged,
    required this.options,
    required this.initialOption,
    required this.hintSemantics,
    required this.labelSemantics,
    required this.withDivider,
  });

  @override
  State<_BasicRadioButton> createState() => _BasicRadioButtonState();
}

class _BasicRadioButtonState extends State<_BasicRadioButton> {
  int? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialOption;
  }

  bool get onTapValid => widget.behaviour.isDisabled || widget.behaviour.isProcessing;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.labelSemantics,
      hint: widget.hintSemantics,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...widget.options.map(
            (option) => InkWell(
              splashColor: QTheme.colors.transparent,
              highlightColor: QTheme.colors.transparent,
              hoverColor: QTheme.colors.transparent,
              onTap: () {
                setState(() => selectedValue = widget.options.indexOf(option));
                Future.delayed(
                  Durations.short4,
                  () => widget.onChanged?.call(widget.options.indexOf(option)),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: QSizes.x24,
                    children: [
                      SizedBox(
                        width: QSizesIcon.x24,
                        child: Transform.scale(
                          scale: 1.4,
                          child: Radio<int>(
                            key: Key('radio-button-key-${widget.options.indexOf(option)}'),
                            value: widget.options.indexOf(option),
                            groupValue: selectedValue,
                            fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                              if (states.contains(WidgetState.selected)) {
                                return widget.radioBehaviour == Behaviour.disabled
                                    ? widget.style.radioDisabledColor
                                    : widget.style.activeColor;
                              }

                              return widget.style.fillColor;
                            }),
                            overlayColor: WidgetStateProperty.all(QTheme.colors.transparent),
                            hoverColor: QTheme.colors.transparent,
                            onChanged: (value) {
                              setState(() => selectedValue = value);
                              Future.delayed(
                                Durations.short4,
                                () => widget.onChanged?.call(value!),
                              );
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            QLabel(
                              text: option.title,
                              style: widget.style.titleStyle,
                              behaviour: widget.behaviour,
                            ),
                            if (option.subtitle != null)
                              QLabel(
                                text: option.subtitle,
                                style: widget.style.subTitleStyle,
                                behaviour: widget.behaviour,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (widget.withDivider) ...[
                    const QDivider.standard(behaviour: Behaviour.regular),
                    const SizedBox(height: QSizes.x4),
                  ],
                ],
              ),
            ),
          ),
          if (!widget.withDivider) const QDivider.standard(behaviour: Behaviour.regular),
        ],
      ),
    );
  }
}
