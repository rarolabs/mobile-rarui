import 'package:flutter/material.dart';
import 'package:rarUI/components/atoms/label/label.dart';

class RCheckbox extends StatefulWidget {
  const RCheckbox({
    Key? key,
    this.shape,
    this.checkColor,
    this.borderColor,
    this.activeColor,
    this.visualDensity,
    this.onChanged,
    this.label,
    this.initialValue = false,
  }) : super(key: key);

  final bool initialValue;
  final Color? checkColor;
  final Color? activeColor;
  final Color? borderColor;
  final OutlinedBorder? shape;
  final VisualDensity? visualDensity;
  final ValueChanged<bool?>? onChanged;
  final String? label;

  @override
  _RCheckboxState createState() => _RCheckboxState();

  _RCheckboxState get state => _RCheckboxState();
}

class _RCheckboxState extends State<RCheckbox> {
  late bool _value = widget.initialValue;

  void _onChanged(bool? value) {
    widget.onChanged?.call(value);
    _value = value ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 8,
      children: [
        Checkbox(
          value: _value,
          shape: widget.shape,
          onChanged: widget.onChanged != null ? _onChanged : null,
          checkColor: widget.onChanged != null ? widget.checkColor : null,
          activeColor: widget.activeColor,
          visualDensity: widget.visualDensity,
          side: BorderSide(
            color: (widget.onChanged == null)
                ? Theme.of(context).unselectedWidgetColor
                : widget.borderColor ??
                    CheckboxTheme.of(context).side?.color ??
                    Theme.of(context).checkboxTheme.side?.color ??
                    Theme.of(context).unselectedWidgetColor,
            width: CheckboxTheme.of(context).side?.width ?? 2.0,
          ),
        ),
        Visibility(
          visible: widget.label != null && widget.label!.isNotEmpty,
          child: Flexible(
            child: RLabel(
              text: widget.label ?? '',
              maxLines: 2,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(),
            ),
          ),
        ),
      ],
    );
  }
}
