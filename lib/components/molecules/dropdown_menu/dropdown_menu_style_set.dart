part of 'dropdown_menu_specs.dart';

enum DropdownMenuStyleSet {
  standard;

  const DropdownMenuStyleSet();

  DropdownMenuStyles get specs {
    return switch (this) {
      standard => DropdownMenuSpecs.standardStyle,
    };
  }
}
