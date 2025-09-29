import 'package:flutter/material.dart';
import 'package:rarui/utils/extensions/theme_extension.dart';

class RMaterialDemoPage extends StatelessWidget {
  final String? semanticsLabel;
  final String? semanticsHint;

  RMaterialDemoPage({
    this.semanticsLabel,
    this.semanticsHint,
  });

  final boolNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final wSize = MediaQuery.sizeOf(context).width;
    final colorScheme = Theme.of(context).colorScheme;
    return Semantics(
      label: semanticsLabel,
      hint: semanticsHint,
      child: Scaffold(
        appBar: AppBar(title: Text('Material 3 Example')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBox('surface', colorScheme.surface,
                      colorScheme.onSurface, wSize * 0.16),
                  _buildBox('inverse surface', colorScheme.inverseSurface,
                      colorScheme.onInverseSurface, wSize * 0.16),
                  _buildBox('primary', colorScheme.primary,
                      colorScheme.onPrimary, wSize * 0.16),
                  _buildBox('secondary', colorScheme.secondary,
                      colorScheme.onSecondary, wSize * 0.16),
                  _buildBox('tertiary', colorScheme.tertiary,
                      colorScheme.onTertiary, wSize * 0.16),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBoxScheme(
                      'success',
                      Theme.of(context).extension<ExtraColors>()!.success,
                      wSize * 0.2),
                  _buildBoxScheme(
                      'warning',
                      Theme.of(context).extension<ExtraColors>()!.warning,
                      wSize * 0.2),
                  _buildBoxScheme(
                      'error',
                      Theme.of(context).extension<ExtraColors>()!.error,
                      wSize * 0.2),
                  _buildBoxScheme(
                      'info',
                      Theme.of(context).extension<ExtraColors>()!.info,
                      wSize * 0.2),
                ],
              ),
              const SizedBox(height: 20),
              _buildButtonRow(
                  context, Theme.of(context).colorScheme.primary, null),
              _buildButtonRow(
                  context, Theme.of(context).colorScheme.primary, () {}),
              const SizedBox(height: 20),
              _buildToggleableWidgets(
                  context, Theme.of(context).colorScheme.primary),
              _buildToggleableWidgets(context,
                  Theme.of(context).extension<ExtraColors>()!.success.primary),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleableWidgets(BuildContext context, Color color) {
    return Theme(
      data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(primary: color)),
      child: ValueListenableBuilder(
          valueListenable: boolNotifier,
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Checkbox(
                  value: boolNotifier.value,
                  onChanged: (value) {
                    boolNotifier.value = value ?? false;
                  },
                ),
                Checkbox(
                  value: !boolNotifier.value,
                  onChanged: (value) {
                    boolNotifier.value = value ?? false;
                  },
                ),
                Radio<bool>(
                  value: true,
                  groupValue: boolNotifier.value,
                  onChanged: (value) {
                    boolNotifier.value = value ?? false;
                  },
                ),
                Radio<bool>(
                  value: false,
                  groupValue: boolNotifier.value,
                  onChanged: (value) {
                    boolNotifier.value = value ?? false;
                  },
                ),
                Switch(
                  value: boolNotifier.value,
                  onChanged: (value) {
                    boolNotifier.value = value;
                  },
                ),
                Switch(
                  value: !boolNotifier.value,
                  onChanged: (value) {
                    boolNotifier.value = value;
                  },
                ),
              ],
            );
          }),
    );
  }

  Widget _buildButtonRow(
      BuildContext context, Color primaryColor, VoidCallback? onPressed) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme:
            Theme.of(context).colorScheme.copyWith(primary: primaryColor),
      ),
      child: Builder(
        builder: (ctx) {
          final colorScheme = Theme.of(ctx).colorScheme;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: onPressed, child: const Text('Elevated Button')),
              OutlinedButton(
                onPressed: onPressed,
                child: const Text('Outlined Button'),
                style: ButtonStyle(
                  side: WidgetStateProperty.fromMap(
                    {
                      WidgetState.disabled: null,
                      WidgetState.any: BorderSide(color: colorScheme.primary),
                    },
                  ),
                ),
              ),
              TextButton(
                  onPressed: onPressed, child: const Text('Text Button')),
              FilledButton(
                  onPressed: onPressed, child: const Text('Filled Button')),
              IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.add),
                color: colorScheme.primary,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBox(
    String text,
    Color color,
    Color textColor,
    double size,
  ) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: color,
      width: size,
      height: size,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBoxScheme(
    String colorName,
    ColorScheme colorScheme,
    double size,
  ) {
    return Column(
      children: [
        (colorScheme.primary, colorScheme.onPrimary, 'primary'),
        (
          colorScheme.primaryContainer,
          colorScheme.onPrimaryContainer,
          'primaryContainer'
        ),
        (colorScheme.primaryFixed, colorScheme.onPrimaryFixed, 'primaryFixed'),
        (
          colorScheme.primaryFixedDim,
          colorScheme.onPrimaryFixedVariant,
          'primaryFixedDim'
        ),
      ].map(
        (e) {
          return Container(
            color: e.$1,
            width: size,
            height: size / 4,
            padding: EdgeInsets.only(left: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                colorName + ' (${e.$3})',
                style: TextStyle(
                    color: e.$2, fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
