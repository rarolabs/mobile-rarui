import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../../../theme/sizes.dart';
import '../../../../theme/theme_data.dart';
import '../../../atoms/icon/icon_specs.dart';
import '../../../atoms/label/label_specs.dart';
import '../account_balance_app_bar/account_balance_app_bar_specs.dart';
import '../app_bar_style.dart';
import 'app_bar_component.dart';

part '../app_bar_style_set.dart';

class AppBarSpecs extends AppBarComponent {
  const AppBarSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.title,
    super.automaticallyImplyLeading,
    super.onPressedBackButton,
    super.buttonSemantics,
    super.hintSemantics,
    super.actions,
    super.showLeadingIcon,
  });

  /// AppBar padrão do app
  static QAppBarStyles get appBar {
    return QAppBarStyles(
      regular: QAppBarStyle(
        usernameTextStyle: LabelStyleSet.h5Lato20WhiteBold,
        obscureTextStyle: LabelStyleSet.h4Lato24WhiteBold,
        textSaldoTextStyle: LabelStyleSet.paragraphRoboto16Gray1Bold,
        iconAddTextStyle: IconStyleSet.size12Gray1,
        iconTextStyle: IconStyleSet.size20White,
      ),
      shared: QAppBarSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
    );
  }

  /// AppBar gray 3 com transparencia com titulo e icones brancos
  static QAppBarStyles get appBarGray3a70 {
    return QAppBarStyles(
      regular: QAppBarStyle(
        usernameTextStyle: LabelStyleSet.h5Lato20WhiteBold,
        obscureTextStyle: LabelStyleSet.h4Lato24WhiteBold,
        textSaldoTextStyle: LabelStyleSet.paragraphRoboto16Gray1Bold,
        iconAddTextStyle: IconStyleSet.size12Gray1,
        iconTextStyle: IconStyleSet.size20White,
        backgroundColor: QTheme.colors.gray3.withValues(alpha: 0.7),
      ),
      shared: QAppBarSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
    );
  }

  // App Bar padrão com ícone de close `x`
  static QAppBarStyles get standardClose {
    return QAppBarStyles(
      regular: QAppBarStyle(
        usernameTextStyle: LabelStyleSet.h5Lato20WhiteBold,
        obscureTextStyle: LabelStyleSet.h4Lato24WhiteBold,
        textSaldoTextStyle: LabelStyleSet.paragraphRoboto16Gray1Bold,
        iconAddTextStyle: IconStyleSet.size12Gray1,
        iconTextStyle: IconStyleSet.size14White,
        leadingBackSvgPath: QTheme.svgs.close,
      ),
      shared: QAppBarSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
    );
  }

  /// App Bar de cor gray1 com botão de voltar `x` e sem título
  static QAppBarStyles get gray1CloseLeadingEmptyTitle {
    return QAppBarStyles(
      regular: QAppBarStyle(
        leadingBackSvgPath: QTheme.svgs.close,
        backgroundColor: QTheme.colors.gray1,
        iconTextStyle: IconStyleSet.size16Gray5,
      ),
      shared: QAppBarSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
    );
  }

  /// App Bar de cor gray1 com icon logout e com título gray1
  static QAppBarStyles get gray1LogoutLeadingGray5TitleStyle {
    return QAppBarStyles(
      regular: QAppBarStyle(
        leadingBackSvgPath: QTheme.svgs.logout,
        backgroundColor: QTheme.colors.gray1,
        iconTextStyle: IconStyleSet.size24PrimaryBase,
      ),
      shared: QAppBarSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
        titleStyle: LabelStyleSet.paragraphRoboto16Gray5Bold,
      ),
    );
  }
}
