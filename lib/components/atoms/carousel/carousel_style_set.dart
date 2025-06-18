part of 'carousel_specs.dart';

enum CarouselStyleSet {
  banners,
  categories;

  const CarouselStyleSet();

  CarouselStyles get specs {
    return switch (this) {
      banners => CarouselSpecs.bannersStyle,
      categories => CarouselSpecs.categoriesStyle,
    };
  }
}
