import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/label/label.dart';
import 'checkbox_specs.dart';
import 'checkbox_style.dart';

class CheckboxComponent extends StatelessWidget with Component<CheckboxStyle, CheckboxSharedStyle> {
  /// Comportamento do componente
  final Behaviour behaviour;

  /// Estilo do componente
  final CheckboxStyleSet styles;

  /// Título que será mostrado ao lado do Checkbox
  final String title;

  /// Estado do Checkbox
  final bool isChecked;

  /// Callback do Checkbox
  final void Function(bool)? onChanged;

  /// Texto de acessibilidade
  final String? labelSemantics;

  /// Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  const CheckboxComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.title,
    this.isChecked = false,
    this.onChanged,
    this.labelSemantics,
    this.hintSemantics,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<CheckboxStyle, CheckboxSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    CheckboxStyle style,
    CheckboxSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    CheckboxStyle style,
    CheckboxSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _CustomCheckbox(
      onChanged: onChanged,
      title: title,
      isChecked: isChecked,
      style: style,
      sharedStyle: styles.specs.shared,
      behaviour: behaviour,
    );
  }

  @override
  Widget whenDisabled(
    CheckboxStyle style,
    CheckboxSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _CustomCheckbox(
      onChanged: onChanged,
      title: title,
      isChecked: isChecked,
      style: style,
      sharedStyle: styles.specs.shared,
      behaviour: behaviour,
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.disabled,
      };
}

class _CustomCheckbox extends StatefulWidget {
  final ValueChanged<bool>? onChanged;
  final CheckboxStyle style;
  final CheckboxSharedStyle sharedStyle;
  final Behaviour behaviour;
  final String title;
  final bool isChecked;

  const _CustomCheckbox({
    required this.style,
    required this.sharedStyle,
    required this.behaviour,
    required this.title,
    required this.isChecked,
    this.onChanged,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<_CustomCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  void didUpdateWidget(covariant _CustomCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isChecked != widget.isChecked) {
      setState(() => _isChecked = widget.isChecked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: QTheme.colors.transparent,
      highlightColor: QTheme.colors.transparent,
      key: const Key('check'),
      onTap: widget.behaviour.isRegular || widget.behaviour.isError
          ? () {
              setState(() => _isChecked = !_isChecked);
              if (widget.onChanged != null) widget.onChanged!(_isChecked);
            }
          : null,
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            height: QSizes.x20,
            width: QSizes.x20,
            decoration: BoxDecoration(
              border: Border.all(
                color: _isChecked ? widget.style.selectedColor : widget.style.unselectedColor,
                width: 1,
              ),
              color: _isChecked ? widget.style.selectedColor : widget.style.borderColor,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Center(
              child: AnimatedSwitcher(
                duration: Durations.medium1,
                transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
                child: _isChecked
                    ? Icon(
                        Icons.check,
                        size: QSizes.x16,
                        color: widget.style.iconColor,
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ),
          const SizedBox(width: QSizes.x8),
          Flexible(
            child: QLabel(
              style: widget.sharedStyle.labelStyle,
              behaviour: widget.behaviour.isError ? Behaviour.regular : widget.behaviour,
              text: widget.title,
            ),
          ),
        ],
      ),
    );
  }
}
