import 'textformfield_specs.dart';
import 'textformfield_style.dart';

enum TextformfieldStyleSet {
  standard,
  password,
  search,
  suffixIcon;

  const TextformfieldStyleSet();

  QTextformfieldStyles get specs => switch (this) {
        standard => TextformfieldSpecs.standardStyle,
        password => TextformfieldSpecs.passwordStyle,
        search => TextformfieldSpecs.searchStyle,
        suffixIcon => TextformfieldSpecs.sufixIconStyle,
      };
}
