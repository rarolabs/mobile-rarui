import 'package:flutter/material.dart';

import '../../../shared_widget/loading_widget.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../../atoms/icon/icon.dart';
import '../../atoms/icon/icon_specs.dart';
import 'bottom_navigation_style.dart';

part 'custom_rounded_rectangle_shape.dart';

class BottomNavigationComponent extends StatelessWidget
    with Component<QBottomNavigationStyle, QBottomNavigationSharedStyle> {
  /// Comportamento do componente
  final Behaviour behaviour;

  /// Estilo do componente
  final QBottomNavigationStyles styles;

  ///Index da tela selecionada
  final int selectedIndex;

  /// Listagem de dos svgPaths
  final List<String>? svgPaths;

  /// Função de navegação de tela
  final Function(int)? onDestinationSelected;

  ///Estilo dos icon
  final IconStyleSet iconStyle;

  const BottomNavigationComponent({
    required this.behaviour,
    required this.styles,
    required this.selectedIndex,
    required this.iconStyle,
    this.onDestinationSelected,
    this.svgPaths,
    super.key,
  }) : assert(svgPaths == null || svgPaths.length <= 5, 'A lista de paths pode ter no máximo 5 elementos');

  @override
  Widget build(BuildContext context) {
    final style = Style<QBottomNavigationStyle, QBottomNavigationSharedStyle>(
      shared: styles.shared,
      regular: styles.regular,
      disabled: styles.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    QBottomNavigationStyle style,
    QBottomNavigationSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    QBottomNavigationStyle style,
    QBottomNavigationSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _NavigationBar(
      behaviour: behaviour,
      style: style,
      selectedIndex: selectedIndex,
      svgPaths: svgPaths,
      iconStyle: iconStyle,
      onDestinationSelected: onDestinationSelected,
    );
  }

  @override
  Widget whenDisabled(
    QBottomNavigationStyle style,
    QBottomNavigationSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _NavigationBar(
      behaviour: behaviour,
      style: style,
      selectedIndex: selectedIndex,
      svgPaths: svgPaths,
      iconStyle: iconStyle,
      onDestinationSelected: onDestinationSelected,
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };
}

class _NavigationBar extends StatefulWidget {
  final Behaviour behaviour;
  final QBottomNavigationStyle style;
  final int selectedIndex;
  final Function(int)? onDestinationSelected;
  final List<String>? svgPaths;
  final IconStyleSet iconStyle;

  const _NavigationBar({
    required this.behaviour,
    required this.style,
    required this.selectedIndex,
    this.svgPaths,
    required this.iconStyle,
    this.onDestinationSelected,
  });

  @override
  State<_NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<_NavigationBar> {
  late final List<String> listSvgPaths;

  @override
  void initState() {
    super.initState();
    if (widget.svgPaths == null) {
      listSvgPaths = [
        QTheme.svgs.cartaoCredito,
        QTheme.svgs.pagamentos,
        QTheme.svgs.home,
        QTheme.svgs.transferencia,
        QTheme.svgs.pix,
      ];
    } else {
      listSvgPaths = widget.svgPaths!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        backgroundColor: widget.style.backgroundColor,
        height: widget.style.height,
        indicatorColor: widget.style.indicatorColor,
        indicatorShape: _CustomRoundedRectangleShape(),
      ),
      child: NavigationBar(
        key: widget.key,
        selectedIndex: widget.selectedIndex,
        onDestinationSelected: widget.onDestinationSelected,
        labelBehavior: widget.style.labelBehaviour,
        overlayColor: WidgetStatePropertyAll(QTheme.colors.transparent),
        destinations: listSvgPaths
            .map(
              (d) => NavigationDestination(
                icon: QIcon(
                  style: widget.iconStyle,
                  behaviour: widget.behaviour,
                  svgPath: d,
                  key: Key(d),
                ),
                label: '',
              ),
            )
            .toList(),
      ),
    );
  }
}
