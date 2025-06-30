import 'package:flutter/material.dart';
import 'package:rarUI/rarui.dart';
import 'package:rarUI/utils/extensions/theme_extension.dart';

class RExampleMaterialPage extends StatelessWidget {
  final String? semanticsLabel;
  final String? semanticsHint;
  final bool isLoading;

  RExampleMaterialPage({
    this.semanticsLabel,
    this.semanticsHint,
    this.isLoading = false,
  });

  final boolNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final wSize = MediaQuery.sizeOf(context).width;
    return Semantics(
      label: semanticsLabel,
      hint: semanticsHint,
      child: Scaffold(
        appBar: AppBar(title: Text('Material 3 Example')),
        body: RShimmer(
          isLoading: isLoading,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBox(
                      ['surface background', 'onSurface text'],
                      Theme.of(context).colorScheme.surface,
                      Theme.of(context).colorScheme.onSurface,
                      wSize * 0.3,
                    ),
                    _buildBox(
                      ['inverse surface background', 'onInverseSurface text'],
                      Theme.of(context).colorScheme.inverseSurface,
                      Theme.of(context).colorScheme.onInverseSurface,
                      wSize * 0.3,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBox(
                      ['primary background', 'onPrimary text'],
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.onPrimary,
                      wSize * 0.3,
                    ),
                    _buildBox(
                      ['secondary background', 'onSecondary text'],
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.onSecondary,
                      wSize * 0.3,
                    ),
                    _buildBox(
                      ['tertiary background', 'onTertiary text'],
                      Theme.of(context).colorScheme.tertiary,
                      Theme.of(context).colorScheme.onTertiary,
                      wSize * 0.3,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBox(
                      ['success background', 'onSuccess text'],
                      Theme.of(context).extension<ExtraColors>()!.success,
                      Theme.of(context).colorScheme.onPrimary,
                      wSize * 0.3,
                    ),
                    _buildBox(
                      ['warning background', 'onWarning text'],
                      Theme.of(context).extension<ExtraColors>()!.warning,
                      Theme.of(context).colorScheme.onPrimary,
                      wSize * 0.3,
                    ),
                    _buildBox(
                      ['error background', 'onError text'],
                      Theme.of(context).colorScheme.error,
                      Theme.of(context).colorScheme.onError,
                      wSize * 0.3,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildButtonRow(context, Theme.of(context).colorScheme.primary, null),
                const SizedBox(height: 20),
                _buildButtonRow(context, Theme.of(context).colorScheme.secondary, null),
                const SizedBox(height: 20),
                _buildButtonRow(context, Theme.of(context).colorScheme.tertiary, null),
                const SizedBox(height: 20),
                _buildButtonRow(context, Theme.of(context).colorScheme.primary, () {}),
                const SizedBox(height: 20),
                _buildButtonRow(context, Theme.of(context).colorScheme.secondary, () {}),
                const SizedBox(height: 20),
                _buildButtonRow(context, Theme.of(context).colorScheme.tertiary, () {}),
                const SizedBox(height: 20),
                _buildToggleableWidgets(context, Theme.of(context).colorScheme.primary),
                const SizedBox(height: 20),
                _buildToggleableWidgets(context, Theme.of(context).colorScheme.secondary),
                const SizedBox(height: 20),
                _buildToggleableWidgets(context, Theme.of(context).colorScheme.tertiary),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleableWidgets(BuildContext context, Color color) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: color,
            ),
      ),
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

  Widget _buildButtonRow(BuildContext context, Color primaryColor, VoidCallback? onPressed) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(primary: primaryColor),
      ),
      child: Builder(
        builder: (ctx) {
          final colorScheme = Theme.of(ctx).colorScheme;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: onPressed, child: const Text('Elevated Button')),
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
              TextButton(onPressed: onPressed, child: const Text('Text Button')),
              FilledButton(onPressed: onPressed, child: const Text('Filled Button')),
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
    List<String> text,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: text.map((line) {
            return Text(
              line,
              style: TextStyle(color: textColor),
            );
          }).toList(),
        ),
      ),
    );
  }
}
