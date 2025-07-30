import 'package:flutter/material.dart';
import 'package:rarUI/rarui.dart';

class RSetLimitTemplate extends StatefulWidget {
  final String title;
  final String primaryButtonTitle;
  final String secondaryButtonTitle;
  final void Function()? onPrimaryButtonPressed;
  final void Function()? onSecondaryButtonPressed;
  final double currentValue;
  final double startValue;
  final double endValue;

  const RSetLimitTemplate({
    super.key,
    required this.title,
    required this.primaryButtonTitle,
    required this.secondaryButtonTitle,
    this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
    required this.currentValue,
    required this.startValue,
    required this.endValue,
  });

  @override
  State<RSetLimitTemplate> createState() => _RSetLimitTemplateState();
}

class _RSetLimitTemplateState extends State<RSetLimitTemplate> {
  late double _currentValue;

  @override
  void initState() {
    _currentValue = widget.currentValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RLabel(
              text: widget.title,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20.0),
            RLabel(
                text: _currentValue.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                )),
            const SizedBox(height: 20.0),
            RSlider(
              value: widget.startValue,
              min: widget.startValue,
              max: widget.endValue,
              onChanged: (value) => setState(() => _currentValue = value),
              showSubtitle: true,
            ),
          ],
        ),
        Column(
          children: [
            RTextButton(
              expanded: true,
              text: widget.primaryButtonTitle,
              onPressed: widget.onPrimaryButtonPressed,
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(height: 16.0),
            RTextButton(
              expanded: true,
              text: widget.secondaryButtonTitle,
              onPressed: widget.onSecondaryButtonPressed,
              backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
            ),
          ],
        ),
      ],
    );
  }
}
