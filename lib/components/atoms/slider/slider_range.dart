import 'package:flutter/material.dart';

class RSliderRange extends StatefulWidget {
  const RSliderRange({
    Key? key,
    required this.values,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.labels,
    this.activeColor,
    this.inactiveColor,
  }) : super(key: key);

  final RangeValues values;
  final void Function(RangeValues)? onChanged;
  final void Function(RangeValues)? onChangeStart;
  final void Function(RangeValues)? onChangeEnd;
  final double min;
  final double max;
  final int? divisions;
  final RangeLabels? labels;
  final Color? activeColor;
  final Color? inactiveColor;

  @override
  State<RSliderRange> createState() => _RSliderRangeState();
}

class _RSliderRangeState extends State<RSliderRange> {
  late RangeValues _values;

  @override
  void initState() {
    super.initState();
    _values = widget.values;
  }

  bool get _isDisabled => widget.onChanged == null;

  _updateState(RangeValues values) {
    setState(() {
      _values = values;
    });
  }

  _onChanged(RangeValues values) {
    _updateState(values);
    widget.onChanged!(values);
  }

  @override
  Widget build(BuildContext context) {
    final sliderTheme = SliderTheme.of(context);
    return SliderTheme(
      data: sliderTheme.copyWith(
        rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
        valueIndicatorTextStyle: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: RangeSlider(
        values: _values,
        onChanged: !_isDisabled ? _onChanged : null,
        onChangeStart: widget.onChangeStart,
        onChangeEnd: widget.onChangeEnd,
        min: widget.min,
        max: widget.max,
        divisions: widget.divisions,
        labels: widget.labels,
        activeColor: widget.activeColor,
        inactiveColor: widget.inactiveColor,
      ),
    );
  }
}
