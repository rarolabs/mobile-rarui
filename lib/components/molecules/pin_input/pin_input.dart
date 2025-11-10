import 'package:flutter/material.dart';
import 'package:rarui/components/atoms/text_field/text_form_field.dart';

class RPinInput extends StatefulWidget {
  const RPinInput({
    Key? key,
    required this.formKey,
    required this.onComplete,
    this.onChanged,
    this.onSaved,
    this.obscureText = true,
    this.length = 6,
    this.validator,
    this.useCustomKeyboard = false,
    this.activeBorderColor,
    this.defaultBorderColor,
    this.backgroundColor,
    this.borderWidth = 1.0,
    this.heightFormField = 74.0,
    this.widthFormField = 48.0,
    this.spacing = 8.0,
    this.textStyle,
    this.autofocus = false,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final bool obscureText;
  final int length;
  final ValueChanged<String> onComplete;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final bool useCustomKeyboard;
  final Color? activeBorderColor;
  final Color? defaultBorderColor;
  final Color? backgroundColor;
  final double borderWidth;
  final double heightFormField;
  final double widthFormField;
  final double spacing;
  final TextStyle? textStyle;
  final bool autofocus;

  @override
  State<RPinInput> createState() => RPinInputState();
}

class RPinInputState extends State<RPinInput> {
  late final List<TextEditingController> controllers;
  late final List<FocusNode> focusNodes;
  late final List<VoidCallback> _focusListeners;

  bool allFilled = false;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(widget.length, (_) => TextEditingController());
    focusNodes = List.generate(widget.length, (_) => FocusNode());
    _focusListeners = List.generate(widget.length, (i) {
      final listener = () {
        if (mounted) setState(() {});
      };
      focusNodes[i].addListener(listener);
      return listener;
    });
  }

  @override
  void dispose() {
    for (int i = 0; i < _focusListeners.length; i++) {
      focusNodes[i].removeListener(_focusListeners[i]);
    }
    for (final c in controllers) c.dispose();
    for (final f in focusNodes) f.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeColor = widget.activeBorderColor ?? Colors.green;
    final defaultColor = widget.defaultBorderColor ?? Colors.grey;

    return Form(
      key: widget.formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: widget.spacing,
        children: List.generate(widget.length, (index) {
          final isFocused = focusNodes[index].hasFocus;
          final borderColor = allFilled
              ? activeColor
              : (isFocused ? activeColor : defaultColor);

          return SizedBox(
            width: widget.widthFormField,
            height: widget.heightFormField,
            child: Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: borderColor, width: widget.borderWidth),
                borderRadius: BorderRadius.circular(8),
                color: widget.backgroundColor ?? Colors.transparent,
              ),
              child: AbsorbPointer(
                absorbing: widget.useCustomKeyboard,
                child: Center(
                  child: RTextFormField(
                    key: Key('pin_input_$index'),
                    controller: controllers[index],
                    autofocus: widget.autofocus && index == 0,
                    focusNode: focusNodes[index],
                    readOnly: widget.useCustomKeyboard,
                    obscureText: widget.obscureText,
                    textAlign: TextAlign.center,
                    style: widget.textStyle,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    keyboardType: TextInputType.number,
                    validator: widget.validator,
                    onSaved: widget.onSaved,
                    onChanged: (value) => _onChanged(value, index),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void _onChanged(String value, int index) {
    if (value.length > 1) {
      final paste = value;
      for (int i = 0; i < paste.length; i++) {
        final pos = index + i;
        if (pos >= controllers.length) break;
        controllers[pos].text = paste[i];
      }
      for (int i = 0; i < controllers.length; i++) {
        if (controllers[i].text.isEmpty) {
          focusNodes[i].requestFocus();
          break;
        }
      }
    } else {
      if (value.isNotEmpty && index < controllers.length - 1) {
        focusNodes[index + 1].requestFocus();
      } else if (value.isEmpty && index > 0) {
        focusNodes[index - 1].requestFocus();
      }
    }

    allFilled = controllers.every((c) => c.text.isNotEmpty);

    final inputValue = controllers.map((c) => c.text).join();

    if (widget.onChanged != null) {
      widget.onChanged!(inputValue);
    }

    if (allFilled) {
      FocusScope.of(context).unfocus();
      widget.onComplete(inputValue);
    }

    if (mounted) setState(() {});
  }

  void addDigit(String digit) {
    if (digit.isEmpty || digit.length != 1) return;
    for (int i = 0; i < controllers.length; i++) {
      if (controllers[i].text.isEmpty) {
        controllers[i].text = digit;
        if (i < controllers.length - 1) {
          focusNodes[i + 1].requestFocus();
        } else {
          allFilled = controllers.every((c) => c.text.isNotEmpty);
          if (allFilled) {
            final full = controllers.map((c) => c.text).join();
            FocusScope.of(context).unfocus();
            widget.onComplete(full);
          }
        }
        if (mounted) setState(() {});
        break;
      }
    }
  }

  void backspace() {
    for (int i = controllers.length - 1; i >= 0; i--) {
      if (controllers[i].text.isNotEmpty) {
        controllers[i].clear();
        focusNodes[i].requestFocus();
        break;
      }
    }
    allFilled = controllers.every((c) => c.text.isNotEmpty);
    if (mounted) setState(() {});
  }
}
