import 'package:flutter/material.dart';

import '../../../rarui.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../list_tile/list_tile_style.dart';
import 'list_tile_style_set.dart';

class ListTileComponent extends StatelessWidget with Component<QListTileStyle, QListTileSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Estilo do componente
  final ListTileStyleSet styles;

  /// Função de callback que navega para uma nova pagina
  final void Function()? onPressed;

  /// Título do ListTile
  final String title;

  /// Status do ListTile
  final String? statusText;

  /// Subtítulo do ListTile
  final String? subtitle;

  /// Hint de semântica do componente
  final String? hintSemantics;

  /// Label de semântica do componente
  final String? labelSemantics;

  /// Label de valor do componente
  final String? trailingLabel;

  /// Caminho do arquivo svg do leadingIcon
  final String? svgPathLeading;

  /// Caminho do arquivo svg do trailingIcon
  final String? svgPathTrailing;

  /// Função de callback que executará uma ação ao clicar no TrailingIcon
  final void Function()? onPressedTrailingIcon;

  /// Se true representará o QToogle no lugar do TrailingIcon
  final bool trailingToggle;

  /// Valor do trailingToggle para marcar e desmarcar
  final bool valueToggle;

  /// Ação ao clicar no Toggle
  final void Function(bool)? onPressedToggle;

  /// Se true representará o QRadio no lugar do TrailingIcon
  final bool trailingRadio;

  /// Valor do trailingRadio para marcar e desmarcar
  final bool valueRadio;

  /// Ação ao clicar no Radio Button
  final void Function(bool)? onPressedRadio;

  const ListTileComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    this.onPressed,
    required this.title,
    this.statusText,
    this.subtitle,
    this.hintSemantics,
    this.labelSemantics,
    this.svgPathLeading,
    this.svgPathTrailing,
    this.trailingLabel,
    this.onPressedTrailingIcon,
    this.trailingToggle = false,
    this.valueToggle = false,
    this.onPressedToggle,
    this.trailingRadio = false,
    this.valueRadio = false,
    this.onPressedRadio,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<QListTileStyle, QListTileSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    QListTileStyle style,
    QListTileSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _BasicListTile(
      behaviour: behaviour,
      style: style,
      sharedStyle: styles.specs.shared,
      title: title,
      statusText: statusText,
      subtitle: subtitle,
      onPressed: onPressed,
      hintSemantics: hintSemantics,
      labelSemantics: labelSemantics,
      svgPathLeading: svgPathLeading,
      svgPathTrailing: svgPathTrailing,
      onPressedTrailingIcon: onPressedTrailingIcon,
      trailingToggle: trailingToggle,
      valueToggle: valueToggle,
      onPressedToggle: onPressedToggle,
      trailingRadio: trailingRadio,
      valueRadio: valueRadio,
      onPressedRadio: onPressedRadio,
      trailingLabel: trailingLabel,
    );
  }

  @override
  Widget whenRegular(
    QListTileStyle style,
    QListTileSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _BasicListTile(
        behaviour: behaviour,
        style: style,
        sharedStyle: styles.specs.shared,
        title: title,
        statusText: statusText,
        subtitle: subtitle,
        onPressed: onPressed,
        hintSemantics: hintSemantics,
        labelSemantics: labelSemantics,
        svgPathLeading: svgPathLeading,
        svgPathTrailing: svgPathTrailing,
        trailingLabel: trailingLabel,
        onPressedTrailingIcon: onPressedTrailingIcon,
        trailingToggle: trailingToggle,
        valueToggle: valueToggle,
        onPressedToggle: onPressedToggle,
        onPressedRadio: onPressedRadio,
        trailingRadio: trailingRadio,
        valueRadio: valueRadio,
      );

  @override
  Widget whenDisabled(
    QListTileStyle style,
    QListTileSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _BasicListTile(
        behaviour: behaviour,
        style: style,
        sharedStyle: styles.specs.shared,
        title: title,
        statusText: statusText,
        subtitle: subtitle,
        onPressed: onPressed,
        hintSemantics: hintSemantics,
        labelSemantics: labelSemantics,
        svgPathLeading: svgPathLeading,
        svgPathTrailing: svgPathTrailing,
        trailingLabel: trailingLabel,
        onPressedTrailingIcon: onPressedTrailingIcon,
        trailingToggle: trailingToggle,
        valueToggle: valueToggle,
        onPressedToggle: onPressedToggle,
        onPressedRadio: onPressedRadio,
        trailingRadio: trailingRadio,
        valueRadio: valueRadio,
      );

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };
}

