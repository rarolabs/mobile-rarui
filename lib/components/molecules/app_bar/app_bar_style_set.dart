part of 'app_bar/app_bar_specs.dart';

enum AppBarStyleSet {
  appBar,
  standardClose,
  accountBalanceAppBar,
  gray1CloseLeadingEmptyTitle,
  appBarGray3a70,
  gray1LogoutLeadingGray5Title;

  QAppBarStyles get specs => switch (this) {
        appBar => AppBarSpecs.appBar,
        standardClose => AppBarSpecs.standardClose,
        accountBalanceAppBar => AccountBalanceAppBarSpecs.accountBalanceAppBar,
        gray1CloseLeadingEmptyTitle => AppBarSpecs.gray1CloseLeadingEmptyTitle,
        appBarGray3a70 => AppBarSpecs.appBarGray3a70,
        gray1LogoutLeadingGray5Title => AppBarSpecs.gray1LogoutLeadingGray5TitleStyle,
      };
}
