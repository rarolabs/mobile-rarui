import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import '../../../rarui.dart';
import 'feedback_page_specs.dart';
import 'feedback_page_style.dart';

class FeedbackPageComponent extends StatelessWidget with Component<FeedbackPageStyle, FeedbackPageSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Comportamento do primaryButton, initial [Behaviour.regular]
  final Behaviour primaryButtonBehaviour;

  /// Estilo do componente
  final FeedbackPageStyleSet styles;

  /// Título
  final String title;

  /// Descrição
  final List<String> descriptionTextList;

  /// Ação do tap do ícone de voltar
  final VoidCallback? onBackPressed;

  /// Texto do botão de confirmação
  final String? primaryButtonText;

  /// Ação do tap do botão de confirmação
  final VoidCallback? onPrimaryButtonPressed;

  /// Descrição do botão cancel
  final String? secondaryButtonText;

  /// Texto do botão cancelar
  final VoidCallback? onSecondaryButtonPressed;

  /// Texto de acessibilidade
  final String? labelSemantics;

  // Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  // Controla ação de voltar do componente
  final void Function(bool, dynamic)? onPopInvokedWithResult;

  const FeedbackPageComponent({
    super.key,
    required this.behaviour,
    this.primaryButtonBehaviour = Behaviour.regular,
    required this.styles,
    required this.title,
    this.primaryButtonText,
    this.secondaryButtonText,
    this.descriptionTextList = const [],
    required this.onBackPressed,
    required this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
    this.labelSemantics,
    this.hintSemantics,
    this.onPopInvokedWithResult,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<FeedbackPageStyle, FeedbackPageSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    FeedbackPageStyle style,
    FeedbackPageSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      PopScope(
        canPop: false,
        child: Scaffold(
          appBar: QAppBar.gray1CloseLeadingEmptyTitle(
            behaviour: Behaviour.regular,
          ),
          body: Center(child: LoadingWidget(style: otherStyle.loadingStyle)),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: _Buttons(
            style: style,
            behaviour: behaviour,
            primaryButtonBehaviour: primaryButtonBehaviour,
            onPrimaryButtonPressed: onPrimaryButtonPressed,
            primaryConfirmText: primaryButtonText,
            onSecondaryButtonPressed: onSecondaryButtonPressed,
            secondaryButtonText: secondaryButtonText,
          ),
        ),
      );

  @override
  Widget whenRegular(
    FeedbackPageStyle style,
    FeedbackPageSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      Semantics(
        label: labelSemantics,
        hint: hintSemantics,
        child: PopScope(
          canPop: onPopInvokedWithResult == null,
          onPopInvokedWithResult: onPopInvokedWithResult,
          child: Scaffold(
            appBar: onBackPressed == null
                ? null
                : QAppBar.gray1CloseLeadingEmptyTitle(
                    behaviour: behaviour,
                    onPressedBackButton: onBackPressed,
                  ),
            body: LayoutBuilder(
              builder: (context, constraints) => Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(QSizes.x28, QSizes.x32, QSizes.x28, QSizes.x40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (style.titleStyle != null)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: QSizes.x32),
                              child: QLabel(
                                style: style.titleStyle!,
                                behaviour: behaviour,
                                text: title,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: QSizes.x32),
                            child: QIcon(
                              behaviour: behaviour,
                              svgPath: style.feedbackIconPath,
                              style: style.feedbackIconStyle,
                            ),
                          ),
                          if (style.descriptionStyle != null)
                            Offstage(
                              offstage: descriptionTextList.isEmpty,
                              child: Padding(
                                padding: const EdgeInsets.only(top: QSizes.x32),
                                child: Column(
                                  crossAxisAlignment: style.descriptionCrossAxisAlignment,
                                  children: [
                                    ...descriptionTextList.map(
                                      (e) => QLabel(
                                        style: style.descriptionStyle!,
                                        behaviour: behaviour,
                                        text: e,
                                        textAlign: style.descriptionTextAlign,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  _Buttons(
                    style: style,
                    behaviour: behaviour,
                    primaryButtonBehaviour: primaryButtonBehaviour,
                    onPrimaryButtonPressed: onPrimaryButtonPressed,
                    primaryConfirmText: primaryButtonText,
                    onSecondaryButtonPressed: onSecondaryButtonPressed,
                    secondaryButtonText: secondaryButtonText,
                  ),
                  const SizedBox(height: QSizes.x48),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.disabled: Behaviour.regular,
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    required this.style,
    required this.behaviour,
    required this.primaryButtonBehaviour,
    required this.onPrimaryButtonPressed,
    required this.primaryConfirmText,
    required this.onSecondaryButtonPressed,
    this.secondaryButtonText,
  });

  final FeedbackPageStyle style;
  final Behaviour behaviour;
  final Behaviour primaryButtonBehaviour;
  final VoidCallback? onPrimaryButtonPressed;
  final String? primaryConfirmText;
  final VoidCallback? onSecondaryButtonPressed;
  final String? secondaryButtonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: QSizes.x16),
      child: Column(
        spacing: QSizes.x8,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (style.primaryButtonStyle != null)
            QButton(
              style: style.primaryButtonStyle!,
              behaviour: primaryButtonBehaviour,
              onPressed: onPrimaryButtonPressed,
              text: primaryConfirmText,
            ),
          if (style.secondaryButtonStyle != null && onSecondaryButtonPressed != null)
            QButton(
              style: style.secondaryButtonStyle!,
              behaviour: behaviour,
              onPressed: onSecondaryButtonPressed,
              text: secondaryButtonText,
            ),
        ],
      ),
    );
  }
}
