import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RThemeDemoPage extends StatelessWidget {
  final (String name, ThemeData theme) theme1;
  final (String name, ThemeData theme) theme2;
  final String? semanticsLabel;
  final String? semanticsHint;

  RThemeDemoPage({
    required this.theme1,
    required this.theme2,
    this.semanticsLabel,
    this.semanticsHint,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel,
      hint: semanticsHint,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  theme1,
                  theme2,
                ]
                    .asMap()
                    .map((index, theme) {
                      final isLeft = index == 0;
                      return MapEntry(
                        index,
                        Expanded(
                          child: Container(
                            color: theme.$2.colorScheme.surface,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Column(
                              children: [
                                Text(
                                  theme.$1,
                                  style: TextStyle(
                                    color: theme.$2.colorScheme.onSurface,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                _themeDemo(theme.$2, isLeft),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
                    .values
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _themeDemo(ThemeData theme, bool isLeft) {
    return Column(
      children: _getThemeColorsMap(theme)
          .map(
            (name, color) {
              final i = _getThemeColorsMap(theme).keys.toList().indexOf(name);
              List<Widget> widgets = [
                InkWell(
                  onTap: () => Clipboard.setData(ClipboardData(text: _getColorString(color))),
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: theme.colorScheme.outline, width: 1),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        _getColorString(color),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          foreground: Paint()..color = color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: theme.colorScheme.onSurface,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ];
              if (isLeft) {
                widgets = widgets.reversed.toList();
              }

              return MapEntry(
                name,
                Container(
                  color: theme.colorScheme.surfaceContainer.withValues(alpha: i % 2 == 0 ? 1 : 0.5),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: isLeft ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: widgets,
                  ),
                ),
              );
            },
          )
          .values
          .toList(),
    );
  }

  static String _getColorString(Color color) => '0x${color.toARGB32().toRadixString(16).padLeft(8, '0').toUpperCase()}';

  static Map<String, Color> _getThemeColorsMap(ThemeData theme) {
    return {
      'primary': theme.colorScheme.primary,
      'onPrimary': theme.colorScheme.onPrimary,
      'primaryContainer': theme.colorScheme.primaryContainer,
      'onPrimaryContainer': theme.colorScheme.onPrimaryContainer,
      'secondary': theme.colorScheme.secondary,
      'onSecondary': theme.colorScheme.onSecondary,
      'secondaryContainer': theme.colorScheme.secondaryContainer,
      'onSecondaryContainer': theme.colorScheme.onSecondaryContainer,
      'tertiary': theme.colorScheme.tertiary,
      'onTertiary': theme.colorScheme.onTertiary,
      'tertiaryContainer': theme.colorScheme.tertiaryContainer,
      'onTertiaryContainer': theme.colorScheme.onTertiaryContainer,
      'error': theme.colorScheme.error,
      'onError': theme.colorScheme.onError,
      'errorContainer': theme.colorScheme.errorContainer,
      'onErrorContainer': theme.colorScheme.onErrorContainer,
      'surfaceDim': theme.colorScheme.surfaceDim,
      'surfaceBright': theme.colorScheme.surfaceBright,
      'surface': theme.colorScheme.surface,
      'onSurface': theme.colorScheme.onSurface,
      'onSurfaceVariant': theme.colorScheme.onSurfaceVariant,
      'surfaceContainerLowest': theme.colorScheme.surfaceContainerLowest,
      'surfaceContainerLow': theme.colorScheme.surfaceContainerLow,
      'surfaceContainer': theme.colorScheme.surfaceContainer,
      'surfaceContainerHigh': theme.colorScheme.surfaceContainerHigh,
      'surfaceContainerHighest': theme.colorScheme.surfaceContainerHighest,
      'outline': theme.colorScheme.outline,
      'outlineVariant': theme.colorScheme.outlineVariant,
      'inverseSurface': theme.colorScheme.inverseSurface,
      'onInverseSurface': theme.colorScheme.onInverseSurface,
      'inversePrimary': theme.colorScheme.inversePrimary,
      'scrim': theme.colorScheme.scrim,
      'shadow': theme.colorScheme.shadow,
    };
  }
}
