import 'package:flutter/material.dart';

class RSlider extends StatefulWidget {
  const RSlider({
    Key? key,
    required this.value,
    this.secondaryTrackValue,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.label,
    this.showSubtitle = false,
    this.activeColor,
    this.inactiveColor,
    this.secondaryActiveColor,
    this.thumbColor,
    this.focusNode,
    this.allowedInteraction,
  }) : super(key: key);

  final double value;
  final double? secondaryTrackValue;
  final void Function(double)? onChanged;
  final void Function(double)? onChangeStart;
  final void Function(double)? onChangeEnd;
  final double min;
  final double max;
  final int? divisions;
  final String? label;
  final bool showSubtitle;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? secondaryActiveColor;
  final Color? thumbColor;
  final FocusNode? focusNode;
  final SliderInteraction? allowedInteraction;

  @override
  State<RSlider> createState() => _RSliderState();
}

class _RSliderState extends State<RSlider> {
  late double _value;
  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  bool get _isDisabled => widget.onChanged == null;

  _updateState(double value) {
    setState(() {
      _value = value;
    });
  }

  _onChanged(double value) {
    _updateState(value);
    widget.onChanged!(value);
  }

  @override
  Widget build(BuildContext context) {
    final sliderTheme = SliderTheme.of(context);
    return SliderTheme(
      data: sliderTheme.copyWith(
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      ),
      child: Column(
        children: [
          Slider(
            value: _value,
            secondaryTrackValue: widget.secondaryTrackValue,
            onChanged: !_isDisabled ? _onChanged : null,
            onChangeStart: widget.onChangeStart,
            onChangeEnd: widget.onChangeEnd,
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            label: widget.label,
            activeColor: widget.activeColor,
            inactiveColor: widget.inactiveColor,
            secondaryActiveColor: widget.secondaryActiveColor,
            thumbColor: widget.thumbColor,
            focusNode: widget.focusNode,
            allowedInteraction: widget.allowedInteraction,
          ),
          Visibility(
            visible: widget.showSubtitle,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${widget.min}"),
                  Text("${widget.max}"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
