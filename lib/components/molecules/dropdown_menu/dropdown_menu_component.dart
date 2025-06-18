import 'package:flutter/material.dart';

import '../../../shared_widget/loading_widget.dart';
import '../../../theme/sizes.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../../atoms/atoms.dart';
import 'dropdown_menu_specs.dart';
import 'dropdown_menu_style.dart';

/// Esta classe é responsável por gerenciar qualquer tipo de image
///
/// Faz a tratativa de arquivos assets locais e remotos e imagens http
class DropdownMenuComponent<T> extends StatelessWidget with Component<DropdownMenuStyle, DropdownMenuSharedStyle> {
  // Comportamento do componente
  final Behaviour behaviour;

  // Estilo do componente
  final DropdownMenuStyleSet styles;

  /// Define se será possível pesquisar no dropdown menu
  final bool enableSearch;

  /// Valor do dropdown
  final String dropdownValue;

  /// Texto da label
  final String labelText;

  /// Caminho do arquivo svg do trailingIcon
  final String? svgPathTrailing;

  /// Caminho do arquivo svg do selectedTrailingIcon
  final String? svgPathSelectedTrailing;

  /// Define a função que será chamada quando outro valor for escolhido
  final ValueChanged<T?>? onSelected;

  /// itens do menu.
  final List<T> menuItens;

  /// Labels dos itens do menu.
  final List<String> menuItensLabels;

  const DropdownMenuComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.labelText,
    required this.onSelected,
    required this.dropdownValue,
    required this.menuItens,
    required this.menuItensLabels,
    this.svgPathTrailing,
    this.svgPathSelectedTrailing,
    this.enableSearch = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<DropdownMenuStyle, DropdownMenuSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    DropdownMenuStyle style,
    DropdownMenuSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      LoadingWidget(style: otherStyle.loadingStyle);

  @override
  Widget whenDisabled(
    DropdownMenuStyle style,
    DropdownMenuSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _DropdownMenu(
        style: style,
        enableSearch: enableSearch,
        dropdownValue: dropdownValue,
        behaviour: behaviour,
        labelText: labelText,
        menuItens: menuItens,
        menuItensLabels: menuItensLabels,
        svgPathTrailing: svgPathTrailing,
        svgPathSelectedTrailing: svgPathSelectedTrailing,
        enabled: false,
      );

  @override
  Widget whenRegular(
    DropdownMenuStyle style,
    DropdownMenuSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _DropdownMenu(
      style: style,
      enableSearch: enableSearch,
      dropdownValue: dropdownValue,
      behaviour: behaviour,
      labelText: labelText,
      onSelected: onSelected,
      menuItens: menuItens,
      menuItensLabels: menuItensLabels,
      svgPathTrailing: svgPathTrailing,
      svgPathSelectedTrailing: svgPathSelectedTrailing,
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };
}

class _DropdownMenu<T> extends StatelessWidget {
  const _DropdownMenu({
    super.key,
    required this.style,
    required this.enableSearch,
    required this.dropdownValue,
    required this.behaviour,
    required this.labelText,
    required this.menuItens,
    required this.menuItensLabels,
    this.enabled = true,
    this.onSelected,
    this.svgPathTrailing,
    this.svgPathSelectedTrailing,
  });

  final DropdownMenuStyle style;
  final bool enabled;
  final bool enableSearch;
  final String dropdownValue;
  final Behaviour behaviour;
  final String labelText;
  final ValueChanged<T?>? onSelected;
  final List menuItens;
  final List<String> menuItensLabels;
  final String? svgPathTrailing;
  final String? svgPathSelectedTrailing;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      width: style.width,
      enabled: enabled,
      enableSearch: enableSearch,
      alignmentOffset: style.offset,
      menuStyle: style.menuStyle,
      textStyle: style.textStyle,
      trailingIcon: svgPathTrailing != null ? QIcon.size16Black(behaviour: behaviour, svgPath: svgPathTrailing!) : null,
      selectedTrailingIcon: svgPathSelectedTrailing != null ? QIcon.size16Black(behaviour: behaviour, svgPath: svgPathSelectedTrailing!) : null,
      inputDecorationTheme: style.inputDecorationTheme.copyWith(
        border: OutlineInputBorder(
          borderSide: dropdownValue.isEmpty
              ? BorderSide.none
              : BorderSide(
                  color: style.selectedBorderColor,
                ),
          borderRadius: BorderRadius.circular(
            QSizes.x4,
          ),
        ),
      ),
      label: dropdownValue.isEmpty
          ? QLabel(
              behaviour: behaviour,
              text: labelText,
              textOverflow: TextOverflow.ellipsis,
              style: style.labelStyle,
            )
          : null,
      onSelected: onSelected,
      dropdownMenuEntries: List.generate(
        menuItens.length,
        (int index) {
          return DropdownMenuEntry(
            value: menuItens[index],
            label: menuItensLabels[index],
            style: style.menuItemButtonStyle,
          );
        },
      ),
    );
  }
}
