import 'package:flutter/widgets.dart';

abstract class ITypography {
  TextStyle get h1Lato42Bold;
  TextStyle get h2Lato32Bold;
  TextStyle get h3Lato28Bold;
  TextStyle get h4Lato24Bold;
  TextStyle get h5Lato20Bold;
  TextStyle get h5Roboto20Bold;
  TextStyle get bodyRoboto20Regular;
  TextStyle get paragraphRoboto16Bold;
  TextStyle get paragraphRoboto16Regular;
  TextStyle get paragraphRoboto14Medium;
  TextStyle get bodyRoboto16SemiBold;
  TextStyle get bodyRoboto16Medium;
  TextStyle get bodyRoboto14Medium;
  TextStyle get bodyRoboto14SemiBold;
  TextStyle get bodyRoboto14Light;
  TextStyle get bodyRoboto14Regular;
  TextStyle get captionRoboto14Bold;
  TextStyle get bodyRoboto16Regular;
  TextStyle get bodyRoboto24Bold;
  TextStyle get captionRoboto14Regular;
  TextStyle get captionRoboto12Bold;
  TextStyle get captionRoboto12Regular;
  TextStyle get bodyRoboto16Light;
  TextStyle get paragraphRoboto16SemiBold;
  TextStyle get bodyRoboto16Bold;
}

class QTypography implements ITypography {
  static const String _fontFamilyLato = 'Lato';
  static const String _fontFamilyRoboto = 'Roboto';

  @override
  TextStyle get h1Lato42Bold => const TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
        fontFamily: _fontFamilyLato,
      );

  @override
  TextStyle get h2Lato32Bold => const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontFamily: _fontFamilyLato,
      );

  @override
  TextStyle get h3Lato28Bold => const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        fontFamily: _fontFamilyLato,
      );

  @override
  TextStyle get h4Lato24Bold => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: _fontFamilyLato,
      );

  @override
  TextStyle get h5Lato20Bold => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: _fontFamilyLato,
      );

  @override
  TextStyle get h5Roboto20Bold => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: _fontFamilyRoboto,
      );

  @override
  TextStyle get paragraphRoboto16Bold => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: _fontFamilyRoboto,
        letterSpacing: 0.25,
      );

  @override
  TextStyle get bodyRoboto20Regular => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontFamily: _fontFamilyRoboto,
        letterSpacing: 0.25,
      );

  @override
  TextStyle get paragraphRoboto14Medium => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamilyRoboto,
        letterSpacing: 0.25,
      );

  @override
  TextStyle get bodyRoboto16SemiBold => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: _fontFamilyRoboto,
        letterSpacing: 0.25,
      );

  @override
  TextStyle get bodyRoboto16Medium => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamilyRoboto,
        letterSpacing: 0.25,
      );

  @override
  TextStyle get captionRoboto14Bold => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: _fontFamilyRoboto,
        letterSpacing: 0.25,
      );

  @override
  TextStyle get bodyRoboto14SemiBold => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: _fontFamilyRoboto,
        letterSpacing: 0.25,
      );

  @override
  TextStyle get bodyRoboto14Light => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        fontFamily: _fontFamilyRoboto,
        letterSpacing: 0.25,
      );

  @override
  TextStyle get bodyRoboto14Regular => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: _fontFamilyRoboto,
      );

  @override
  TextStyle get bodyRoboto14Medium => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamilyRoboto,
      );

  @override
  TextStyle get bodyRoboto16Regular => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: _fontFamilyRoboto,
      );
  @override
  TextStyle get bodyRoboto24Bold => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: _fontFamilyRoboto,
      );

  @override
  TextStyle get paragraphRoboto16Regular => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: _fontFamilyRoboto,
      );

  @override
  TextStyle get captionRoboto14Regular => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: _fontFamilyRoboto,
      );

  @override
  TextStyle get captionRoboto12Bold => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        fontFamily: _fontFamilyRoboto,
      );

  @override
  TextStyle get captionRoboto12Regular => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: _fontFamilyRoboto,
      );

  @override
  TextStyle get bodyRoboto16Light => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        fontFamily: _fontFamilyRoboto,
      );

  @override
  TextStyle get paragraphRoboto16SemiBold => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamilyRoboto,
        letterSpacing: 0.25,
      );

  @override
  TextStyle get bodyRoboto16Bold => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: _fontFamilyRoboto,
        letterSpacing: 0.25,
      );
}
