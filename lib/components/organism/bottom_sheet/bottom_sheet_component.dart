import 'package:flutter/material.dart';

import '../../../theme/sizes.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../../atoms/label/label.dart';
import '../../molecules/molecules.dart';
import 'bottom_sheet_specs.dart';
import 'bottom_sheet_style.dart';

class BottomSheetComponent extends StatelessWidget with Component<BottomSheetStyle, BottomSheetSharedStyle> {
  /// Status do behavior
  final Behaviour behaviour;

  /// Estilo do componente
  final BottomSheetSet styles;

  /// Texto exibido no título
  final String? title;

  /// Alinhamento do título
  final TextAlign titleAlign;

  /// Conteúdo é dinamico
  final List<Widget> content;

  /// Botão padrão que é exibido após o conteúdo
  final QButton? primaryButton;

  /// Botão opcional para segunda ação
  final QButton? secondaryButton;

  final BottomSheetSet? bottomSheetSet;

  const BottomSheetComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    this.title,
    this.titleAlign = TextAlign.start,
    required this.content,
    this.primaryButton,
    this.secondaryButton,
    this.bottomSheetSet,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<BottomSheetStyle, BottomSheetSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenRegular(
    BottomSheetStyle style,
    BottomSheetSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _QBottomSheetWidget(
        style: style,
        behaviour: behaviour,
        title: title,
        titleAlign: titleAlign,
        content: content,
        primaryButton: primaryButton,
        secondaryButton: secondaryButton,
      );

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.loading: Behaviour.regular,
        Behaviour.error: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };
}

class _QBottomSheetWidget extends StatelessWidget {
  const _QBottomSheetWidget({
    required this.style,
    required this.behaviour,
    this.title,
    this.titleAlign = TextAlign.start,
    required this.content,
    this.primaryButton,
    this.secondaryButton,
  });

  final BottomSheetStyle style;
  final Behaviour behaviour;
  final String? title;
  final TextAlign titleAlign;
  final List<Widget> content;
  final QButton? primaryButton;
  final QButton? secondaryButton;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(QSizes.x24)),
      color: style.backgroundColor,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // * DragHandle
            Container(
              height: QSizes.x36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: style.backgroundHandle,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(QSizes.x24)),
              ),
              child: Container(
                height: QSizes.x4,
                width: QSizes.x60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(QSizes.x16),
                  color: style.foregroundHandle,
                ),
              ),
            ),

            // * QBottomSheet
            Flexible(
              child: SingleChildScrollView(
                padding: style.paddingBottomSheet,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // * Title
                    if (title != null)
                      Padding(
                        padding: style.titlePadding,
                        child: QLabel.h5Lato20Gray5Bold(
                          behaviour: behaviour,
                          text: title,
                          textAlign: titleAlign,
                        ),
                      ),

                    // * Custom Content
                    ...content,

                    // * Primary Button
                    if (primaryButton != null) Padding(padding: style.primaryButtonPadding, child: primaryButton),

                    // * Secondary Button
                    if (secondaryButton != null)
                      Padding(padding: style.secondaryButtonPadding, child: secondaryButton!),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
