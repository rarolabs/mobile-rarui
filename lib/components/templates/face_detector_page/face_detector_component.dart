import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../../atoms/label/label.dart';
import '../../molecules/molecules.dart';
import 'face_detector_style.dart';
import 'face_detector_style_set.dart';

class FaceDetectorComponent extends StatelessWidget with Component<FaceDetectorStyle, FaceDetectorSharedStyle> {
  /// Responsável por definir o comportamento do componente
  final Behaviour behaviour;

  /// Responsável por definir o estilo do componente
  final FaceDetectorStyleSet styles;

  /// Responsável por ação no botão de voltar
  final VoidCallback? onPressedBackButton;

  /// Responsável por definir o título da página
  final String? appBarTitle;

  /// Responsável por definir o título do cabeçalho
  final String? headerLabel;

  /// Responsável por definir o texto do botão de cancelar
  final String textButtonCancel;

  /// Responsável por ação no botão de cancelar
  final Function() onCancel;

  /// Responsável por definir a função de reconhecimento facial
  final Function() onDetectFace;

  /// Label da semântica do componente
  final String? semanticsLabel;

  /// Hint da semântica do componente
  final String? semanticsHint;

  /// Responsável por definir o controlador da câmera
  final CameraController cameraController;

  const FaceDetectorComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    this.onPressedBackButton,
    required this.appBarTitle,
    required this.headerLabel,
    required this.textButtonCancel,
    required this.onCancel,
    required this.onDetectFace,
    this.semanticsLabel,
    this.semanticsHint,
    required this.cameraController,
  });

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.disabled: Behaviour.regular,
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };

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
    FaceDetectorStyle style,
    FaceDetectorSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _FaceDetectorWidget(
        onPressedBackButton: onPressedBackButton,
        cameraController: cameraController,
        semanticsLabel: semanticsLabel,
        semanticsHint: semanticsHint,
        appBarTitle: appBarTitle,
        behaviour: behaviour,
        headerLabel: headerLabel,
        onDetectFace: onDetectFace,
        textButtonCancel: textButtonCancel,
        onCancel: onCancel,
        style: style,
      );

  @override
  Widget whenRegular(
    FaceDetectorStyle style,
    FaceDetectorSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _FaceDetectorWidget(
        onPressedBackButton: onPressedBackButton,
        cameraController: cameraController,
        semanticsLabel: semanticsLabel,
        semanticsHint: semanticsHint,
        appBarTitle: appBarTitle,
        behaviour: behaviour,
        headerLabel: headerLabel,
        onDetectFace: onDetectFace,
        textButtonCancel: textButtonCancel,
        onCancel: onCancel,
        style: style,
      );
}

class _FaceDetectorWidget extends StatelessWidget {
  const _FaceDetectorWidget({
    required this.onPressedBackButton,
    required this.appBarTitle,
    required this.behaviour,
    required this.headerLabel,
    required this.onDetectFace,
    required this.textButtonCancel,
    required this.onCancel,
    required this.style,
    required this.semanticsLabel,
    required this.semanticsHint,
    required this.cameraController,
  });

  final String? semanticsLabel;
  final String? semanticsHint;
  final VoidCallback? onPressedBackButton;
  final String? appBarTitle;
  final Behaviour behaviour;
  final String? headerLabel;
  final Function() onDetectFace;
  final String textButtonCancel;
  final Function() onCancel;
  final FaceDetectorStyle style;
  final CameraController cameraController;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Semantics(
      label: semanticsLabel,
      hint: semanticsHint,
      child: Scaffold(
        appBar: appBarTitle == null
            ? null
            : QAppBar.standard(
                behaviour: Behaviour.regular,
                title: appBarTitle!,
                onPressedBackButton: onPressedBackButton,
              ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(QSizes.x16, QSizes.x32, QSizes.x16, QSizes.x16),
          child: Column(
            children: [
              QLabel(
                behaviour: behaviour,
                style: style.headerLabelStyle,
                text: headerLabel,
              ),
              SizedBox(height: size.height * .04),
              GestureDetector(
                onTap: onDetectFace,
                child: ClipOval(
                  child: Container(
                    padding: const EdgeInsets.all(QSizes.x48),
                    color: QTheme.colors.gray4,
                    child: ClipOval(
                      // TODO(caio): Soluçāo temporaria para visualizar a face na camera do dispositivo
                      child: SizedBox(
                        width: size.width * .65,
                        height: size.height * .45,
                        child: CameraPreview(cameraController),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * .04),
              QButton(
                style: style.cancelButtonStyle,
                behaviour: behaviour,
                text: textButtonCancel,
                onPressed: onCancel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
