import 'package:clean_calendar/clean_calendar.dart';
import 'package:flutter/material.dart';

import '../../../shared_widget/loading_widget.dart';
import '../../../theme/sizes.dart';
import '../../../theme/tokens.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import 'calendar_specs.dart';
import 'calendar_style.dart';

class CalendarComponent extends StatelessWidget with Component<CalendarStyle, CalendarSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Estilo do componente
  final CalendarStyleSet styles;

  /// Define idioma do calendário, valor padrão Locale('pt','BR')
  final Locale? locale;

  /// Define a primeira data permitida
  final DateTime? firstDate;

  /// Controla a data selecionada
  final DateTime? currentDate;

  /// Define a ultima data permitida
  final DateTime? lastDate;

  /// Retorna a data selecionada
  final void Function(DateTime?)? onSelectedDate;

  /// Ultima data que pode ser selecionada
  final DateTime? lastDateCanBeSelected;

  /// Texto de acessibilidade
  final String? labelSemantics;

  /// Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  /// Desabilita os finais de semana
  final bool disabledWeekends;

  const CalendarComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    this.locale,
    this.firstDate,
    this.currentDate,
    this.lastDate,
    this.onSelectedDate,
    this.labelSemantics,
    this.hintSemantics,
    this.disabledWeekends = false,
    this.lastDateCanBeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<CalendarStyle, CalendarSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    CalendarStyle style,
    CalendarSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      LoadingWidget(style: otherStyle.loadingStyle);

  @override
  Widget whenRegular(
    CalendarStyle style,
    CalendarSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _CalendarWidget(
        style: style,
        locale: locale,
        firstDate: firstDate,
        currentDate: currentDate,
        lastDate: lastDate,
        onSelectedDate: onSelectedDate,
        lastDateCanBeSelected: lastDateCanBeSelected,
        hintSemantics: hintSemantics,
        labelSemantics: labelSemantics,
        disabledWeekends: disabledWeekends,
      );

  @override
  Widget whenDisabled(
    CalendarStyle style,
    CalendarSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      AbsorbPointer(
        absorbing: true,
        child: _CalendarWidget(
          style: style,
          locale: locale,
          firstDate: firstDate,
          currentDate: currentDate,
          lastDate: lastDate,
          onSelectedDate: onSelectedDate,
          hintSemantics: hintSemantics,
          labelSemantics: labelSemantics,
          disabledWeekends: disabledWeekends,
          lastDateCanBeSelected: lastDateCanBeSelected,
        ),
      );

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.disabled,
      };
}

class _CalendarWidget extends StatefulWidget {
  final CalendarStyle style;
  final Locale? locale;
  final DateTime? firstDate;
  final DateTime? currentDate;
  final DateTime? lastDate;
  final DateTime? lastDateCanBeSelected;
  final void Function(DateTime?)? onSelectedDate;
  final String? labelSemantics;
  final String? hintSemantics;
  final bool disabledWeekends;

  const _CalendarWidget({
    required this.style,
    this.locale,
    this.firstDate,
    this.currentDate,
    this.lastDate,
    this.onSelectedDate,
    this.lastDateCanBeSelected,
    this.labelSemantics,
    this.hintSemantics,
    this.disabledWeekends = false,
  });

