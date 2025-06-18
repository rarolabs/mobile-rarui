import 'package:intl/intl.dart';

// *
// * Datas -------------------------------------------------------------
// * São utilizatários para converter data em string e validações de data
extension DateTimeExtension on DateTime {
  /// Retorna a data no formato `dd/MM/yyyy`
  String get toDMY => DateFormat('dd/MM/yyyy').format(this);

  /// Retorna a data no formato `dd/MM/yyyy`
  String get toYearMonthDayPerHyphen => DateFormat('yyyy-MM-dd').format(this);

  /// Retorna a data no formato `yyyy_MM_dd_HH_mm_ss`
  String get toNameFile => DateFormat('yyyy_MM_dd_HH_mm_ss').format(this);

  /// Formata a data no formato `HH:mm`
  String get toHourMinute => DateFormat('HH:mm').format(this);

  /// Retorna a data no formato "ano-mes"
  ///
  /// Exemplo: "2025-03"
  String get toYearMonth => DateFormat('yyyy-MM').format(this);

  /// Retorna a data no formato "ABREVIACAO-MES ABREVIACAO-ANO"
  ///
  /// Exemplo: "DEZ 24"
  String get toMonthYearFull => DateFormat('MMM yy', 'pt_BR').format(this).toUpperCase();

  /// Retorna a data no formato "ABREVIACAO-MES"
  ///
  /// Exemplo: "JAN"
  String get toMonthFull => DateFormat('MMM', 'pt_BR').format(this).toUpperCase();
}
