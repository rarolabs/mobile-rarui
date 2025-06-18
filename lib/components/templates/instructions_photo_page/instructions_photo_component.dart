import 'package:flutter/material.dart';

import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../../atoms/label/label.dart';
import '../../molecules/molecules.dart';
import 'instructions_photo_style.dart';
import 'instructions_photo_style_set.dart';

class InstructionsPhotoComponent extends StatelessWidget
    with Component<InstructionsPhotoStyle, InstructionsPhotoSharedStyle> {
  /// Responsável por definir o comportamento do componente
  final Behaviour behaviour;

  /// Responsável por definir o estilo do componente
  final InstructionsPhotoStyleSet styles;

  /// Responsável por ação no botão de voltar
  final VoidCallback? onPressedBackButton;

  /// Label do appbar do componente
  final String appBarTitle;

  /// Label do título do componente
  final String title;

  /// Label do subtítulo do componente
  final String subtitle;

  /// Lista de TextIcons
  final List<QTextIcon> textIcons;

  /// Label do botão
  final String textButton;

  /// Ao clicar no botão
  final VoidCallback onPressedButton;

  /// Label da semântica do componente
  final String? semanticsLabel;

  /// Hint da semântica do componente
  final String? semanticsHint;

  const InstructionsPhotoComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    this.onPressedBackButton,
    required this.appBarTitle,
    required this.title,
    required this.subtitle,
    required this.textIcons,
    required this.textButton,
    required this.onPressedButton,
    this.semanticsLabel,
    this.semanticsHint,
  });

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.disabled: Behaviour.regular,
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
        Behaviour.loading: Behaviour.regular,
      };

  @override
  Widget build(BuildContext context) {
    final style = Style(shared: styles.specs.sharedStyle, regular: styles.specs.regular);

    return render(context, behaviour, style);
  }

  @override
  Widget whenRegular(
    InstructionsPhotoStyle style,
    InstructionsPhotoSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _InstructionsPhotoWidget(
        onPressedBackButton: onPressedBackButton,
        semanticsLabel: semanticsLabel,
        semanticsHint: semanticsHint,
        appBarTitle: appBarTitle,
        behaviour: behaviour,
        title: title,
        subtitle: subtitle,
        textIcons: textIcons,
        textButton: textButton,
        onPressedButton: onPressedButton,
        style: style,
      );
}

class _InstructionsPhotoWidget extends StatelessWidget {
  const _InstructionsPhotoWidget({
    required this.style,
    required this.behaviour,
    required this.onPressedBackButton,
    required this.appBarTitle,
    required this.title,
    required this.subtitle,
    required this.textIcons,
    required this.textButton,
    required this.onPressedButton,
    required this.semanticsLabel,
    required this.semanticsHint,
  });

  final Behaviour behaviour;
  final VoidCallback? onPressedBackButton;
  final String appBarTitle;
  final String title;
  final String subtitle;
  final List<QTextIcon> textIcons;
  final String? semanticsLabel;
  final String? semanticsHint;
  final InstructionsPhotoStyle style;
  final String textButton;
  final VoidCallback onPressedButton;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel,
      hint: semanticsHint,
      child: Scaffold(
        backgroundColor: QTheme.colors.white,
        appBar: QAppBar.standard(
          behaviour: behaviour,
          title: appBarTitle,
          onPressedBackButton: onPressedBackButton,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(QSizes.x16, QSizes.x32, QSizes.x16, QSizes.x16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QLabel(
                style: style.titleLabelStyle,
                behaviour: behaviour,
                text: title,
              ),
              const SizedBox(height: QSizes.x8),
              QLabel(
                style: style.subtitleLabelStyle,
                behaviour: behaviour,
                text: subtitle,
              ),
              const SizedBox(height: QSizes.x4),
              ...textIcons.map(
                (textIcon) => Padding(
                  padding: const EdgeInsets.only(top: QSizes.x24),
                  child: QTextIcon(
                    style: style.textIconStyleSet,
                    behaviour: behaviour,
                    leadingIconPath: textIcon.leadingIconPath,
                    title: textIcon.title,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(QSizes.x36, QSizes.x16, QSizes.x36, QSizes.x16),
          child: QButton(
            style: style.buttonStyle,
            behaviour: behaviour,
            text: textButton,
            onPressed: onPressedButton,
          ),
        ),
      ),
    );
  }
}
