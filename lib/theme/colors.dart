import 'package:flutter/material.dart';

abstract interface class IColors {
  Color get primaryColorBase;
  Color get primaryColorLight;
  Color get primaryColorDark;
  Color get secondaryColorBase;
  Color get secondaryColorLight;
  Color get secondaryColorDark;
  Color get gray1;
  Color get gray2;
  Color get gray3;
  Color get gray4;
  Color get gray5;
  Color get gray6;
  Color get gray7;
  Color get gray8;
  Color get gray9;
  Color get gray10;
  Color get gray11;
  Color get successColorBase;
  Color get successColorLight;
  Color get successColorDark;
  Color get warningColorBase;
  Color get warningColorLight;
  Color get warningColorDark;
  Color get errorColorBase;
  Color get errorColorLight;
  Color get errorColorDark;
  Color get white;
  Color get transparent;
  Color get otpColor;
  Color get ciano;
  Color get black;
}

class QColors implements IColors {
  final Map<String, Color>? _colors;

  QColors({Map<String, Color>? colors}) : _colors = colors;

  @override
  Color get primaryColorBase => _colors?['primaryColorBase'] ?? const Color(0xff223D2B);

  @override
  Color get primaryColorLight => _colors?['primaryColorLight'] ?? const Color(0xff0076BA);

  @override
  Color get primaryColorDark => _colors?['primaryColorDark'] ?? const Color(0xff007276);

  @override
  Color get secondaryColorBase => _colors?['secondaryColorBase'] ?? const Color(0xffC89B6A);

  @override
  Color get secondaryColorLight => _colors?['secondaryColorLight'] ?? const Color(0xff13C366);

  @override
  Color get secondaryColorDark => _colors?['secondaryColorDark'] ?? const Color(0xffBB4617);

  @override
  Color get gray1 => _colors?['gray1'] ?? const Color(0xffF4F4F4);

  @override
  Color get gray2 => _colors?['gray2'] ?? const Color(0xffE0E0E0);

  @override
  Color get gray3 => _colors?['gray3'] ?? const Color(0xffA8A8A8);

  @override
  Color get gray4 => _colors?['gray4'] ?? const Color(0xff6F6F6F);

  @override
  Color get gray5 => _colors?['gray5'] ?? const Color(0xff393939);

  @override
  Color get gray6 => _colors?['gray6'] ?? const Color(0xff161616);

  @override
  Color get gray7 => _colors?['gray7'] ?? const Color(0xff1C1B1F);

  @override
  Color get gray8 => _colors?['gray8'] ?? const Color(0xff3B404F);

  @override
  Color get gray9 => _colors?['gray9'] ?? const Color(0xffC1C1C1);

  @override
  Color get gray10 => _colors?['gray10'] ?? const Color(0xffF7F7F7);

  @override
  Color get gray11 => _colors?['gray11'] ?? const Color(0xffE1E1E1);

  @override
  Color get successColorBase => _colors?['successColorBase'] ?? const Color(0xff24A148);

  @override
  Color get successColorLight => _colors?['successColorLight'] ?? const Color(0xff7cc791);

  @override
  Color get successColorDark => _colors?['successColorDark'] ?? const Color(0xff16612b);

  @override
  Color get warningColorBase => _colors?['warningColorBase'] ?? const Color(0xfffdd86a);

  @override
  Color get warningColorLight => _colors?['warningColorLight'] ?? const Color(0xffFCBE07);

  @override
  Color get warningColorDark => _colors?['warningColorDark'] ?? const Color(0xff977204);

  @override
  Color get errorColorBase => _colors?['errorColorBase'] ?? const Color(0xffDA1E28);

  @override
  Color get errorColorLight => _colors?['errorColorLight'] ?? const Color(0xffe9787e);

  @override
  Color get errorColorDark => _colors?['errorColorDark'] ?? const Color(0xff831218);

  @override
  Color get white => _colors?['white'] ?? const Color(0xffFFFFFF);

  @override
  Color get transparent => _colors?['transparent'] ?? const Color(0x00000000);

  @override
  Color get otpColor => _colors?['otpColor'] ?? const Color(0xffFB7100);

  @override
  Color get ciano => _colors?['ciano'] ?? const Color(0xff00ABAB);

  @override
  Color get black => _colors?['black'] ?? const Color(0xFF000000);
}
