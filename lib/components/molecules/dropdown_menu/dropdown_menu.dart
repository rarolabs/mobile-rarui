import 'dropdown_menu_specs.dart';

class QDropdownMenu<T> extends DropdownMenuSpecs {
  final DropdownMenuStyleSet style;

  const QDropdownMenu({
    super.key,
    required this.style,
    required super.behaviour,
    required super.labelText,
    required super.onSelected,
    required super.dropdownValue,
    required super.menuItens,
    required super.menuItensLabels,
    super.enableSearch,
  }) : super(styles: style);

  /// Dropdown Menu padrão cashback
  const QDropdownMenu.standard({
    super.key,
    required super.behaviour,
    required super.labelText,
    required super.onSelected,
    required super.dropdownValue,
    required super.menuItens,
    required super.menuItensLabels,
    required super.svgPathTrailing,
    required super.svgPathSelectedTrailing,
  })  : style = DropdownMenuStyleSet.standard,
        super(styles: DropdownMenuStyleSet.standard);
}
