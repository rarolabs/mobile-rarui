import 'package:flutter/material.dart';

import '../../../../../utils/interfaces/behaviour.dart';
import '../../../../../utils/interfaces/style.dart';
import '../../../../../utils/mixin/component.dart';
import '../../../../theme/theme_data.dart';
import '../../../atoms/atoms.dart';
import '../app_bar_style.dart';
import 'app_bar_specs.dart';

class AppBarComponent extends StatelessWidget
    with Component<QAppBarStyle, QAppBarSharedStyle>
    implements PreferredSizeWidget {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Estilo do componente
  final AppBarStyleSet styles;

  /// Titulo da AppBar
  final String title;

  /// Ação do botão voltar
  final VoidCallback? onPressedBackButton;

  /// Ações para appbar
  final List<Widget>? actions;

  /// Texto de acessibilidade
  final String? buttonSemantics;

  /// Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  // leading (arrow left / back) automatico;
  final bool automaticallyImplyLeading;

  /// Se true, o ícone de voltar será exibido
  final bool showLeadingIcon;

  const AppBarComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.title,
    this.onPressedBackButton,
    this.actions,
    this.buttonSemantics,
    this.hintSemantics,
    this.automaticallyImplyLeading = true,
    this.showLeadingIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<QAppBarStyle, QAppBarSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenRegular(
    QAppBarStyle style,
    QAppBarSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _BasicAppBar(
      style: style,
      sharedStyle: otherStyle,
      behaviour: behaviour,
      actions: actions,
      buttonSemantics: buttonSemantics,
      hintSemantics: hintSemantics,
      title: title,
      onPressedBackButton: onPressedBackButton,
      automaticallyImplyLeading: automaticallyImplyLeading,
      showLeadingIcon: showLeadingIcon,
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
        Behaviour.loading: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BasicAppBar extends StatelessWidget {
  final QAppBarStyle style;
  final QAppBarSharedStyle sharedStyle;
  final Behaviour behaviour;
  final String title;
  final List<Widget>? actions;
  final String? buttonSemantics;
  final String? hintSemantics;
  final VoidCallback? onPressedBackButton;
  final bool automaticallyImplyLeading;
  final bool showLeadingIcon;

  const _BasicAppBar({
    required this.style,
    required this.sharedStyle,
    required this.behaviour,
    required this.title,
    this.actions,
    this.buttonSemantics,
    this.hintSemantics,
    this.onPressedBackButton,
    required this.automaticallyImplyLeading,
    required this.showLeadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: buttonSemantics,
      hint: hintSemantics,
      child: AppBar(
        title: QLabel(
          behaviour: behaviour,
          text: title,
          style: sharedStyle.titleStyle,
        ),
        automaticallyImplyLeading: automaticallyImplyLeading,
        leading: showLeadingIcon
            ? QIcon(
                behaviour: behaviour,
                style: style.iconTextStyle!,
                svgPath: style.leadingBackSvgPath ?? QTheme.svgs.arrowBack,
                onPressed: () {
                  if (onPressedBackButton != null) {
                    onPressedBackButton!();
                  } else {
                    // TODO: Implement navigation pop
                  }
                },
              )
            : const SizedBox.shrink(),
        actions: actions,
        centerTitle: true,
        backgroundColor: style.backgroundColor ?? QTheme.colors.primaryColorBase,
      ),
    );
  }
}
