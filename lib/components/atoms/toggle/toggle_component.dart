// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import '../../../theme/sizes.dart';
import 'toggle_specs.dart';
import 'toggle_style.dart';

class ToggleComponent extends StatelessWidget with Component<ToggleStyle, ToggleSharedStyle> {
  // Comportamento do componente
  final Behaviour behaviour;

  // Valor inicial do switch
  final bool initialValue;

  // Função do onChanged
  final void Function(bool)? onChanged;

  // Estilo do componente
  final ToggleStyleSet styles;

  // Texto de acessibilidade
  final String? labelSemantics;

  // Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  const ToggleComponent({
    super.key,
    required this.behaviour,
    required this.initialValue,
    required this.onChanged,
    required this.styles,
    this.labelSemantics,
    this.hintSemantics,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<ToggleStyle, ToggleSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    ToggleStyle style,
    ToggleSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    ToggleStyle style,
    ToggleSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _CustomToggle(
      behaviour: behaviour,
      value: initialValue,
      style: style,
      sharedStyle: styles.specs.shared,
      onChanged: onChanged,
    );
  }

  @override
  Widget whenDisabled(
    ToggleStyle style,
    ToggleSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _CustomToggle(
      behaviour: behaviour,
      value: initialValue,
      style: style,
      sharedStyle: styles.specs.shared,
      onChanged: onChanged,
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };
}

class _CustomToggle extends StatefulWidget {
  const _CustomToggle({
    required this.behaviour,
    required this.value,
    required this.style,
    required this.sharedStyle,
    this.onChanged,
  });

  final Behaviour behaviour;
  final bool value;
  final Function(bool)? onChanged;
  final ToggleStyle style;
  final ToggleSharedStyle sharedStyle;

  @override
  State<_CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<_CustomToggle> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.value;
  }

  @override
  void didUpdateWidget(covariant _CustomToggle oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _isChecked = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: QSizes.x44,
      height: QSizes.x24,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Switch(
          value: _isChecked,
          onChanged: (widget.onChanged != null && !widget.behaviour.isDisabled)
              ? (value) {
                  widget.onChanged!(value);
                  setState(() => _isChecked = !_isChecked);
                }
              : null,
          activeColor: widget.style.activeColor,
          activeTrackColor: widget.style.activeTrackColor,
        ),
      ),
    );
  }
}
