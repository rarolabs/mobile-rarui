import 'package:flutter/material.dart';

import '../../../theme/sizes.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../../atoms/atoms.dart';
import 'toast_specs.dart';
import 'toast_style.dart';

class ToastComponent extends StatelessWidget with Component<ToastStyle, ToastSharedStyle> {
  /// Status do behavior
  final Behaviour behaviour;

  /// Estilo do componente
  final ToastStyleSet styles;

  /// Texto exibido no título
  final String title;

  // Trailing icon
  final String? pathTrailingIcon;

  const ToastComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.title,
    this.pathTrailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<ToastStyle, ToastSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenRegular(
    ToastStyle style,
    ToastSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _QToastWidget(
        style: style,
        sharedStyle: otherStyle,
        behaviour: behaviour,
        title: title,
        pathTrailingIcon: pathTrailingIcon,
      );

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.loading: Behaviour.regular,
        Behaviour.error: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };
}

class _QToastWidget extends StatelessWidget {
  const _QToastWidget({
    required this.style,
    required this.sharedStyle,
    required this.behaviour,
    this.title,
    this.pathTrailingIcon,
  });

  final ToastStyle style;
  final ToastSharedStyle sharedStyle;
  final Behaviour behaviour;
  final String? title;
  final String? pathTrailingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: QSizes.x48,
      width: MediaQuery.sizeOf(context).width * 0.91,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(QSizes.x12),
      ),
      child: Padding(
        padding: style.padding ?? EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            QLabel(
              style: sharedStyle.titleStyle,
              behaviour: behaviour,
              text: title,
            ),
            if (pathTrailingIcon != null)
              QIcon(
                behaviour: behaviour,
                style: sharedStyle.iconStyleSet,
                svgPath: pathTrailingIcon!,
              ),
          ],
        ),
      ),
    );
  }
}
