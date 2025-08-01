import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rarUI/components/molecules/title_subtitle/title_subtitle.dart';
import 'package:rarUI/rarui.dart';
import 'package:rarUI/utils/enums/key_pix_type.dart';

class RRegisterKeyPixTemplate extends StatelessWidget {
  const RRegisterKeyPixTemplate({
    super.key,
    required this.title,
    required this.description,
    required this.textButton,
    required this.formKey,
    required this.keyPix,
    required this.labelTitle,
    this.textHint,
    this.styleTitle,
    this.styleDescription,
    this.spaceBetweenTitleSubtitle = 4.0,
    this.validationText = '',
    this.onPressed,
    this.controller,
    this.validator,
    this.inputFormatters,
    this.listTileIcon,
  });

  final String title;
  final String description;
  final double spaceBetweenTitleSubtitle;
  final KeyPixType keyPix;
  final String labelTitle;
  final String textButton;
  final GlobalKey<dynamic> formKey;

  final TextStyle? styleTitle;
  final TextStyle? styleDescription;

  final String validationText;

  final String? textHint;
  final Widget? listTileIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 30),
            child: SizedBox(
              width: double.infinity,
              child: RTitleSubtitle(
                title: title,
                subTitle: description,
                titleStyle: styleTitle,
                subTitleStyle: styleDescription,
                spaceBetween: spaceBetweenTitleSubtitle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: keyPix == KeyPixType.random
                ? RListTile(
                    leading: listTileIcon,
                    title: RLabel(text: labelTitle),
                  )
                : RTextFormField(
                    controller: controller,
                    validator: validator ??
                        (value) {
                          if (!keyPix.validator(value)) {
                            return validationText;
                          }
                          return null;
                        },
                    autofocus: true,
                    inputFormatters: inputFormatters ?? keyPix.inputFormatter,
                    decoration: InputDecoration(
                      hint: RLabel(text: textHint ?? ''),
                      label: RLabel(
                        text: labelTitle,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 40),
            child: SizedBox(
              height: 70,
              width: double.infinity,
              child: RElevatedButton(text: textButton, onPressed: onPressed),
            ),
          ),
        ],
      ),
    );
  }
}
