part of 'toast_specs.dart';

enum ToastStyleSet {
  gray4White;

  const ToastStyleSet();

  ToastStyles get specs => switch (this) {
        gray4White => ToastSpecs.gray4WhiteStyle,
      };
}
