import 'package:flutter/material.dart';

class RDropdownButton<T> extends StatefulWidget {
  const RDropdownButton({
    super.key,
    required this.items,
    required this.onChanged,
    this.selectedItemBuilder,
    this.value,
    this.hint,
    this.disabledHint,
    this.onTap,
    this.elevation = 8,
    this.style,
    this.underline,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.iconSize = 24.0,
    this.isDense = false,
    this.isExpanded = false,
    this.itemHeight = kMinInteractiveDimension,
    this.menuWidth,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
    this.dropdownColor,
    this.menuMaxHeight,
    this.enableFeedback,
    this.alignment = AlignmentDirectional.centerStart,
    this.borderRadius,
    this.padding,
  });

  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final T? value;
  final Widget? hint;
  final Widget? disabledHint;
  final void Function()? onTap;
  final int elevation;
  final TextStyle? style;
  final Widget? underline;
  final Widget? icon;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double iconSize;
  final bool isDense;
  final bool isExpanded;
  final double? itemHeight;
  final double? menuWidth;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? dropdownColor;
  final double? menuMaxHeight;
  final bool? enableFeedback;
  final AlignmentGeometry alignment;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  State<RDropdownButton<T>> createState() => _RDropdownButtonState<T>();
}

class _RDropdownButtonState<T> extends State<RDropdownButton<T>> {
  late T? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  bool get _isDisabled => widget.onChanged == null;

  _updateState(T? value) {
    setState(() {
      _value = value;
    });
  }

  _onChanged(T? value) {
    _updateState(value);
    widget.onChanged!(value);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      items: widget.items,
      onChanged: !_isDisabled ? _onChanged : null,
      selectedItemBuilder: widget.selectedItemBuilder,
      value: _value,
      hint: widget.hint,
      disabledHint: widget.disabledHint,
      onTap: widget.onTap,
      elevation: widget.elevation,
      style: widget.style,
      underline: widget.underline,
      icon: widget.icon,
      iconDisabledColor: widget.iconDisabledColor,
      iconEnabledColor: widget.iconEnabledColor,
      iconSize: widget.iconSize,
      isDense: widget.isDense,
      isExpanded: widget.isExpanded,
      itemHeight: widget.itemHeight,
      menuWidth: widget.menuWidth,
      focusColor: widget.focusColor,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      dropdownColor: widget.dropdownColor,
      menuMaxHeight: widget.menuMaxHeight,
      enableFeedback: widget.enableFeedback,
      alignment: widget.alignment,
      borderRadius: widget.borderRadius,
      padding: widget.padding,
    );
  }
}
