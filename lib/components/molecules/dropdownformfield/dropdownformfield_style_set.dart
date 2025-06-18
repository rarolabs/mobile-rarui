import 'dropdownformfield_specs.dart';
import 'dropdownformfield_style.dart';

enum DropdownformfieldStyleSet {
  standard;

  QDropdownformfieldStyles get specs => switch (this) {
        standard => DropdownformfieldSpecs.standardStyle,
      };
}
