part of 'state_fail_page_specs.dart';

enum StateFailPageStyleSet {
  standard();

  StateFailPageStyles get specs {
    return switch (this) {
      standard => StateFailPageSpecs.standard,
    };
  }
}
