import 'package:flutter/material.dart';
import 'package:rarUI/components/atoms/label/label.dart';
import 'package:rarUI/components/molecules/molecules.dart';

class RModal extends StatelessWidget {
  final String title;
  final String description;
  final String titlePrimaryButton;
  final String titleSecondaryButton;
  final Widget? content;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final Color? dragHandleColor;
  final Color? titlePrimaryButtonColor;
  final Color? titleSecondaryButtonColor;
  final Color? primaryBackgroundButtonColor;
  final Color? secondaryBackgroundButtonColor;
  final void Function()? onPrimaryButtonPressed;
  final void Function()? onSecondaryButtonPressed;

  const RModal({
    super.key,
    this.title = "",
    this.description = "",
    this.titlePrimaryButton = "",
    this.titleSecondaryButton = "",
    this.content,
    this.dragHandleColor,
    this.titleStyle,
    this.descriptionStyle,
    this.titlePrimaryButtonColor,
    this.titleSecondaryButtonColor,
    this.primaryBackgroundButtonColor,
    this.secondaryBackgroundButtonColor,
    this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              width: 40.0,
              height: 4.0,
              decoration: BoxDecoration(
                  color: dragHandleColor ?? Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(2)),
            ),
          ),
          if (title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: RLabel(text: title, style: titleStyle),
            ),
          if (description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: RLabel(text: description, style: descriptionStyle),
            ),
          content ?? const SizedBox.shrink(),
          if (content != null) SizedBox(height: 24.0),
          if (titlePrimaryButton.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: RElevatedButton(
                  text: titlePrimaryButton,
                  onPressed: onPrimaryButtonPressed,
                  backgroundColor: primaryBackgroundButtonColor,
                  foregroundColor: titlePrimaryButtonColor,
                ),
              ),
            ),
          if (titleSecondaryButton.isNotEmpty)
            SizedBox(
              width: double.infinity,
              child: RElevatedButton(
                text: titleSecondaryButton,
                onPressed: onSecondaryButtonPressed,
                backgroundColor: secondaryBackgroundButtonColor,
                foregroundColor: titleSecondaryButtonColor,
              ),
            ),
        ],
      ),
    );
  }
}
