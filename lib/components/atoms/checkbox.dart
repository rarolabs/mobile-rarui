import 'package:flutter/material.dart';

class RCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool?>? onChanged;
  final OutlinedBorder? shape;
  final VisualDensity? visualDensity;
  final Color? checkColor;
  final Color? activeColor;
  final Color? borderColor;

  const RCheckbox({
    Key? key,
    this.shape,
    this.checkColor,
    this.borderColor,
    this.activeColor,
    this.visualDensity,
    this.onChanged,
    this.initialValue = false,
  }) : super(key: key);

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
    return Checkbox(
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
    );
  }
}
