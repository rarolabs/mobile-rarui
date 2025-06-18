part of 'bottom_navigation_specs.dart';

enum BottomNavigationStyleSet {
  standard(BottomNavigationSpecs.standard);

  final QBottomNavigationStyles Function() build;

  const BottomNavigationStyleSet(this.build);
}
