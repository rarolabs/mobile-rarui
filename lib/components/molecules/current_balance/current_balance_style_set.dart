part of 'current_balance_specs.dart';

enum CurrentBalanceStyleSet {
  regular;

  const CurrentBalanceStyleSet();

  CurrentBalanceStyles get specs {
    return switch (this) {
      regular => CurrentBalanceSpecs.regular,
    };
  }
}