class _BasicListTile extends StatelessWidget {
  final Behaviour behaviour;
  final QListTileStyle style;
  final QListTileSharedStyle sharedStyle;
  final String title;
  final String? statusText;
  final String? subtitle;
  final void Function()? onPressed;
  final String? hintSemantics;
  final String? labelSemantics;
  final String? svgPathLeading;
  final String? svgPathTrailing;
  final String? trailingLabel;
  final void Function()? onPressedTrailingIcon;
  final bool? trailingToggle;
  final bool? valueToggle;
  final void Function(bool)? onPressedToggle;
  final bool? trailingRadio;
  final bool? valueRadio;
  final void Function(bool)? onPressedRadio;

  const _BasicListTile({
    required this.behaviour,
    required this.style,
    required this.sharedStyle,
    this.onPressed,
    required this.title,
    required this.statusText,
    this.subtitle,
    this.hintSemantics,
    this.labelSemantics,
    this.svgPathLeading,
    this.svgPathTrailing,
    this.trailingLabel,
    this.onPressedTrailingIcon,
    this.trailingToggle,
    this.valueToggle,
    this.onPressedToggle,
    this.trailingRadio,
    this.valueRadio,
    this.onPressedRadio,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: DecoratedBox(
        key: const Key('container-list-tile'),
        decoration: BoxDecoration(
          color: style.activeColor,
        ),
        child: GestureDetector(
          key: const Key('gesture-list-tile'),
          onTap: behaviour.isDisabled ? null : onPressed,
          child: ColoredBox(
            color: style.activeColor,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: style.verticalPadding,
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            crossAxisAlignment:
                                style.centralized ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                            children: [
                              if ((svgPathLeading?.isNotEmpty ?? false) && style.leadingIconStyle != null) ...{
                                QIcon(
                                  key: const Key('leading-icon'),
                                  style: style.leadingIconStyle!,
                                  behaviour: behaviour,
                                  svgPath: svgPathLeading!,
                                ),
                                SizedBox(
                                  key: const Key('space-list-tile'),
                                  width: style.space ?? QSizes.x8,
                                ),
                              },
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: QSizes.x4),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: QLabel(
                                                text: '$title${statusText != null ? ' - ' : ''}',
                                                behaviour: behaviour.isError ? Behaviour.regular : behaviour,
                                                style: sharedStyle.titleStyle,
                                              ),
                                            ),
                                            if (statusText != null && sharedStyle.statusStyle != null)
                                              QLabel(
                                                text: statusText,
                                                behaviour: behaviour.isError ? Behaviour.regular : behaviour,
                                                style: sharedStyle.statusStyle!,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: style.spaceBetweenTexts),
                                    if (subtitle?.isNotEmpty ?? false)
                                      Flexible(
                                        child: QLabel(
                                          text: subtitle,
                                          behaviour: behaviour.isError ? Behaviour.regular : behaviour,
                                          style: sharedStyle.subtitleStyle,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: QSizes.x36),
                        if ((svgPathTrailing?.isNotEmpty ?? false) && style.trailingIconStyle != null)
                          Padding(
                            padding: EdgeInsets.only(right: style.addSpaceBetweenTrailingIconAndLabel),
                            child: QIcon(
                              key: const Key('trailing-icon'),
                              style: style.trailingIconStyle!,
                              behaviour: behaviour,
                              svgPath: svgPathTrailing!,
                              onPressed: onPressedTrailingIcon,
                            ),
                          )
                        else if (trailingLabel?.isNotEmpty ?? false)
                          QLabel(
                            text: trailingLabel,
                            behaviour: behaviour,
                            style: sharedStyle.trailingLabelStyle,
                          ),
                        if ((trailingToggle ?? false) && valueToggle != null)
                          QToggle(
                            behaviour: behaviour,
                            initialValue: valueToggle!,
                            onChanged: onPressedToggle != null ? (newValue) => onPressedToggle!(newValue) : null,
                            style: sharedStyle.trailingToggleStyle!,
                          ),
                        if ((trailingRadio ?? false) && valueRadio != null)
                          SizedBox(
                            child: Radio<bool>(
                              value: true,
                              groupValue: valueRadio,
                              overlayColor: WidgetStateProperty.all(QTheme.colors.black),
                              hoverColor: QTheme.colors.black,
                              onChanged: onPressedToggle != null ? (value) => onPressedRadio!(value!) : null,
                              fillColor: WidgetStateProperty.all(QTheme.colors.black),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                QDivider(
                  behaviour: Behaviour.regular,
                  style: sharedStyle.dividerStyleSet,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
