import 'package:flutter/material.dart';
import 'package:rarUI/rarui_components/atoms/linear_progress_indicator/linear_progress_indicator_component.dart';

class RLinearProgressIndicator extends LinearProgressIndicatorComponent {
  /// Cria um componente de barra de progresso linear.
  ///
  /// [semanticsLabel] - O rótulo semântico para o componente.
  /// [semanticsValue] - O valor semântico para o componente.
  /// [valueColor] - A cor da barra de progresso.
  /// [minHeight] - A altura mínima da barra de progresso.
  /// [stopIndicatorRadius] - O raio do indicador de parada.
  /// [trackGap] - O espaçamento entre as barras de progresso.
  /// [backgroundColor] - A cor de fundo da barra de progresso.
  /// [stopIndicatorColor] - A cor do indicador de parada.
  /// [value] - O valor da barra de progresso.
  /// [color] - A cor da barra de progresso.
  /// [borderRadius] - O raio da borda da barra de progresso.
  RLinearProgressIndicator({
    super.key,
    final String? semanticsLabel,
    final String? semanticsValue,
    final Animation<Color?>? valueColor,
    final double? minHeight,
    final double? stopIndicatorRadius,
    final double? trackGap,
    final Color? backgroundColor,
    final Color? stopIndicatorColor,
    final double? value,
    final Color? color,
    final double? borderRadius,
  }) : super(
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
          valueColor: valueColor,
          minHeight: minHeight,
          stopIndicatorRadius: stopIndicatorRadius,
          trackGap: trackGap,
          backgroundColor: backgroundColor,
          stopIndicatorColor: stopIndicatorColor,
          value: value,
          color: color,
          borderRadius: borderRadius,
        );
}
