part of 'bottom_navigation_component.dart';

class _CustomRoundedRectangleShape extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    //Como não tem diferenciação do outerPath retorna o próprio getOuterPath
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    const double size = QSizes.x64;
    final Rect customRect = Rect.fromCenter(
      center: rect.center,
      width: size,
      height: size,
    );

    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          customRect,
          const Radius.circular(QSizes.x8),
        ),
      );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    //Para a utilização em questão não precisa ser implelementado
  }

  @override
  ShapeBorder scale(double t) => this;
}
