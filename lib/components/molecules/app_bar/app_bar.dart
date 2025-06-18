import 'package:flutter/material.dart';

import '../../../theme/sizes.dart';
import '../../../utils/enums/coin_type.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../atoms/atoms.dart';
import 'account_balance_app_bar/account_balance_app_bar_specs.dart';
import 'app_bar/app_bar_specs.dart';

part 'base_app_bar.dart';

/// Esse componente funciona diferente dos outros, quando temos variedades de componentes diferentes e não apenas estilo
/// é preciso remover o "extends ExampleSpecs" da classe abaixo e criar um BaseComponent como mostrado abaixo.
/// com isso conseguimos montar componentes diferentes com a mesma finalidade.
/// Nos construtores nomeados, são criadas instâncias das classes Specs com os devidos parametro para cada construtor.
class QAppBar extends BaseAppBar {
  final AppBarSpecs? appBarSpecs;
  final AccountBalanceAppBarSpecs? accountBalanceAppBarSpecs;

  /// Style configuration for [QAppBar]
  final AppBarStyleSet style;
  QAppBar.standard({
    super.key,
    required super.behaviour,
    required String title,
    bool automaticallyImplyLeading = true,
    VoidCallback? onPressedBackButton,
    List<Widget>? actions,
    bool showLeadingIcon = true,
  })  : appBarSpecs = AppBarSpecs(
          title: title,
          behaviour: behaviour,
          automaticallyImplyLeading: automaticallyImplyLeading,
          styles: AppBarStyleSet.appBar,
          onPressedBackButton: onPressedBackButton,
          actions: actions,
          showLeadingIcon: showLeadingIcon,
        ),
        style = AppBarStyleSet.appBar,
        accountBalanceAppBarSpecs = null;

  QAppBar.standardClose({
    super.key,
    required super.behaviour,
    required String title,
    required VoidCallback onPressedBackButton,
    List<Widget>? actions,
    bool showLeadingIcon = true,
  })  : appBarSpecs = AppBarSpecs(
          title: title,
          behaviour: behaviour,
          automaticallyImplyLeading: false,
          styles: AppBarStyleSet.standardClose,
          onPressedBackButton: onPressedBackButton,
          actions: actions,
          showLeadingIcon: showLeadingIcon,
        ),
        style = AppBarStyleSet.standardClose,
        accountBalanceAppBarSpecs = null;

  QAppBar.withIconAction({
    super.key,
    required super.behaviour,
    required String title,
    required String svgPath,
    VoidCallback? onPressedBackButton,
    VoidCallback? onActionPressed,
    bool automaticallyImplyLeading = true,
    bool showLeadingIcon = true,
  })  : appBarSpecs = AppBarSpecs(
          title: title,
          behaviour: behaviour,
          styles: AppBarStyleSet.appBar,
          automaticallyImplyLeading: automaticallyImplyLeading,
          actions: [
            IconButton(
              onPressed: onActionPressed,
              iconSize: QSizes.x20,
              icon: QIcon.size20White(
                behaviour: behaviour,
                svgPath: svgPath,
              ),
            ),
          ],
          onPressedBackButton: onPressedBackButton,
          showLeadingIcon: showLeadingIcon,
        ),
        style = AppBarStyleSet.appBar,
        accountBalanceAppBarSpecs = null;

  QAppBar.gray3a70({
    super.key,
    required super.behaviour,
    required String title,
    VoidCallback? onPressedBackButton,
    bool automaticallyImplyLeading = true,
    List<Widget>? actions,
    bool showLeadingIcon = true,
  })  : appBarSpecs = AppBarSpecs(
          title: title,
          behaviour: behaviour,
          styles: AppBarStyleSet.appBarGray3a70,
          automaticallyImplyLeading: automaticallyImplyLeading,
          onPressedBackButton: onPressedBackButton,
          actions: actions,
          showLeadingIcon: showLeadingIcon,
        ),
        style = AppBarStyleSet.appBar,
        accountBalanceAppBarSpecs = null;

  QAppBar.accountBalance({
    super.key,
    required super.behaviour,
    required ImageProvider logo,
    required String userName,
    required CoinType coinType,
    required double accountBalance,
    bool accountBalanceIsHidden = true,
    required String textButton,
    required VoidCallback buttonAccountBalanceCallback,
    List<Widget>? actions,
    String? buttonSemantics,
    String? hintSemantics,
    void Function(bool)? onChangeAccountBalanceVisibility,
    bool addBalanceVisible = false,
  })  : accountBalanceAppBarSpecs = AccountBalanceAppBarSpecs(
          behaviour: behaviour,
          logo: logo,
          userName: userName,
          coinType: coinType,
          accountBalance: accountBalance,
          accountBalanceIsHidden: accountBalanceIsHidden,
          textButton: textButton,
          buttonAccountBalanceCallback: buttonAccountBalanceCallback,
          actions: actions,
          buttonSemantics: buttonSemantics,
          hintSemantics: hintSemantics,
          styles: AppBarStyleSet.accountBalanceAppBar,
          onChangeAccountBalanceVisibility: onChangeAccountBalanceVisibility,
          addBalanceVisible: addBalanceVisible,
        ),
        style = AppBarStyleSet.accountBalanceAppBar,
        appBarSpecs = null,
        super(height: QSizes.x248);

  QAppBar.gray1CloseLeadingEmptyTitle({
    super.key,
    required super.behaviour,
    bool automaticallyImplyLeading = true,
    VoidCallback? onPressedBackButton,
    List<Widget>? actions,
  })  : appBarSpecs = AppBarSpecs(
          title: '',
          behaviour: behaviour,
          automaticallyImplyLeading: automaticallyImplyLeading,
          styles: AppBarStyleSet.gray1CloseLeadingEmptyTitle,
          onPressedBackButton: onPressedBackButton,
          actions: actions,
        ),
        style = AppBarStyleSet.gray1CloseLeadingEmptyTitle,
        accountBalanceAppBarSpecs = null;

  QAppBar.gray1LogoutLeadingGray5Title({
    super.key,
    required String title,
    required super.behaviour,
    bool automaticallyImplyLeading = true,
    VoidCallback? onPressedBackButton,
  })  : appBarSpecs = AppBarSpecs(
          title: title,
          behaviour: behaviour,
          automaticallyImplyLeading: automaticallyImplyLeading,
          styles: AppBarStyleSet.gray1LogoutLeadingGray5Title,
          onPressedBackButton: onPressedBackButton,
        ),
        style = AppBarStyleSet.gray1LogoutLeadingGray5Title,
        accountBalanceAppBarSpecs = null;

  @override
  Widget build(BuildContext context) {
    if (appBarSpecs != null) {
      return appBarSpecs!.build(context);
    } else if (accountBalanceAppBarSpecs != null) {
      return accountBalanceAppBarSpecs!.build(context);
    } else {
      throw Exception('Invalid AppBar configuration');
    }
  }
}
