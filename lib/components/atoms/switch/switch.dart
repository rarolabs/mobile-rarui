import 'package:flutter/material.dart';

class RSwitch extends StatefulWidget {
  const RSwitch({
    super.key,
    required this.initialValue,
    required this.onChanged,
    this.activeThumbIcon,
    this.inactiveThumbIcon,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.text,
  });
  final bool initialValue;
  final Function(bool)? onChanged;
  final IconData? activeThumbIcon;
  final IconData? inactiveThumbIcon;
  final Color? activeColor;
  final Color? activeTrackColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;
  final String? text;

  @override
  State<RSwitch> createState() => _RSwitchState();
}

class _RSwitchState extends State<RSwitch> {
  late bool _value;
  late IconData? _thumbIcon;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
    _thumbIcon = _value ? widget.activeThumbIcon : widget.inactiveThumbIcon;
  }

  bool get _isDisabled => widget.onChanged == null;

  _updateState(bool value) {
    setState(() {
      _value = value;
      _thumbIcon = value ? widget.activeThumbIcon : widget.inactiveThumbIcon;
    });
  }

  _onChanged(bool value) {
    _updateState(value);
    widget.onChanged!(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: _value,
          onChanged: !_isDisabled ? _onChanged : null,
          thumbIcon: thumbIcon,
          activeColor: _getColor(widget.activeColor),
          inactiveThumbColor: _getColor(widget.inactiveThumbColor),
          activeTrackColor: _getColor(widget.activeTrackColor),
          inactiveTrackColor: _getColor(widget.inactiveTrackColor),
        ),
        if (widget.text != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              widget.text!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 14),
            ),
          ),
      ],
    );
  }

  Color? _getColor(Color? customColor) {
    return !_isDisabled ? customColor : null;
  }

  WidgetStatePropertyAll<Icon?> get thumbIcon =>
      WidgetStatePropertyAll(Icon(_thumbIcon));
}
