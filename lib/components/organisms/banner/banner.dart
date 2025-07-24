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
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? subtitleColor;
  final double? height;

  const RBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.image,
    this.onTap,
    this.onButtonPressed,
    this.backgroundColor,
    this.height = 160,
    this.titleColor,
    this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor ?? theme.colorScheme.surface,
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
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: titleColor ?? theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  RLabel(
                    text: subtitle,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: subtitleColor ?? theme.colorScheme.onSurface.withAlpha(179),
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
