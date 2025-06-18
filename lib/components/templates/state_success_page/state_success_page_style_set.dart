part of 'state_success_page_specs.dart';

enum StateSuccessPageStyleSet {
  standard();

  StateSuccessPageStyles get specs => switch (this) {
        StateSuccessPageStyleSet.standard => StateSuccessPageSpecs.standard,
      };
}
