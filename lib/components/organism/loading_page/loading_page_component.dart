import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/atoms.dart';
import 'loading_page_specs.dart';
import 'loading_page_style.dart';

class QLoadingPageComponent extends StatelessWidget with Component<LoadingPageStyle, LoadingPageSharedStyle> {
  /// Comportamento do componente
  final Behaviour behaviour;

  /// Estilo do componente
  final LoadingPageStyleSet styles;

  /// Texto do título da loading page, caso tenha
  final String title;

  /// Texto da descricao da loading page, caso tenha
  final String description;

  /// Callback caso tenha icone fechar tela
  final VoidCallback? onPressed;

  /// Texto de acessibilidade
  final String? labelSemantics;

  /// Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  final bool showCloseButton;

  const QLoadingPageComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    this.title = '',
    this.description = '',
    this.showCloseButton = false,
    this.onPressed,
    this.labelSemantics,
    this.hintSemantics,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<LoadingPageStyle, LoadingPageSharedStyle>(
      regular: styles.specs.regular,
      shared: styles.specs.shared,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    LoadingPageStyle style,
    LoadingPageSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    LoadingPageStyle style,
    LoadingPageSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: _BasicQLoadingPage(
        behaviour: behaviour,
        title: title,
        description: description,
        onPressed: onPressed,
        style: style,
        showCloseButton: showCloseButton,
      ),
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.loading: Behaviour.regular,
        Behaviour.error: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };
}

class _BasicQLoadingPage extends StatelessWidget {
  const _BasicQLoadingPage({
    required this.behaviour,
    this.title = '',
    this.description = '',
    this.onPressed,
    required this.style,
    this.showCloseButton = false,
  });

  final Behaviour behaviour;

  final String title;

  final String description;

  final VoidCallback? onPressed;

  final LoadingPageStyle style;

  final bool showCloseButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(QSizes.x16),
        child: Column(
          children: [
            Visibility(
              visible: title.isNotEmpty,
              child: Column(
                children: [
                  const SizedBox(
                    height: QSizes.x32,
                  ),
                  Visibility(
                    visible: showCloseButton,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: QIcon(
                        behaviour: behaviour,
                        svgPath: QTheme.svgs.close,
                        onPressed: onPressed,
                        style: style.iconStyle!,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .14),
                  QLabel(
                    behaviour: behaviour,
                    text: title,
                    style: style.titleLabelStyle!,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: (title != '') ? MediaQuery.sizeOf(context).height * .15 : MediaQuery.sizeOf(context).height * .34,
            ),
            Center(child: QCircularProgress(behaviour: behaviour, style: style.circularProgressStyle)),
            if (description.isNotEmpty) ...[
              const SizedBox(height: QSizes.x44),
              Center(
                child: QLabel(
                  behaviour: behaviour,
                  text: description,
                  style: style.descriptionLabelStyle!,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
