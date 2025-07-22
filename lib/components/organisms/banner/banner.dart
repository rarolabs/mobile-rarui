import 'package:flutter/material.dart';
import 'package:rarUI/components/atoms/label/label.dart';
import 'package:rarUI/components/molecules/buttons/elevated_button.dart';

class RBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback? onTap;
  final VoidCallback? onButtonPressed;
  final ImageProvider? image;
  final Color backgroundColor;
  final Color? titleColor;
  final Color? subtitleColor;

  const RBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.image,
    this.onTap,
    this.onButtonPressed,
    this.backgroundColor = Colors.white,
    this.titleColor,
    this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            /// Esquerda: Texto e botão
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RLabel(
                    text: title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: titleColor ?? Colors.black,
                        ),
                  ),
                  const SizedBox(height: 8),
                  RLabel(
                    text: subtitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: subtitleColor ?? Colors.black54,
                        ),
                  ),
                  const SizedBox(height: 12),
                  RElevatedButton(
                    text: buttonText,
                    onPressed: onButtonPressed,
                  ),
                ],
              ),
            ),

            /// Direita: Imagem (se fornecida)
            if (image != null)
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    image: image!,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