  @override
  State<_CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<_CalendarWidget> {
  late DateTime _firstDate;
  late DateTime? _currentDate;
  late DateTime _currentMonth;
  late DateTime _lastDate;

  @override
  void initState() {
    _firstDate = widget.firstDate ?? DateTime(1900);
    _currentDate = widget.currentDate;
    _currentMonth = _currentDate ?? DateTime.now();
    _lastDate = widget.lastDate ?? DateTime(2999);
    super.initState();
  }

  /// Valida se o mês e ano que está sendo exibido é menor que a data inicial
  bool get isBeforeFirstDate {
    if (_currentMonth.year < _firstDate.year) return true;
    if (_currentMonth.month <= _firstDate.month && _currentMonth.year == _firstDate.year) return true;
    return false;
  }

  /// Valida se o mês e ano que está sendo exibido é maior que a data final
  bool get isAfterLastDate {
    if (_currentMonth.year > _lastDate.year) return true;
    if (_currentMonth.month >= _lastDate.month && _currentMonth.year == _lastDate.year) return true;
    return false;
  }

  /// Retorna o símbols de mês pelo idioma informado
  /// Caso idioma seja diferente de português o valor padrão é inglês
  Months? get _getSymbolMonthByLocale {
    if (widget.locale == null || widget.locale == const Locale('pt', 'BR')) {
      return const Months(
        january: 'Janeiro',
        february: 'Fevereiro',
        march: 'Março',
        april: 'Abril',
        may: 'Maio',
        june: 'Junho',
        july: 'Julho',
        august: 'Agosto',
        september: 'Setembro',
        october: 'Outubro',
        november: 'Novembro',
        december: 'Dezembro',
      );
    }

    return null;
  }

  /// Retorna o símbols do dia da semana pelo idioma informado
  Weekdays? get _getSymbolWeekdaysByLocale {
    if (widget.locale == null || widget.locale == const Locale('pt', 'BR')) {
      return const Weekdays(
        monday: 'S',
        tuesday: 'T',
        wednesday: 'Q',
        thursday: 'Q',
        friday: 'S',
        saturday: 'S',
        sunday: 'D',
      );
    }

    return const Weekdays(
      monday: 'M',
      tuesday: 'T',
      wednesday: 'W',
      thursday: 'T',
      friday: 'F',
      saturday: 'S',
      sunday: 'S',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.labelSemantics,
      hint: widget.hintSemantics,
      child: CleanCalendar(
        // * Parametros
        startDateOfCalendar: _firstDate,
        initialViewMonthDateTime: _currentDate ?? _currentMonth,
        currentDateOfCalendar: _currentDate,
        endDateOfCalendar: _lastDate,

        // * Configura a exibição das datas do mês anterior e posterior
        leadingTrailingDatesProperties: DatesProperties(
          hide: true,
          disable: true,
        ),

        // * Configura o texto exibido no campo mês
        monthsSymbol: _getSymbolMonthByLocale,

        // * Configura o design dos icones
        headerProperties: HeaderProperties(
          monthYearDecoration: MonthYearDecoration(monthYearTextStyle: widget.style.monthStyle),
          navigatorDecoration: NavigatorDecoration(
            // ! Não é possível usar um QIcon, pois o plugin exige um Icon
            navigateLeftButtonIcon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: isBeforeFirstDate ? widget.style.iconDisableColor : widget.style.iconActiveColor,
              size: QSizes.x20,
            ),
            navigateRightButtonIcon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: isAfterLastDate ? widget.style.iconDisableColor : widget.style.iconActiveColor,
              size: QSizes.x20,
            ),
            navigatorResetButtonIcon: Icon(
              Icons.calendar_today,
              color: QTheme.colors.transparent, // está ocultando este botão
              size: QSizes.x20,
            ),
          ),
        ),

        // * Configura a tipografia dos dias da semana
        weekdaysProperties: WeekdaysProperties(
          generalWeekdaysDecoration: WeekdaysDecoration(
            weekdayTextStyle: widget.style.dayOfWeekStyle,
          ),
        ),

        // * Controla o texto exibido nos dias da semana
        weekdaysSymbol: _getSymbolWeekdaysByLocale,
        calendarDatesSectionMaxHeight: QSizes.x228, //230,

        // * Configura o design do dia selecionado
        currentDateProperties: DatesProperties(
          datesDecoration: DatesDecoration(
            datesBackgroundColor: widget.style.selectedColor,
            datesBorderColor: widget.style.selectedColor,
            datesTextColor: widget.style.textSelectedColor,
            datesBorderRadius: QSizes.x200,
            datesTextStyle: widget.style.dateStyle,
          ),
        ),
        datePickerCalendarView: DatePickerCalendarView.monthView,
        dateSelectionMode: DatePickerSelectionMode.singleOrMultiple,
        enableDenseSplashForDates: true,
        enableDenseViewForDates: true,

        // * Dates Configs
        startWeekday: WeekDay.sunday,
        generalDatesProperties: DatesProperties(
          disableWeekends: widget.disabledWeekends,
          firstSelectableDate: _firstDate,
          lastDateCanBeSelected: widget.lastDateCanBeSelected,
          datesDecoration: DatesDecoration(
            datesBackgroundColor: widget.style.backgroundColor,
            datesBorderColor: widget.style.borderColor,
            datesTextStyle: widget.style.dateStyle,
            disabledColor: widget.style.disabledColor,
          ),
        ),

        // * Callback quando clica nos icones
        onCalendarViewDate: (value) {
          final bool isChanged = (value.year == _firstDate.year && value.month == _firstDate.month + 1) ||
              (value.year == _lastDate.year && value.month == _lastDate.month - 1) ||
              (value.year == _firstDate.year && value.month == _firstDate.month) ||
              (value.year == _lastDate.year && value.month == _lastDate.month);

          _currentMonth = value;

          /// Deve fazer o setState somente nesta regra do  [isChanged]
          /// para deixar mais fluido o scroll do componente
          Future.delayed(Durations.short4, () => isChanged ? setState(() {}) : null);
        },

        // * Callback quando seleciona a data
        onSelectedDates: (dates) {
          if (dates.isNotEmpty) {
            _currentDate = dates.first;
          } else {
            _currentDate = null;
          }
          setState(() {});

          Future.delayed(
            Durations.short3,
            () => widget.onSelectedDate?.call(dates.isNotEmpty ? dates.first : null),
          );
        },
      ),
    );
  }
}
