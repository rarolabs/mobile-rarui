import 'package:flutter/material.dart';
import 'package:rarUI/components/atoms/label/label.dart';
import 'package:rarUI/components/molecules/buttons/elevated_button.dart';

enum RStatusType { success, failure }

class RStatus extends StatelessWidget {
  final RStatusType type;
  final String? title;
  final String description;
  final String buttonText;
  final ImageProvider image;
  final VoidCallback? onButtonPressed;
  final VoidCallback? onClosePressed;

  const RStatus({
    super.key,
    required this.type,
    this.title,
    required this.description,
    required this.buttonText,
    required this.image,
    this.onButtonPressed,
    this.onClosePressed,
  });

  String _getTitle() {
    switch (type) {
      case RStatusType.success:
        return title ?? 'Sucesso';
      case RStatusType.failure:
        return title ?? 'Falha';
    }
  }

  Color _getBackgroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.background;
  }

  Color _getTitleColor(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge?.color ?? Colors.black;
  }

  Color _getDescriptionColor(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black54;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getBackgroundColor(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 52),
                  RLabel(
                    text: _getTitle(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: _getTitleColor(context),
                        ),
                  ),
                  const SizedBox(height: 48),
                  Image(image: image, width: 160, height: 160),
                  const SizedBox(height: 48),
                  RLabel(
                    text: description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: _getDescriptionColor(context),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  RElevatedButton(
                    text: buttonText,
                    onPressed: onButtonPressed,
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: 0,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  color: Theme.of(context).iconTheme.color,
                  onPressed: onClosePressed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
