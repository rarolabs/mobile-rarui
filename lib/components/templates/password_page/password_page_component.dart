import 'package:flutter/material.dart';

import '../../../shared_widget/loading_widget.dart';
import '../../../theme/sizes.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';
import 'password_page_specs.dart';
import 'password_page_style.dart';

class PasswordPageComponent extends StatelessWidget with Component<PasswordPageStyle, PasswordPageSharedStyle> {
  /// Estilo da tela
  final PasswordPageStyleSet styles;

  // ----------------------------- PinInput -----------------------------
  ///Behaviour do PinInput, caso não seja informado será [regular]
  final Behaviour pinInputBehaviour;

  /// Controller do PinInput
  final TextEditingController pinInputController;

  /// Callback quando a PinInput é preenchido
  final void Function(String)? pinInputOnCompleted;

  /// Se o texto do PinInput será obscuro, caso não seja informado será [false]
  final bool pinInputObscureText;

  /// Se verdadeiro abre o teclado automaticamente com foco no primeiro campo
  final bool autofocus;

  // ----------------------------- AppBar -----------------------------
  /// Título da appBar
  final String? appBarTitle;

  /// onPressed do botão de voltar
  final VoidCallback? backButtonOnPressed;

  // --------- Labels ---------
  /// Título do texto da tela
  final String? title;

  /// Texto do body da tela
  final String? body;

  // ----------------------------- TertiaryButton -----------------------------
  /// Label do TertiaryButton
  final String? tertiaryButtonLabel;

  /// onPressed do TertiaryButton
  final VoidCallback? tertiaryButtonOnPressed;

  ///Behaviour do TertiaryButton, caso não seja informado será [regular]
  final Behaviour tertiaryButtonBehaviour;

  //----------------------------- PrimaryButton -----------------------------
  /// Label do PrimaryButton
  final String? primaryButtonLabel;

  /// onPressed do PrimaryButton
  final VoidCallback? primaryButtonOnPressed;

  ///Behaviour do PrimaryButton, caso não seja informado será [regular]
  final Behaviour primaryButtonBehaviour;

  //----------------------------- SecondaryButton -----------------------------
  /// Label do SecondaryButton
  final String? secondaryButtonLabel;

  /// onPressed do SecondaryButton
  final VoidCallback? secondaryButtonOnPressed;

  ///Behaviour do SecondaryButton, caso não seja informado será [regular]
  final Behaviour secondaryButtonBehaviour;

