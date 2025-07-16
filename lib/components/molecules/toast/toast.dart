import 'package:flutter/material.dart';

enum RToastType { clean, soft, solid }

enum RToastStyle { success, warning, error, info }

// TODO: Migrar cores e estilos para o tema
class RToast extends StatelessWidget {
  final String title;
  final String message;
  final String? buttonText;
  final VoidCallback? buttonAction;
  final RToastType type;
  final RToastStyle style;
  final bool isDense;
  final VoidCallback? onClose;

  RToast({
    required this.title,
    required this.message,
    this.buttonText,
    this.buttonAction,
    this.type = RToastType.soft,
    required this.style,
    required this.isDense,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final onSurface = type == RToastType.solid
        ? Theme.of(context).colorScheme.onInverseSurface
        : Theme.of(context).colorScheme.onSurface;

    Icon icon;
    IconData iconData;
    Color color;
    double iconSize = isDense ? 16 : 24;

    double backgroundOpacity;

    switch (type) {
      case RToastType.clean:
        backgroundOpacity = 0.0;
        break;
      case RToastType.soft:
        backgroundOpacity = 0.1;
        break;
      case RToastType.solid:
        backgroundOpacity = 1.0;
        break;
    }

    switch (style) {
      case RToastStyle.success:
        iconData = Icons.check_circle;
        color = Color(0xFF1A9338);
        break;
      case RToastStyle.warning:
        iconData = Icons.warning;
        color = Color(0xFFFFB042);
        break;
      case RToastStyle.error:
        iconData = Icons.error;
        color = Color(0xFFFDC2A23);
        break;
      case RToastStyle.info:
        iconData = Icons.info;
        color = Color(0xFF03AEFC);
        break;
    }

    icon = Icon(
      iconData,
      size: iconSize,
      color: type == RToastType.solid ? onSurface : color,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // Faixa lateral sem intrinsic height
          // Avaliar se vale o contornar o intrinsic height assim
          colors: [
            color.withValues(alpha: type == RToastType.clean ? 1 : backgroundOpacity),
            color.withValues(alpha: backgroundOpacity),
          ],
          stops: [0.01, 0.01],
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    color: onSurface,
                    fontSize: isDense ? 12 : 14,
                  ),
                ),
                if (buttonText != null) ...[
                  SizedBox(height: 4),
                  InkWell(
                    onTap: buttonAction,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: onSurface,
                          ),
                        ),
                      ),
                      child: Text(
                        buttonText!,
                        style: TextStyle(
                          color: onSurface,
                          fontSize: isDense ? 12 : 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (onClose != null)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 24,
                    color: onSurface,
                  ),
                  onPressed: onClose,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
