import '../../../../shared_widget/loading_styles.dart';

class CarouselSharedStyle {
  final LoadingStyle loadingStyle;

  CarouselSharedStyle({
    required this.loadingStyle,
  });
}

class CarouselStyle {
  final double radius;
  final double? elevation;

  CarouselStyle({
    required this.radius,
    this.elevation,
  });
}

class CarouselStyles {
  final CarouselSharedStyle shared;
  final CarouselStyle regular;
  final CarouselStyle disabled;

  CarouselStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
