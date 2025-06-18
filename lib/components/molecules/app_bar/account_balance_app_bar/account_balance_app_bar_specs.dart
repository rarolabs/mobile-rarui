import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../../../theme/sizes.dart';
import '../../../../theme/theme_data.dart';
import '../../../atoms/icon/icon_specs.dart';
import '../../../atoms/label/label_specs.dart';
import '../app_bar_style.dart';
import 'account_balance_app_bar_component.dart';

class AccountBalanceAppBarSpecs extends AccountBalanceAppBarComponent {
  const AccountBalanceAppBarSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.logo,
    required super.userName,
    required super.coinType,
    required super.accountBalance,
    required super.accountBalanceIsHidden,
    required super.textButton,
    required super.buttonAccountBalanceCallback,
    super.onChangeAccountBalanceVisibility,
    required super.addBalanceVisible,
    super.actions,
    super.buttonSemantics,
    super.hintSemantics,
  });

  /// AppBar com saldo da conta
  static QAppBarStyles get accountBalanceAppBar {
    return QAppBarStyles(
      regular: QAppBarStyle(
        usernameTextStyle: LabelStyleSet.h5Lato20WhiteBold,
        obscureTextStyle: LabelStyleSet.h4Lato24WhiteBold,
        textSaldoTextStyle: LabelStyleSet.paragraphRoboto16Gray1Bold,
        iconTextStyle: IconStyleSet.size20White,
        iconAddTextStyle: IconStyleSet.size12Gray1,
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
}
