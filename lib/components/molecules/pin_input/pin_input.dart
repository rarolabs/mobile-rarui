import 'package:flutter/material.dart';
import 'package:rarUI/components/atoms/text_field/text_form_field.dart';

class RPinInput extends StatefulWidget {
  const RPinInput({
    Key? key,
    required this.formKey,
    required this.onComplete,
    this.onSaved,
    this.obscureText = true,
    this.length = 6,
    this.validator,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final bool obscureText;
  final int length;
  final ValueChanged<String> onComplete;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;

  @override
  State<RPinInput> createState() => _RPinInputState();
}

class _RPinInputState extends State<RPinInput> {
  List<TextEditingController> controllers = [];
  List<FocusNode> focusNodes = [];
  String pinValue = '';
  List<Widget> pinFields = [];

  @override
  void initState() {
    buildItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Row(
        spacing: 16.0,
        mainAxisAlignment: MainAxisAlignment.center,
        children: pinFields,
      ),
    );
  }

  void buildItems() {
    controllers =
        List.generate(widget.length, (index) => TextEditingController());
    focusNodes = List.generate(widget.length, (index) => FocusNode());
    pinFields = List.generate(widget.length, (index) {
      return SizedBox(
        width: 48.0,
        child: RTextFormField(
          controller: controllers[index],
          focusNode: focusNodes[index],
          style: TextStyle(
            fontSize: 42.0,
            height: 1,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          keyboardType: TextInputType.number,
          obscureText: widget.obscureText,
          showCursor: false,
          validator: widget.validator,
          onSaved: widget.onSaved,
          onChanged: (value) {
            if (value.length > 1) {
              for (int i = 0; i < value.length; i++) {
                if (index + i >= widget.length) break;
                controllers[index + i].text = value[i];
                pinValue += value[i];
              }
              FocusScope.of(context).unfocus();
              widget.onComplete(pinValue);
            } else if (value.length == 1 && index < widget.length - 1) {
              FocusScope.of(context).nextFocus();
              pinValue += value;
            } else if (value.isEmpty && index > 0) {
              FocusScope.of(context).previousFocus();
              pinValue = pinValue.substring(0, pinValue.length - 1);
            } else if (widget.length == index + 1) {
              pinValue += value;
              FocusScope.of(context).unfocus();
              widget.onComplete(pinValue);
            }
          },
        ),
      );
    });
  }
}
