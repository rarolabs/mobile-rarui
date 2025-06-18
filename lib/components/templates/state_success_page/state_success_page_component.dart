import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/image/image.dart';
import '../../atoms/label/label.dart';
import '../../molecules/app_bar/app_bar.dart';
import '../../molecules/button/button.dart';
import 'state_success_page_specs.dart';
import 'state_success_page_style.dart';

class StateSuccessPageComponent extends StatelessWidget
    with Component<StateSuccessPageStyle, StateSuccessPageSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Estilo do componente
  final StateSuccessPageStyleSet styles;

  /// Label do componente
  final String title;

  /// Label do componente Appbar
  final String appBarTitle;

  /// Descrição do componente
  final String buttonText;

  /// Descrição do componente
  final String counterText;

  /// Ação do tap do ícone
  final VoidCallback appBarIconTap;

  /// Ação do tap do botão
  final VoidCallback onButtonPressed;

  /// Texto de acessibilidade
  final String? labelSemantics;

  /// Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  const StateSuccessPageComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.title,
    required this.buttonText,
    required this.appBarTitle,
    required this.counterText,
    required this.appBarIconTap,
    required this.onButtonPressed,
    this.labelSemantics,
    this.hintSemantics,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<StateSuccessPageStyle, StateSuccessPageSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    StateSuccessPageStyle style,
    StateSuccessPageSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      Scaffold(
        appBar: QAppBar.standard(
          behaviour: Behaviour.regular,
          title: appBarTitle,
          onPressedBackButton: null,
        ),
        body: Center(child: LoadingWidget(style: otherStyle.loadingStyle)),
      );

  @override
  Widget whenRegular(
    StateSuccessPageStyle style,
    StateSuccessPageSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    final Size size = MediaQuery.sizeOf(context);
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: Scaffold(
        appBar: QAppBar.standard(
          behaviour: Behaviour.regular,
          title: appBarTitle,
          onPressedBackButton: appBarIconTap,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: QSizes.x32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QImage.standard(
                behaviour: behaviour,
                path: QTheme.svgs.stateSuccess,
                height: size.height * .3,
                width: double.maxFinite,
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * .07, bottom: size.height * .03),
                child: QLabel(
                  style: style.titleStyle,
                  behaviour: behaviour,
                  text: title,
                  textAlign: TextAlign.center,
                ),
              ),
              QButton(
                style: style.buttonStyle,
                behaviour: behaviour,
                onPressed: onButtonPressed,
                text: buttonText,
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * .03),
                child: QLabel(
                  style: style.countingStyle,
                  behaviour: behaviour,
                  text: counterText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.disabled: Behaviour.regular,
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };
}
