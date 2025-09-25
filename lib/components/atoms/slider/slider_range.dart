import 'package:flutter/material.dart';
import 'package:rarui/rarui.dart';

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
    this.showSubtitle = false,
    this.showInputs = false,
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
  final bool showSubtitle;
  final bool showInputs;
  final Color? activeColor;
  final Color? inactiveColor;

  @override
  State<RSliderRange> createState() => _RSliderRangeState();
}

class _RSliderRangeState extends State<RSliderRange> {
  late RangeValues _values;
  late GlobalKey<FormState> formKey;
  late TextEditingController minRangeController;
  late TextEditingController maxRangeController;

  @override
  void initState() {
    super.initState();
    _values = widget.values;
    formKey = GlobalKey<FormState>();
    minRangeController = TextEditingController(text: _values.start.toString());
    maxRangeController = TextEditingController(text: _values.end.toString());
  }

  bool get _isDisabled => widget.onChanged == null;

  _updateState(RangeValues values) {
    setState(() {
      _values = values;
      minRangeController.text = _values.start.toStringAsFixed(1);
      maxRangeController.text = _values.end.toStringAsFixed(1);
    });
  }

  _onChanged(RangeValues values) {
    _updateState(values);
    widget.onChanged!(values);
  }

  _onChangeEnd(RangeValues values) {
    minRangeController.text = values.start.toStringAsFixed(1);
    maxRangeController.text = values.end.toStringAsFixed(1);
    if (widget.onChangeEnd != null) {
      widget.onChangeEnd!(values);
    }
  }

  @override
  void dispose() {
    minRangeController.dispose();
    maxRangeController.dispose();
    super.dispose();
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
      child: Column(
        children: [
          Visibility(
            visible: widget.showInputs,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.0),
              child: Form(
                key: formKey,
                child: Row(
                  spacing: 16.0,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: RTextFormField(
                        controller: minRangeController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), errorMaxLines: 2),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Não pode ser vazio.";
                          }
                          double? start = double.tryParse(value);
                          if (start == null) {
                            return "Valor inválido.";
                          }
                          if (start < widget.min || start > _values.end) {
                            return "Deve estar entre ${widget.min.toStringAsFixed(1)} e ${_values.end.toStringAsFixed(1)}";
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          if (formKey.currentState!.validate()) {
                            var start = double.parse(value).toStringAsFixed(1);
                            setState(() {
                              _values =
                                  RangeValues(double.parse(start), _values.end);
                            });
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 16.0, child: Divider()),
                    Flexible(
                      child: RTextFormField(
                        controller: maxRangeController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), errorMaxLines: 2),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Não pode ser vazio.";
                          }
                          double? end = double.tryParse(value);
                          if (end == null) {
                            return "Valor inválido";
                          }
                          if (end > widget.max || end < _values.start) {
                            return "Deve estar entre ${_values.start.toStringAsFixed(1)} e ${widget.max.toStringAsFixed(1)}";
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          if (formKey.currentState!.validate()) {
                            var end = double.parse(value).toStringAsFixed(1);
                            setState(() {
                              _values =
                                  RangeValues(_values.start, double.parse(end));
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          RangeSlider(
            values: _values,
            onChanged: !_isDisabled ? _onChanged : null,
            onChangeStart: widget.onChangeStart,
            onChangeEnd: _onChangeEnd,
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            labels: widget.labels,
            activeColor: widget.activeColor,
            inactiveColor: widget.inactiveColor,
          ),
          Visibility(
            visible: widget.showSubtitle,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 24.0),
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
