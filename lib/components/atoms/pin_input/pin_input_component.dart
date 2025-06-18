import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../../../shared_widget/loading_widget.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import 'pin_input_specs.dart';
import 'pin_input_style.dart';

class PinInputComponent extends StatelessWidget with Component<PinInputStyle, PinInputSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Estilo do componente
  final PinInputStyleSet styles;

  /// Quantidade de digitos do campo de senha, valor padrão 6 dígitos
  final int length;

  /// Auto foco no campo de senha
  final bool autofocus;

  /// Define se o texto deve ser obscurecido
  final bool obscureText;

  /// Callback quando a senha é preenchida
  final void Function(String)? onCompleted;

  // Texto de acessibilidade
  final String? textSemantics;

  // Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  // Controller do componente
  final TextEditingController? textEditingController;

  const PinInputComponent({
    super.key,
    this.length = 6,
    this.onCompleted,
    this.autofocus = false,
    this.obscureText = true,
    required this.behaviour,
    required this.styles,
    this.textSemantics,
    this.hintSemantics,
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<PinInputStyle, PinInputSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    PinInputStyle style,
    PinInputSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      LoadingWidget(style: otherStyle.loadingStyle);

  @override
  Widget whenRegular(
    PinInputStyle style,
    PinInputSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _QPinInputWidget(
        behaviour: behaviour,
        style: style,
        length: length,
        autofocus: autofocus,
        obscureText: obscureText,
        onCompleted: onCompleted,
        buttonSemantics: textSemantics,
        hintSemantics: hintSemantics,
        textEditingController: textEditingController,
      );

  @override
  Widget whenDisabled(
    PinInputStyle style,
    PinInputSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      AbsorbPointer(
        absorbing: true,
        child: _QPinInputWidget(
          behaviour: behaviour,
          style: style,
          length: length,
          autofocus: autofocus,
          obscureText: obscureText,
          onCompleted: onCompleted,
          buttonSemantics: textSemantics,
          hintSemantics: hintSemantics,
          textEditingController: textEditingController,
        ),
      );

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.disabled,
      };
}

class _QPinInputWidget extends StatelessWidget {
  final Behaviour behaviour;
  final PinInputStyle style;
  final int length;
  final bool autofocus;
  final bool obscureText;
  final void Function(String)? onCompleted;
  final String? buttonSemantics;
  final String? hintSemantics;
  final TextEditingController? textEditingController;

  const _QPinInputWidget({
    required this.behaviour,
    required this.style,
    required this.length,
    required this.autofocus,
    required this.obscureText,
    this.onCompleted,
    this.buttonSemantics,
    this.hintSemantics,
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    final PinTheme defaultPinTheme = PinTheme(
      width: QSizes.x44,
      height: QSizes.x64,
      textStyle: style.textStyle,
      decoration: BoxDecoration(
        border: Border.all(color: QTheme.colors.primaryColorBase),
        borderRadius: BorderRadius.circular(QSizes.x8),
      ),
    );

    final PinTheme submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        border: Border.all(color: QTheme.colors.gray3),
        borderRadius: BorderRadius.circular(QSizes.x8),
      ),
    );

    final PinTheme disabledPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        border: Border.all(color: QTheme.colors.gray3),
        borderRadius: BorderRadius.circular(QSizes.x8),
        color: QTheme.colors.gray2,
      ),
    );

    return Semantics(
      label: buttonSemantics,
      hint: hintSemantics,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width,
          maxHeight: QSizes.x68,
        ),
        child: Center(
          child: Pinput(
            enabled: behaviour.isRegular || behaviour.isError,
            controller: textEditingController,
            closeKeyboardWhenCompleted: true,
            length: length,
            onCompleted: behaviour.isDisabled ? null : onCompleted,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: defaultPinTheme,
            errorPinTheme: defaultPinTheme,
            followingPinTheme: behaviour.isDisabled ? disabledPinTheme : defaultPinTheme,
            submittedPinTheme: submittedPinTheme,
            disabledPinTheme: disabledPinTheme,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(length),
            ],
            obscureText: obscureText,
            autofocus: autofocus,
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            cursor: Align(
              alignment: const Alignment(0, 0.6),
              child: Container(
                color: QTheme.colors.primaryColorBase,
                height: QSizes.x4,
                width: QSizes.x24,
              ),
            ),
            obscuringWidget: CircleAvatar(
              backgroundColor: QTheme.colors.gray5,
              radius: 5,
            ),
            separatorBuilder: (_) => const SizedBox(width: QSizes.x16),
            scrollPadding: const EdgeInsets.only(bottom: QSizes.x100),
          ),
        ),
      ),
    );
  }
}
