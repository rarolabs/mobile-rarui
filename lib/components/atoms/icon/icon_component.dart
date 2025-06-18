import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import '../../../utils/extensions/string_extension.dart';
import 'icon_specs.dart';
import 'icon_style.dart';

class IconComponent extends StatelessWidget with Component<IconStyle, IconSharedStyle> {
  /// Comportamento do componente
  final Behaviour behaviour;

  /// Estilo do componente
  final IconStyleSet styles;

  /// Caminho do Icone
  final String svgPath;

  /// Callback caso o icon tenha função
  final VoidCallback? onPressed;

  /// Texto de acessibilidade
  final String? labelSemantics;

  /// Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  /// Define se o ícone é a partir de base64
  final bool isBase64;

  const IconComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.svgPath,
    this.onPressed,
    this.labelSemantics,
    this.hintSemantics,
    this.isBase64 = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<IconStyle, IconSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    IconStyle style,
    IconSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    IconStyle style,
    IconSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: _BasicIcon(
        svgPath: svgPath,
        onPressed: onPressed,
        size: style.size,
        iconColor: style.iconColor,
        isBase64: isBase64,
      ),
    );
  }

  @override
  Widget whenDisabled(
    IconStyle style,
    IconSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: _BasicIcon(
        svgPath: svgPath,
        size: style.size,
        iconColor: style.iconColor,
        isBase64: isBase64,
      ),
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.disabled,
      };
}

class _BasicIcon extends StatelessWidget {
  const _BasicIcon({
    required this.svgPath,
    this.onPressed,
    required this.size,
    required this.iconColor,
    required this.isBase64,
  });

  final String svgPath;

  final VoidCallback? onPressed;

  final double size;

  final Color iconColor;

  final bool isBase64;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        icon: isBase64
            ? SvgPicture.string(
                svgPath.fromBase64,
                height: size,
                width: size,
                colorFilter: ColorFilter.mode(
                  iconColor,
                  BlendMode.srcIn,
                ),
              )
            : SvgPicture.asset(
                svgPath,
                height: size,
                width: size,
                colorFilter: ColorFilter.mode(
                  iconColor,
                  BlendMode.srcIn,
                ),
              ),
      ),
    );
  }
}
