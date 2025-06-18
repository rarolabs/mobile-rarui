import 'package:auto_size_text_plus/auto_size_text_plus.dart';
import 'package:flutter/material.dart';

import '../../../shared_widget/loading_widget.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import 'text_click.dart';
import 'text_click_style.dart';
import 'text_click_style_set.dart';

class TextClickComponent extends StatelessWidget with Component<TextClickStyle, TextClickSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Estilo do componente
  final TextClickStyleSet styles;

  /// Título do Componente
  final QTextClickSpan text;

  /// Hint de semântica do componente
  final String? hintSemantics;

  /// Label de semântica do componente
  final String? labelSemantics;

  /// Mostrar checkbox selecionado, valor default false
  final bool initialValue;

  /// Mostrar checkbox, valor default true
  final bool showCheckbox;

  /// Função que controla a mudança de estado do checkbox
  final Function(bool)? onCheckboxChange;

  const TextClickComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.text,
    this.hintSemantics,
    this.labelSemantics,
    this.initialValue = false,
    this.showCheckbox = true,
    this.onCheckboxChange,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<TextClickStyle, TextClickSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    TextClickStyle style,
    TextClickSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      LoadingWidget(style: otherStyle.loadingStyle);

  @override
  Widget whenRegular(
    TextClickStyle style,
    TextClickSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _TextClick(
        behaviour: behaviour,
        style: style,
        text: text,
        hintSemantics: hintSemantics,
        labelSemantics: labelSemantics,
        initialValue: initialValue,
        showCheckbox: showCheckbox,
        onCheckboxChange: onCheckboxChange,
      );

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
      };
}

class _TextClick extends StatelessWidget {
  final Behaviour behaviour;
  final TextClickStyle style;
  final QTextClickSpan text;
  final String? hintSemantics;
  final String? labelSemantics;
  final bool initialValue;
  final bool showCheckbox;
  final Function(bool)? onCheckboxChange;

  const _TextClick({
    required this.behaviour,
    required this.style,
    required this.text,
    required this.hintSemantics,
    required this.labelSemantics,
    required this.initialValue,
    required this.showCheckbox,
    required this.onCheckboxChange,
  });

  @override
  Widget build(BuildContext context) {
    bool isChecked = initialValue;
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: AbsorbPointer(
        absorbing: behaviour.isDisabled,
        child: ListTile(
          dense: true,
          horizontalTitleGap: QSizes.x8,
          contentPadding: EdgeInsets.zero,
          leading: !showCheckbox
              ? null
              : SizedBox(
                  width: QSizes.x20,
                  child: StatefulBuilder(
                    builder: (context, setState) => Checkbox(
                      visualDensity: VisualDensity.standard,
                      activeColor: QTheme.colors.secondaryColorBase,
                      value: isChecked,
                      onChanged: behaviour.isDisabled
                          ? null
                          : (value) {
                              setState(() => isChecked = value!);
                              onCheckboxChange?.call(value ?? false);
                            },
                    ),
                  ),
                ),
          title: AutoSizeText.rich(text),
        ),
      ),
    );
  }
}
