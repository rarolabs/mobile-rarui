import '../../atoms/icon/icon_specs.dart';
import 'bottom_navigation_specs.dart';

class QBottomNavigation extends BottomNavigationSpecs {
  /// Configuração do estilo para [QBottomNavigation]
  final BottomNavigationStyleSet style;

  /// Construtor base
  const QBottomNavigation({
    required this.style,
    required super.behaviour,
    required super.styles,
    required super.selectedIndex,
    required super.svgPaths,
    required super.iconStyle,
    super.onDestinationSelected,
    super.key,
  });

  /// Utilizado para construir bottom navigation com a cor [primaryColorBase]
  /// Se a listagem do [svgPaths] não for fornecida será aplicado os destinos padrões (cartões, boletos, home, transferência e pix)
  QBottomNavigation.standard({
    required super.behaviour,
    required super.selectedIndex,
    super.onDestinationSelected,
    super.svgPaths,
    super.key,
  })  : style = BottomNavigationStyleSet.standard,
        super(
          styles: BottomNavigationStyleSet.standard.build(),
          iconStyle: IconStyleSet.size36White,
        );
}
