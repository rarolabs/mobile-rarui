part of 'password_page_specs.dart';

enum PasswordPageStyleSet {
  standardLeftText,
  standardCenteredText;

  const PasswordPageStyleSet();

  PasswordPageStyles get specs {
    return switch (this) {
      standardLeftText => PasswordPageSpecs.standardLeftTextStyle,
      standardCenteredText => PasswordPageSpecs.standardCenteredTextStyle,
    };
  }
}
