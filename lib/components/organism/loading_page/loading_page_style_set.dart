part of 'loading_page_specs.dart';

enum LoadingPageStyleSet {
  loading;

  const LoadingPageStyleSet();

  LoadingPageStyles get specs {
    return switch (this) {
      loading => LoadingPageSpecs.loading,
    };
  }
}
