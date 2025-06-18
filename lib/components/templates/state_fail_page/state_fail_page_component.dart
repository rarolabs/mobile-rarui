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
import 'state_fail_page_specs.dart';
import 'state_fail_page_style.dart';

class StateFailPageComponent extends StatelessWidget with Component<StateFailPageStyle, StateFailPageSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Estilo do componente
  final StateFailPageStyleSet styles;

  /// Label do componente
  final String title;

  /// Label do componente Appbar
  final String appBarTitle;

  /// Descrição na page
  final String? description;

  /// Título do botão
  final String buttonText;

  /// Ação do tap do ícone Appbar
  final VoidCallback? appBarIconTap;

  /// Ação do tap do botão
  final VoidCallback onButtonPressed;

  /// Texto de acessibilidade
  final String? labelSemantics;

  //Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  const StateFailPageComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.title,
    required this.buttonText,
    required this.appBarTitle,
    required this.onButtonPressed,
    required this.appBarIconTap,
    this.description,
    this.labelSemantics,
    this.hintSemantics,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<StateFailPageStyle, StateFailPageSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    StateFailPageStyle style,
    StateFailPageSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      Scaffold(
        appBar: QAppBar.standard(
          behaviour: Behaviour.regular,
          title: appBarTitle,
          onPressedBackButton: onButtonPressed,
        ),
        body: Center(
          child: LoadingWidget(
            style: otherStyle.loadingStyle,
          ),
        ),
      );

  @override
  Widget whenRegular(
    StateFailPageStyle style,
    StateFailPageSharedStyle otherStyle,
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
                path: QTheme.svgs.stateFail,
                height: size.height * .3,
                width: double.maxFinite,
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * .09, bottom: size.height * .05),
                child: QLabel(
                  style: style.titleStyle,
                  behaviour: behaviour,
                  text: title,
                  textAlign: TextAlign.center,
                ),
              ),
              QLabel(
                style: style.descriptionStyle,
                behaviour: behaviour,
                text: description,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * .05),
                child: QButton(
                  style: style.buttonStyle,
                  behaviour: behaviour,
                  onPressed: onButtonPressed,
                  text: buttonText,
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