  const PasswordPageComponent({
    required this.styles,
    this.pinInputBehaviour = Behaviour.regular,
    required this.pinInputController,
    this.pinInputOnCompleted,
    this.pinInputObscureText = false,
    this.appBarTitle,
    this.backButtonOnPressed,
    this.title,
    this.body,
    this.tertiaryButtonLabel,
    this.tertiaryButtonOnPressed,
    this.tertiaryButtonBehaviour = Behaviour.regular,
    this.primaryButtonLabel,
    this.primaryButtonOnPressed,
    this.primaryButtonBehaviour = Behaviour.regular,
    this.secondaryButtonLabel,
    this.secondaryButtonOnPressed,
    this.secondaryButtonBehaviour = Behaviour.regular,
    this.autofocus = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<PasswordPageStyle, PasswordPageSharedStyle>(
      regular: styles.specs.regular,
      shared: styles.specs.shared,
    );
    return render(context, pinInputBehaviour, style);
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };

  @override
  Widget whenLoading(
    PasswordPageStyle style,
    PasswordPageSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          LoadingWidget(style: otherStyle.textLoadingStyle),
          const SizedBox(height: QSizes.x24),
          LoadingWidget(
            style: otherStyle.textLoadingStyle.copyWith(
              size: const Size(double.infinity, QSizes.x144),
            ),
          ),
          const SizedBox(height: QSizes.x24),
          LoadingWidget(
            style: otherStyle.textLoadingStyle.copyWith(
              size: const Size(double.infinity, QSizes.x144),
            ),
          ),
          const SizedBox(height: QSizes.x24),
          LoadingWidget(
            style: otherStyle.textLoadingStyle.copyWith(
              size: const Size(double.infinity, QSizes.x96),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget whenRegular(
    PasswordPageStyle style,
    PasswordPageSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _PasswordPage(
        style: style,
        otherStyle: otherStyle,
        pinInputBehaviour: pinInputBehaviour,
        pinInputController: pinInputController,
        pinInputOnCompleted: pinInputOnCompleted,
        pinInputObscureText: pinInputObscureText,
        appBarTitle: appBarTitle,
        backButtonOnPressed: backButtonOnPressed,
        title: title,
        body: body,
        tertiaryButtonLabel: tertiaryButtonLabel,
        tertiaryButtonOnPressed: tertiaryButtonOnPressed,
        tertiaryButtonBehaviour: tertiaryButtonBehaviour,
        primaryButtonLabel: primaryButtonLabel,
        primaryButtonOnPressed: primaryButtonOnPressed,
        primaryButtonBehaviour: primaryButtonBehaviour,
        secondaryButtonLabel: secondaryButtonLabel,
        secondaryButtonOnPressed: secondaryButtonOnPressed,
        secondaryButtonBehaviour: secondaryButtonBehaviour,
        autofocus: autofocus,
        key: key,
      );
}

class _PasswordPage extends StatelessWidget {
  final PasswordPageStyle style;
  final PasswordPageSharedStyle otherStyle;

  // ----------------------------- PinInput -----------------------------
  final Behaviour pinInputBehaviour;
  final TextEditingController pinInputController;
  final void Function(String)? pinInputOnCompleted;
  final bool pinInputObscureText;
  final bool autofocus;

  // ----------------------------- AppBar -----------------------------
  final String? appBarTitle;
  final VoidCallback? backButtonOnPressed;

  // --------- Labels ---------
  final String? title;
  final String? body;

  // ----------------------------- TertiaryButton -----------------------------
  final String? tertiaryButtonLabel;
  final VoidCallback? tertiaryButtonOnPressed;
  final Behaviour tertiaryButtonBehaviour;

  //----------------------------- PrimaryButton -----------------------------
  final String? primaryButtonLabel;
  final VoidCallback? primaryButtonOnPressed;
  final Behaviour primaryButtonBehaviour;

  //----------------------------- SecondaryButton -----------------------------
  final String? secondaryButtonLabel;
  final VoidCallback? secondaryButtonOnPressed;
  final Behaviour secondaryButtonBehaviour;

  const _PasswordPage({
    required this.style,
    required this.otherStyle,
    required this.pinInputBehaviour,
    required this.pinInputController,
    this.pinInputOnCompleted,
    required this.pinInputObscureText,
    this.appBarTitle,
    this.backButtonOnPressed,
    this.title,
    this.body,
    this.tertiaryButtonLabel,
    this.tertiaryButtonOnPressed,
    required this.tertiaryButtonBehaviour,
    this.primaryButtonLabel,
    this.primaryButtonOnPressed,
    required this.primaryButtonBehaviour,
    this.secondaryButtonLabel,
    this.secondaryButtonOnPressed,
    required this.secondaryButtonBehaviour,
    required this.autofocus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: appBarTitle == null
          ? null
          : QAppBar.standard(
              behaviour: Behaviour.regular,
              title: appBarTitle!,
              onPressedBackButton: backButtonOnPressed,
            ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: QSizes.x16),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: size.height * 0.81),
            child: Column(
              crossAxisAlignment: style.crossAxisAlignment ?? CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Padding(
                    padding: EdgeInsets.only(top: size.height * .03),
                    child: QLabel(
                      style: otherStyle.titleStyle,
                      behaviour: Behaviour.regular,
                      text: title,
                      textAlign: otherStyle.titleTextAlign,
                    ),
                  ),
                if (body != null)
                  Padding(
                    padding: EdgeInsets.only(top: size.height * .015),
                    child: QLabel(
                      style: otherStyle.bodyStyle,
                      behaviour: Behaviour.regular,
                      text: body,
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * .065),
                  child: QPinInput(
                    autofocus: autofocus,
                    style: otherStyle.pinInputStyle,
                    behaviour: pinInputBehaviour,
                    length: otherStyle.pinInputLength,
                    onCompleted: pinInputOnCompleted,
                    textEditingController: pinInputController,
                    obscureText: pinInputObscureText,
                  ),
                ),
                if (tertiaryButtonLabel != null)
                  Padding(
                    padding: EdgeInsets.only(top: size.height * .05),
                    child: QButton(
                      style: otherStyle.tertiaryButtonStyle,
                      behaviour: tertiaryButtonBehaviour,
                      text: tertiaryButtonLabel,
                      onPressed: tertiaryButtonOnPressed,
                    ),
                  ),
                const Spacer(),
                if (primaryButtonLabel != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: QSizes.x20),
                    child: ListenableBuilder(
                      listenable: pinInputController,
                      builder: (context, _) => QButton(
                        style: otherStyle.primaryButtonStyle,
                        behaviour: pinInputController.text.length != 6 ? Behaviour.disabled : primaryButtonBehaviour,
                        text: primaryButtonLabel,
                        onPressed: primaryButtonOnPressed,
                      ),
                    ),
                  ),
                if (secondaryButtonLabel != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: QSizes.x20, vertical: QSizes.x8),
                    child: QButton(
                      style: otherStyle.secondaryButtonStyle,
                      behaviour: secondaryButtonBehaviour,
                      text: secondaryButtonLabel,
                      onPressed: secondaryButtonOnPressed,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
