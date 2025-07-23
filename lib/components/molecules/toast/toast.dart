import 'package:flutter/material.dart';
import 'package:rarUI/utils/extensions/theme_extension.dart';

enum RToastType { clean, soft, solid }

enum RToastStyle { success, warning, error, info, custom }

class RToast extends StatelessWidget {
  final String title;
  final String message;
  final String? buttonText;
  final VoidCallback? buttonAction;
  final RToastType type;
  final RToastStyle style;
  final bool isDense;
  final VoidCallback? onClose;
  final Color? customColor;
  final IconData? customIcon;

  RToast({
    required this.title,
    required this.message,
    this.buttonText,
    this.buttonAction,
    this.type = RToastType.soft,
    required this.style,
    required this.isDense,
    this.onClose,
    this.customColor,
    this.customIcon,
  }) : assert(
          style != RToastStyle.custom || (customColor != null && customIcon != null),
          'customColor and customIcon must be provided when using RToastStyle.custom',
        );

  @override
  Widget build(BuildContext context) {
    final onSurface = type == RToastType.solid
        ? Theme.of(context).colorScheme.onInverseSurface
        : Theme.of(context).colorScheme.onSurface;

    Icon icon;
    IconData iconData;
    ColorScheme colorScheme;
    Color primaryColor;
    double iconSize = isDense ? 16 : 24;

    switch (style) {
      case RToastStyle.success:
        iconData = Icons.check_circle;
        colorScheme = Theme.of(context).extension<ExtraColors>()!.success;
        primaryColor = colorScheme.primary;
        break;
      case RToastStyle.warning:
        iconData = Icons.warning;
        colorScheme = Theme.of(context).extension<ExtraColors>()!.warning;
        primaryColor = colorScheme.primary;
        break;
      case RToastStyle.error:
        iconData = Icons.error;
        colorScheme = Theme.of(context).extension<ExtraColors>()!.error;
        primaryColor = colorScheme.primary;
        break;
      case RToastStyle.info:
        iconData = Icons.info;
        colorScheme = Theme.of(context).extension<ExtraColors>()!.info;
        primaryColor = colorScheme.primary;
        break;
      case RToastStyle.custom:
        iconData = customIcon!;
        primaryColor = customColor!;
        break;
    }

    icon = Icon(
      iconData,
      size: iconSize,
      color: type == RToastType.solid ? onSurface : primaryColor,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: primaryColor.withValues(alpha: type == RToastType.solid ? 1.0 : 0.1),
        gradient: type == RToastType.clean
            ? LinearGradient(
                // Faixa lateral sem intrinsic height
                // Avaliar se vale o contornar o intrinsic height assim
                colors: [primaryColor, Theme.of(context).colorScheme.surface],
                stops: [0.01, 0.01],
              )
            : null,
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
