import 'package:flutter/material.dart';

import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../../atoms/label/label.dart';
import '../../molecules/app_bar/app_bar.dart';
import '../../molecules/button/button.dart';
import 'documents_photo_style.dart';
import 'documents_photo_style_set.dart';

class DocumentsPhotoComponent extends StatelessWidget with Component<DocumentsPhotoStyle, DocumentsPhotoSharedStyle> {
  /// Responsável por definir o comportamento do componente
  final Behaviour behaviour;

  /// Responsável por definir o estilo do componente
  final DocumentsPhotoStyleSet styles;

  /// Título da barra superior
  final String? appBarTitle;

  /// Título do cabeçalho
  final String headerLabel;

  /// Label do botão de cancelar
  final String cancelButtonLabel;

  /// Corpo do componente
  final Widget body;

  /// Callback do botão de voltar
  final VoidCallback? onPressedBackButton;

  /// Callback do botão de camera
  final VoidCallback onPressedCamera;

  /// Path do SVG do botão de camera
  final String svgCameraPath;

  /// Callback do botão de cancelar
  final VoidCallback onPressedCancelButton;

  /// Label da semântica do componente
  final String? semanticsLabel;

  /// Hint da semântica do componente
  final String? semanticsHint;

  const DocumentsPhotoComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.appBarTitle,
    required this.headerLabel,
    required this.cancelButtonLabel,
    required this.body,
    required this.onPressedCamera,
    required this.svgCameraPath,
    required this.onPressedCancelButton,
    this.onPressedBackButton,
    this.semanticsLabel,
    this.semanticsHint,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style(
      shared: styles.specs.sharedStyle,
      regular: styles.specs.regular,
    );

    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    DocumentsPhotoStyle style,
    DocumentsPhotoSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _BaseDocumentsPhoto(
        behaviour: behaviour,
        style: style,
        appBarTitle: appBarTitle,
        headerLabel: headerLabel,
        cancelButtonLabel: cancelButtonLabel,
        body: body,
        onPressedBackButton: onPressedBackButton,
        onPressedCamera: onPressedCamera,
        svgCameraPath: svgCameraPath,
        onPressedCancelButton: onPressedCancelButton,
        semanticsLabel: semanticsLabel,
        semanticsHint: semanticsHint,
      );

  @override
  Widget whenRegular(
    DocumentsPhotoStyle style,
    DocumentsPhotoSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _BaseDocumentsPhoto(
        behaviour: behaviour,
        style: style,
        appBarTitle: appBarTitle,
        headerLabel: headerLabel,
        cancelButtonLabel: cancelButtonLabel,
        body: body,
        onPressedBackButton: onPressedBackButton,
        onPressedCamera: onPressedCamera,
        svgCameraPath: svgCameraPath,
        onPressedCancelButton: onPressedCancelButton,
        semanticsLabel: semanticsLabel,
        semanticsHint: semanticsHint,
      );

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.disabled: Behaviour.regular,
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };
}

class _BaseDocumentsPhoto extends StatelessWidget {
  final Behaviour behaviour;
  final DocumentsPhotoStyle style;
  final String? appBarTitle;
  final String headerLabel;
  final String cancelButtonLabel;
  final String svgCameraPath;
  final String? semanticsLabel;
  final String? semanticsHint;
  final Widget body;
  final VoidCallback? onPressedBackButton;
  final VoidCallback onPressedCamera;
  final VoidCallback onPressedCancelButton;

  const _BaseDocumentsPhoto({
    required this.behaviour,
    required this.style,
    required this.appBarTitle,
    required this.headerLabel,
    required this.cancelButtonLabel,
    required this.body,
    required this.onPressedCamera,
    required this.svgCameraPath,
    required this.onPressedCancelButton,
    required this.onPressedBackButton,
    required this.semanticsLabel,
    required this.semanticsHint,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Semantics(
      label: semanticsLabel,
      hint: semanticsHint,
      child: Scaffold(
        backgroundColor: style.backgroundPageColor,
        appBar: appBarTitle == null
            ? null
            : QAppBar.standard(
                behaviour: behaviour,
                title: appBarTitle!,
                onPressedBackButton: onPressedBackButton,
              ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(QSizes.x20, size.height * .03, QSizes.x20, size.height * 0.01),
          child: Column(
            children: [
              QLabel(
                style: style.headerLabelStyle,
                behaviour: behaviour,
                text: headerLabel,
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.035),
                  child: body,
                ),
              ),
              Column(
                spacing: size.height * 0.004,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(QSizes.x100),
                    onTap: !behaviour.isLoading ? onPressedCamera : null,
                    child: Transform.scale(
                      scale: 0.9,
                      child: Container(
                        height: QSizes.x64,
                        width: QSizes.x64,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (behaviour == Behaviour.loading)
                              ? style.cameraButtonBackgroundColorLoading
                              : style.cameraButtonBackgroundColor,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: QTheme.colors.white,
                          size: QSizes.x40,
                        ),
                      ),
                    ),
                  ),
                  QButton(
                    style: style.cancelButtonStyle,
                    behaviour: behaviour,
                    text: cancelButtonLabel,
                    onPressed: onPressedCancelButton,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
