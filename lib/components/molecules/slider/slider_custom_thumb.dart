import 'package:flutter/material.dart';

import '../../../theme/sizes.dart';
import '../../../theme/tokens.dart';

/// Desenha uma gota abaixo do indicador de slide
class SliderCustomThumb extends SliderComponentShape {
  /// Define tamanho do thumb
  final double thumbSize;

  /// Define cor do indicador
  final Color indicatorColor;

  /// Define se mostrará o indicador ou não
  final bool showIndicator;

  SliderCustomThumb({
    this.thumbSize = 5,
    required this.indicatorColor,
    this.showIndicator = true,
  });

  // Espaçamento entre thumb e indicador
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size(thumbSize * 2, thumbSize * 2 + 16);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    // Desenhe o círculo principal do thumb
    final Paint thumbPaint = Paint()
      ..color = QTheme.colors.gray1
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbSize, thumbPaint);

    const double iconSize = QSizes.x20;
    final Offset iconCenter = Offset(center.dx, center.dy + thumbSize + iconSize / 2);

    final TextPainter iconPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(Icons.water_drop_rounded.codePoint),
        style: TextStyle(
          fontSize: iconSize,
          fontFamily: Icons.water_drop_rounded.fontFamily,
          color: showIndicator
              ? indicatorColor
              : activationAnimation.value > 0
                  ? QTheme.colors.secondaryColorBase.withValues(alpha: activationAnimation.value)
                  : Colors.transparent,
        ),
      ),
      textDirection: textDirection,
    )..layout();

    iconPainter.paint(canvas, Offset(iconCenter.dx - iconPainter.width / 2, iconCenter.dy - iconPainter.height / 2));

    // Cria uma máscara para aplicar cor uniforme
    final Rect iconRect = Rect.fromLTWH(
      iconCenter.dx - iconPainter.width * .2,
      iconCenter.dy - iconPainter.height * .18,
      iconPainter.width * .4,
      iconPainter.height * .5,
    );

    canvas.saveLayer(iconRect, Paint());

    iconPainter.paint(canvas, Offset(iconCenter.dx - iconPainter.width / 2, iconCenter.dy - iconPainter.height / 2));

    final Paint shaderPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          showIndicator
              ? (indicatorColor)
              : activationAnimation.value > 0
                  ? QTheme.colors.secondaryColorBase.withValues(alpha: activationAnimation.value)
                  : Colors.transparent,
          showIndicator
              ? (indicatorColor)
              : activationAnimation.value > 0
                  ? QTheme.colors.secondaryColorBase.withValues(alpha: activationAnimation.value)
                  : Colors.transparent,
        ],
      ).createShader(iconRect);

    canvas.drawRect(iconRect, shaderPaint);

    canvas.restore();
  }
}
