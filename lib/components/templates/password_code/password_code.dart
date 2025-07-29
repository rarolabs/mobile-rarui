import 'package:flutter/material.dart';
import 'package:rarUI/rarui.dart';

class RPasswordCode extends StatefulWidget {
  const RPasswordCode({
    super.key,
    required this.header,
    this.obscureText = false,
    this.length = 6,
    required this.onComplete,
    this.onSaved,
    this.validator,
  });

  final String header;
  final bool obscureText;
  final int length;
  final ValueChanged<String> onComplete;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;

  @override
  State<RPasswordCode> createState() => _PasswordCodeState();
}

class _PasswordCodeState extends State<RPasswordCode> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 68.0,
        children: [
          RLabel(
            text: widget.header,
            textAlign: TextAlign.center,
            style: textTheme.headlineSmall
                ?.copyWith(fontSize: 20.0, fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: RPinInput(
                formKey: formKey,
                length: widget.length,
                obscureText: widget.obscureText,
                onComplete: widget.onComplete,
                onSaved: widget.onSaved,
                validator: widget.validator,
              ),
            ),
          )
        ],
      ),
    );
  }
}
