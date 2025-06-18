part of 'calendar_specs.dart';

enum CalendarStyleSet {
  standard;

  const CalendarStyleSet();

  CalendarStyles get specs {
    return switch (this) {
      standard => CalendarSpecs.standard,
    };
  }
}
