import 'calendar_specs.dart';

class QCalendar extends CalendarSpecs {
  /// Style configuration for [QCalendar]
  final CalendarStyleSet style;

  const QCalendar({
    super.key,
    required this.style,
    required super.behaviour,
    super.locale,
    super.firstDate,
    super.currentDate,
    super.lastDate,
    super.onSelectedDate,
    super.labelSemantics,
    super.hintSemantics,
  }) : super(styles: style);

  /// Calendário padrão
  const QCalendar.standard({
    super.key,
    required super.behaviour,
    super.locale,
    super.firstDate,
    super.currentDate,
    super.lastDate,
    super.onSelectedDate,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = CalendarStyleSet.standard,
        super(styles: CalendarStyleSet.standard);

  /// Calendário padrão
  const QCalendar.standardDisabledWeekends({
    super.key,
    required super.behaviour,
    super.locale,
    super.firstDate,
    super.currentDate,
    super.lastDate,
    super.onSelectedDate,
    super.lastDateCanBeSelected,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = CalendarStyleSet.standard,
        super(
          styles: CalendarStyleSet.standard,
          disabledWeekends: true,
        );
}
