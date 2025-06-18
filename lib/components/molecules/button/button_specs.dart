import 'package:flutter/material.dart';

import '../../../shared_widget/dashed_border.dart';
import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/circular_progress/circular_progress_specs.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';
import 'button_component.dart';
import 'button_style.dart';

part 'button_style_set.dart';

class ButtonSpecs extends ButtonComponent {
  const ButtonSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    super.text,
    super.onPressed,
    super.buttonSemantics,
    super.hintSemantics,
    super.leadingIconPath,
    super.trailingIconPath,
  });

  static ButtonStyle get _buttonStyle => ButtonStyle(
        elevation: WidgetStateProperty.all(QSizes.x0),
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, QSizes.x48)),
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(QSizes.x8),
          ),
        ),
      );

  /// Usado para botões com cor primary
  static QButtonStyles get primaryBaseStyle {
    return QButtonStyles(
      regular: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16WhiteBold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          backgroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.primaryColorDark;
              }
              return QTheme.colors.primaryColorBase;
            },
          ),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16WhiteBold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          backgroundColor: WidgetStateProperty.all(QTheme.colors.gray2),
        ),
      ),
      processing: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16WhiteBold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          backgroundColor: WidgetStateProperty.all(
            QTheme.colors.primaryColorBase,
          ),
        ),
      ),
    );
  }

  /// Usado para botões com cor primary e label [gray3] quando desabilitado
  static QButtonStyles get primaryBaseDisableGray3Style {
    return QButtonStyles(
      regular: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16WhiteBold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          backgroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.primaryColorDark;
              }
              return QTheme.colors.primaryColorBase;
            },
          ),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Gray3Bold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          backgroundColor: WidgetStateProperty.all(QTheme.colors.gray2),
        ),
      ),
      processing: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16WhiteBold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          backgroundColor: WidgetStateProperty.all(
            QTheme.colors.primaryColorBase,
          ),
        ),
      ),
    );
  }

  /// Usado para botões com cor success
  static QButtonStyles get primarySuccessStyle {
    return QButtonStyles(
      regular: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16WhiteBold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          backgroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.successColorDark;
              }
              return QTheme.colors.successColorBase;
            },
          ),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16WhiteBold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          backgroundColor: WidgetStateProperty.all(QTheme.colors.gray2),
        ),
      ),
      processing: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16WhiteBold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          backgroundColor: WidgetStateProperty.all(
            QTheme.colors.successColorBase,
          ),
        ),
      ),
    );
  }

  /// Usado para botões com cor [secondaryColorLight]
  static QButtonStyles get primaryLightStyle {
    return QButtonStyles(
      regular: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16WhiteBold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          backgroundColor: WidgetStateProperty.all(
            QTheme.colors.secondaryColorLight,
          ),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16WhiteBold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          backgroundColor: WidgetStateProperty.all(
            QTheme.colors.gray2,
          ),
        ),
      ),
      processing: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16WhiteBold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          backgroundColor: WidgetStateProperty.all(
            QTheme.colors.secondaryColorLight,
          ),
        ),
      ),
    );
  }

  /// Usado para botões com cor vermelha
  static QButtonStyles get primaryRedStyle {
    return QButtonStyles(
      regular: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16WhiteBold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          backgroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.errorColorDark;
              }
              return QTheme.colors.errorColorBase;
            },
          ),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16WhiteBold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          backgroundColor: WidgetStateProperty.all(QTheme.colors.gray2),
        ),
      ),
      processing: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16WhiteBold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          backgroundColor: WidgetStateProperty.all(
            QTheme.colors.errorColorBase,
          ),
        ),
      ),
    );
  }

  /// Usado para botões com cor secondary
  static QButtonStyles get secondaryBaseStyle {
    return QButtonStyles(
      regular: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.primaryColorDark;
              }
              return QTheme.colors.primaryColorBase;
            },
          ),
          side: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return BorderSide(
                  color: QTheme.colors.primaryColorDark,
                  width: 2,
                );
              }
              return BorderSide(
                color: QTheme.colors.primaryColorBase,
                width: 2,
              );
            },
          ),
          backgroundColor: WidgetStateProperty.all(QTheme.colors.transparent),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.gray2;
            },
          ),
          side: WidgetStateProperty.all(
            BorderSide(
              color: QTheme.colors.gray2,
              width: 2,
            ),
          ),
          backgroundColor: WidgetStateProperty.all(QTheme.colors.transparent),
        ),
      ),
      processing: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          side: WidgetStateProperty.all(
            BorderSide(
              color: QTheme.colors.primaryColorBase,
              width: 2,
            ),
          ),
          backgroundColor: WidgetStateProperty.all(QTheme.colors.transparent),
        ),
      ),
    );
  }

  /// Usado para botões De borda [outlined] com cor [gray1]
  static QButtonStyles get secondaryGray1Style {
    return QButtonStyles(
      regular: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.primaryColorDark;
              }
              return QTheme.colors.gray1;
            },
          ),
          side: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return BorderSide(
                  color: QTheme.colors.primaryColorDark,
                  width: 2,
                );
              }
              return BorderSide(
                color: QTheme.colors.gray1,
                width: 2,
              );
            },
          ),
          backgroundColor: WidgetStateProperty.all(QTheme.colors.transparent),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.gray3;
            },
          ),
          side: WidgetStateProperty.all(
            BorderSide(
              color: QTheme.colors.gray3,
              width: 2,
            ),
          ),
          backgroundColor: WidgetStateProperty.all(QTheme.colors.transparent),
        ),
      ),
      processing: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          side: WidgetStateProperty.all(
            BorderSide(
              color: QTheme.colors.gray1,
              width: 2,
            ),
          ),
          backgroundColor: WidgetStateProperty.all(QTheme.colors.transparent),
        ),
      ),
    );
  }

  /// Usado para botões com estilo secondary e cor success
  static QButtonStyles get secondarySuccessStyle {
    return QButtonStyles(
      regular: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12SuccessColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.successColorDark;
              }
              return QTheme.colors.successColorBase;
            },
          ),
          side: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return BorderSide(
                  color: QTheme.colors.successColorDark,
                  width: 2,
                );
              }
              return BorderSide(
                color: QTheme.colors.successColorBase,
                width: 2,
              );
            },
          ),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12SuccessColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
            return QTheme.colors.gray2;
          }),
          side: WidgetStateProperty.all(
            BorderSide(
              color: QTheme.colors.gray2,
              width: 2,
            ),
          ),
          backgroundColor: WidgetStateProperty.all(QTheme.colors.transparent),
        ),
      ),
      processing: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12SuccessColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          side: WidgetStateProperty.all(
            BorderSide(
              color: QTheme.colors.successColorBase,
              width: 2,
            ),
          ),
          backgroundColor: WidgetStateProperty.all(QTheme.colors.transparent),
        ),
      ),
    );
  }

  /// Usado para botões com estilo secondary e cor success
  static QButtonStyles get secondaryErrorStyle {
    return QButtonStyles(
      regular: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12ErrorColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.errorColorDark;
              }
              return QTheme.colors.errorColorBase;
            },
          ),
          side: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return BorderSide(
                  color: QTheme.colors.errorColorDark,
                  width: 2,
                );
              }
              return BorderSide(
                color: QTheme.colors.errorColorBase,
                width: 2,
              );
            },
          ),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12ErrorColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.gray2;
            },
          ),
          side: WidgetStateProperty.all(
            BorderSide(
              color: QTheme.colors.gray2,
              width: 2,
            ),
          ),
          backgroundColor: WidgetStateProperty.all(QTheme.colors.transparent),
        ),
      ),
      processing: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12ErrorColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          side: WidgetStateProperty.all(
            BorderSide(
              color: QTheme.colors.errorColorBase,
              width: 2,
            ),
          ),
          backgroundColor: WidgetStateProperty.all(QTheme.colors.transparent),
        ),
      ),
    );
  }

  /// Usado para botões com estilo [terciario] e cor [primaryBase]
  static QButtonStyles get tertiaryPrimaryBaseStyle {
    return QButtonStyles(
      regular: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.primaryColorDark;
              }
              return QTheme.colors.primaryColorBase;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.gray3;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      processing: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.primaryColorDark;
              }
              return QTheme.colors.primaryColorBase;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
    );
  }

  /// Usado para botões com estilo [terciario] e cor [Ciano]
  static QButtonStyles get tertiaryCianoStyle {
    return QButtonStyles(
      regular: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.primaryColorDark;
              }
              return QTheme.colors.ciano;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.gray3;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      processing: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.primaryColorDark;
              }
              return QTheme.colors.ciano;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
    );
  }

  /// Usado para botões com estilo [terciario] e cor [gray9]
  static QButtonStyles get tertiaryGray9Style {
    return QButtonStyles(
      regular: QButtonStyle(
        labelStyle: LabelStyleSet.bodyRoboto16Gray9Regular,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.gray8;
              }
              return QTheme.colors.gray9;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.gray3;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      processing: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.primaryColorDark;
              }
              return QTheme.colors.primaryColorBase;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
    );
  }

  /// Usado para [IconButton] na cor [primary]
  static QButtonStyles get withIconPrimaryBaseStyle {
    return QButtonStyles(
      regular: QButtonStyle(
        iconStyleSet: IconStyleSet.size24PrimaryBase,
        pressedIconStyleSet: IconStyleSet.size24PrimaryBaseDark,
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.primaryColorDark;
              }
              return QTheme.colors.primaryColorBase;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        iconStyleSet: IconStyleSet.size24Gray3,
        pressedIconStyleSet: IconStyleSet.size24PrimaryBaseDark,
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.gray3;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      processing: QButtonStyle(
        iconStyleSet: IconStyleSet.size24PrimaryBase,
        pressedIconStyleSet: IconStyleSet.size24PrimaryBaseDark,
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.primaryColorDark;
              }
              return QTheme.colors.primaryColorBase;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
    );
  }

  /// Usado para [IconButton] na cor [white]
  static QButtonStyles get withIconWhiteStyle {
    return QButtonStyles(
      regular: QButtonStyle(
        iconStyleSet: IconStyleSet.size24White,
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.white;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        iconStyleSet: IconStyleSet.size24Gray3,
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.gray3;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      processing: QButtonStyle(
        iconStyleSet: IconStyleSet.size24White,
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.white;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
    );
  }

  /// Usado para [IconButton] na cor [gray5]
  static QButtonStyles get withIconGray7Style {
    return QButtonStyles(
      regular: QButtonStyle(
        iconStyleSet: IconStyleSet.size24Gray7,
        pressedIconStyleSet: IconStyleSet.size24PrimaryBaseDark,
        labelStyle: LabelStyleSet.paragraphRoboto14Medium,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.primaryColorDark;
              }
              return QTheme.colors.gray7;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        iconStyleSet: IconStyleSet.size24Gray3,
        labelStyle: LabelStyleSet.paragraphRoboto14Medium,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.gray3;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      processing: QButtonStyle(
        iconStyleSet: IconStyleSet.size24White,
        labelStyle: LabelStyleSet.paragraphRoboto14Medium,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.white;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
    );
  }

  /// Usado para [IconButton] na cor [primary] e icon na cor [secondary]
  static QButtonStyles get withIconPrimaryBaseAndSecondaryBaseStyle {
    return QButtonStyles(
      regular: QButtonStyle(
        iconStyleSet: IconStyleSet.size24SecondaryBase,
        pressedIconStyleSet: IconStyleSet.size24SecondaryBase,
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.primaryColorDark;
              }
              return QTheme.colors.primaryColorBase;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        iconStyleSet: IconStyleSet.size24Gray3,
        pressedIconStyleSet: IconStyleSet.size24Gray3,
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.gray3;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      processing: QButtonStyle(
        iconStyleSet: IconStyleSet.size24SecondaryBase,
        pressedIconStyleSet: IconStyleSet.size24SecondaryBase,
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.primaryColorDark;
              }
              return QTheme.colors.primaryColorBase;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
    );
  }

  /// Usado para [FilterButton] na cor [gray1], texto [gray5] e icon na cor [black]
  static QButtonStyles get filterStyle {
    return QButtonStyles(
      regular: QButtonStyle(
        iconStyleSet: IconStyleSet.size16Gray5,
        pressedIconStyleSet: IconStyleSet.size16Gray5,
        labelStyle: LabelStyleSet.captionRoboto12Gray5Regular,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          minimumSize: WidgetStateProperty.all(const Size(QSizes.x100, QSizes.x32)),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(QSizes.x4),
            ),
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.gray1;
              }
              return QTheme.colors.gray1;
            },
          ),
          overlayColor: WidgetStateProperty.all(QTheme.colors.gray1),
          backgroundColor: WidgetStateProperty.all(QTheme.colors.gray1),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        iconStyleSet: IconStyleSet.size24Gray3,
        pressedIconStyleSet: IconStyleSet.size24Gray3,
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.gray3;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      processing: QButtonStyle(
        iconStyleSet: IconStyleSet.size24SecondaryBase,
        pressedIconStyleSet: IconStyleSet.size24SecondaryBase,
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.primaryColorDark;
              }
              return QTheme.colors.primaryColorBase;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
    );
  }

  /// Usado para [IconButton] na cor [gray5]
  static QButtonStyles get cashback {
    return QButtonStyles(
      regular: QButtonStyle(
        iconStyleSet: IconStyleSet.size24Gray7,
        pressedIconStyleSet: IconStyleSet.size24PrimaryBaseDark,
        labelStyle: LabelStyleSet.captionRoboto12PrimaryBold,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.secondaryColorBase;
              }
              return QTheme.colors.gray7;
            },
          ),
          overlayColor: WidgetStateProperty.all(QTheme.colors.secondaryColorBase),
          backgroundColor: WidgetStateProperty.all(QTheme.colors.secondaryColorBase),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        iconStyleSet: IconStyleSet.size24Gray3,
        labelStyle: LabelStyleSet.paragraphRoboto14Medium,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.gray3;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      processing: QButtonStyle(
        iconStyleSet: IconStyleSet.size24White,
        labelStyle: LabelStyleSet.paragraphRoboto14Medium,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.white;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
    );
  }

  /// Usado para [IconButton] na cor [gray5]
  static QButtonStyles get dashedBorderStyle {
    return QButtonStyles(
      regular: QButtonStyle(
        iconStyleSet: IconStyleSet.size24Gray7,
        pressedIconStyleSet: IconStyleSet.size24PrimaryBaseDark,
        labelStyle: LabelStyleSet.captionRoboto12BlackRegular,
        circularProgressStyle: CircularProgressStyleSet.small12Gray2Style,
        border: DashedBorder.fromBorderSide(
          dashLength: QSizes.x4,
          side: BorderSide(color: QTheme.colors.primaryColorBase),
        ),
        borderRadius: BorderRadius.circular(QSizes.x8),
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.secondaryColorBase;
              }
              return QTheme.colors.gray7;
            },
          ),
          overlayColor: WidgetStateProperty.all(QTheme.colors.secondaryColorBase),
          backgroundColor: WidgetStateProperty.all(QTheme.colors.secondaryColorBase),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        iconStyleSet: IconStyleSet.size24Gray3,
        labelStyle: LabelStyleSet.paragraphRoboto14Medium,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.gray3;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      processing: QButtonStyle(
        iconStyleSet: IconStyleSet.size24White,
        labelStyle: LabelStyleSet.paragraphRoboto14Medium,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.white;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
    );
  }

  static QButtonStyles get whiteStyle {
    return QButtonStyles(
      regular: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return QTheme.colors.primaryColorDark;
              }
              return QTheme.colors.primaryColorBase;
            },
          ),
          backgroundColor: WidgetStateProperty.all(QTheme.colors.white),
        ),
      ),
      shared: QButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return QTheme.colors.gray2;
            },
          ),
          backgroundColor: WidgetStateProperty.all(QTheme.colors.gray3),
        ),
      ),
      processing: QButtonStyle(
        labelStyle: LabelStyleSet.paragraphRoboto16Bold,
        circularProgressStyle: CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        buttonStyle: _buttonStyle.copyWith(
          backgroundColor: WidgetStateProperty.all(QTheme.colors.white),
        ),
      ),
    );
  }
}
