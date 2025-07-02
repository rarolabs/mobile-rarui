import 'package:flutter/material.dart';

class RTooltip extends StatelessWidget {
  const RTooltip({
    Key? key,
    this.title,
    this.preferBelow = false,
    this.maxWidth = 300,
    required this.message,
    required this.child,
  }) : super(key: key);

  final String message;
  final String? title;
  final bool preferBelow;
  final double maxWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (title != null) {
      return Tooltip(
        constraints: BoxConstraints(maxWidth: maxWidth, minHeight: 24),
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 12),
        preferBelow: preferBelow,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        richMessage: TextSpan(
          style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
          children: [
            TextSpan(text: title!, style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: '\n'),
            WidgetSpan(child: SizedBox(height: 4)),
            TextSpan(text: message),
            TextSpan(
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            ),
          ],
        ),
        child: child,
      );
    }

    return Tooltip(
      message: message,
      preferBelow: preferBelow,
      constraints: BoxConstraints(maxWidth: maxWidth, minHeight: 24),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(4),
      ),
      textStyle: TextStyle(color: Theme.of(context).colorScheme.onInverseSurface),
      child: child,
    );
  }
}
