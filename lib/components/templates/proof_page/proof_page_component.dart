import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import '../../../rarui.dart';
import 'proof_page_specs.dart';
import 'proof_page_style.dart';

class ProofPageComponent extends StatelessWidget with Component<ProofPageStyle, ProofPageSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Estilo do componente
  final ProofPageStyleSet styles;

  // Caminho da imagem
  final String logoImagePath;

  /// Título
  final String title;

  /// Subtitulo do comprovante
  final String subtitle;

  // Titulo da primeira seção do comprovante
  final String? firstSectionTitleText;

  // Titulo da segunda seção do comprovante
  final String? secondSectionTitleText;

  // Row Label >< Label dos detalhes primários do comprovante
  final Map<String, String>? details;

  // ListTiles dos detalhes da primeira seção do comprovante
  final Map<String, String> firstSection;

  // ListTiles dos detalhes da segunda seção do comprovante
  final Map<String, String> secondSection;

  // ListTiles dos detalhes da última seção do comprovante
  final Map<String, String>? endSection;

  final String? observationText;

  /// Descrição do botão
  final String? secondaryButtonText;

  /// Ação back
  final VoidCallback onBackPressed;

  /// Texto de acessibilidade
  final String? labelSemantics;

  /// Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  /// Callback para capturar a imagem após o [secondaryButton] ser pressionado
  final Function(Uint8List imageBytes) onScreenShotPressed;

  const ProofPageComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.title,
    required this.subtitle,
    this.firstSectionTitleText,
    this.details,
    required this.firstSection,
    this.secondSectionTitleText,
    required this.secondSection,
    this.endSection,
    required this.logoImagePath,
    this.observationText,
    required this.secondaryButtonText,
    required this.onBackPressed,
    this.labelSemantics,
    this.hintSemantics,
    required this.onScreenShotPressed,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<ProofPageStyle, ProofPageSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    ProofPageStyle style,
    ProofPageSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _ProofPageWidget(
      labelSemantics: labelSemantics,
      hintSemantics: hintSemantics,
      behaviour: behaviour,
      onBackPressed: onBackPressed,
      logoImagePath: logoImagePath,
      styles: styles,
      title: title,
      subtitle: subtitle,
      details: details,
      firstSectionTitleText: firstSectionTitleText,
      firstSection: firstSection,
      secondSectionTitleText: secondSectionTitleText,
      secondSection: secondSection,
      observationText: observationText,
      endSection: endSection,
      secondaryButtonText: secondaryButtonText,
      onScreenShotPressed: onScreenShotPressed,
      isScreenshot: false,
    );
  }

  @override
  Widget whenRegular(
    ProofPageStyle style,
    ProofPageSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _ProofPageWidget(
      labelSemantics: labelSemantics,
      hintSemantics: hintSemantics,
      behaviour: behaviour,
      onBackPressed: onBackPressed,
      logoImagePath: logoImagePath,
      styles: styles,
      title: title,
      subtitle: subtitle,
      details: details,
      firstSectionTitleText: firstSectionTitleText,
      firstSection: firstSection,
      secondSectionTitleText: secondSectionTitleText,
      secondSection: secondSection,
      observationText: observationText,
      endSection: endSection,
      secondaryButtonText: secondaryButtonText,
      onScreenShotPressed: onScreenShotPressed,
      isScreenshot: false,
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.disabled: Behaviour.regular,
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };
}

class _ProofPageWidget extends StatefulWidget {
  const _ProofPageWidget({
    required this.labelSemantics,
    required this.hintSemantics,
    required this.behaviour,
    required this.onBackPressed,
    required this.logoImagePath,
    required this.styles,
    required this.title,
    required this.subtitle,
    this.details,
    this.firstSectionTitleText,
    required this.firstSection,
    this.secondSectionTitleText,
    required this.secondSection,
    required this.observationText,
    this.endSection,
    required this.secondaryButtonText,
    required this.onScreenShotPressed,
    required this.isScreenshot,
  });

  final String? labelSemantics;
  final String? hintSemantics;
  final Behaviour behaviour;
  final VoidCallback onBackPressed;
  final String logoImagePath;
  final ProofPageStyleSet styles;
  final String title;
  final String subtitle;
  final Map<String, String>? details;
  final String? firstSectionTitleText;
  final Map<String, String> firstSection;
  final String? secondSectionTitleText;
  final Map<String, String> secondSection;
  final String? observationText;
  final Map<String, String>? endSection;
  final String? secondaryButtonText;
  final Function(Uint8List imageBytes) onScreenShotPressed;
  final bool isScreenshot;

  @override
  State<_ProofPageWidget> createState() => _ProofPageWidgetState();
}

class _ProofPageWidgetState extends State<_ProofPageWidget> {
  late final ScreenshotController screenshotController;
  late final GlobalKey _screenshotWidgetKey;

  @override
  void initState() {
    super.initState();
    screenshotController = ScreenshotController();
    _screenshotWidgetKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.labelSemantics,
      hint: widget.hintSemantics,
      child: Scaffold(
        appBar: widget.isScreenshot
            ? null
            : QAppBar.gray1CloseLeadingEmptyTitle(
                behaviour: widget.behaviour,
                onPressedBackButton: widget.onBackPressed,
              ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(QSizes.x16, QSizes.x0, QSizes.x16, QSizes.x64),
                child: Screenshot(
                  key: _screenshotWidgetKey,
                  controller: screenshotController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: QSizes.x4),
                      Center(
                        child: QImage.standard(
                          behaviour: widget.behaviour,
                          path: widget.logoImagePath,
                          height: QSizes.x68,
                          width: QSizes.x68,
                        ),
                      ),
                      const SizedBox(height: QSizes.x20),
                      Center(
                        child: QLabel(
                          style: widget.styles.specs.regular.titleStyle,
                          behaviour: widget.behaviour,
                          text: widget.title,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: QLabel(
                          style: widget.styles.specs.regular.subtitleStyle,
                          behaviour: widget.behaviour,
                          text: widget.subtitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: QSizes.x52),

                      // * Proof Main Details
                      if (widget.details != null)
                        ...widget.details!.entries.map(
                          (entry) => Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: QSizes.x12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    QLabel(
                                      style: widget.styles.specs.regular.inlineTitleStyle,
                                      behaviour: widget.behaviour,
                                      text: entry.key,
                                    ),
                                    QLabel(
                                      style: widget.styles.specs.regular.inlineValueStyle,
                                      behaviour: widget.behaviour,
                                      text: entry.value,
                                    ),
                                  ],
                                ),
                              ),
                              QDivider.standard(behaviour: widget.behaviour),
                              const SizedBox(height: QSizes.x12),
                            ],
                          ),
                        ),
                      const SizedBox(height: QSizes.x28),

                      //* First Section
                      if (widget.firstSectionTitleText?.isNotEmpty ?? false)
                        QLabel(
                          style: widget.styles.specs.regular.sectionTitleStyle,
                          behaviour: widget.behaviour,
                          text: widget.firstSectionTitleText,
                        ),
                      ...widget.firstSection.entries.map((entry) => _buildListTile(entry.key, entry.value)),
                      if (widget.firstSection.entries.isNotEmpty) const SizedBox(height: QSizes.x40),

                      //* Second Section
                      if (widget.secondSectionTitleText?.isNotEmpty ?? false)
                        QLabel(
                          style: widget.styles.specs.regular.sectionTitleStyle,
                          behaviour: widget.behaviour,
                          text: widget.secondSectionTitleText,
                        ),
                      if (widget.secondSection.entries.isNotEmpty)
                        ...widget.secondSection.entries.map((entry) => _buildListTile(entry.key, entry.value)),

                      if (widget.observationText != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: QSizes.x40),
                          child: QLabel(
                            style: widget.styles.specs.regular.observationTitleStyle,
                            behaviour: widget.behaviour,
                            text: widget.observationText,
                          ),
                        ),

                      //* End Section
                      if (widget.endSection?.isNotEmpty ?? false)
                        ...widget.endSection!.entries.map((entry) => _buildListTile(entry.key, entry.value)),
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Offstage(
                offstage: widget.isScreenshot,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: QSizes.x32, right: QSizes.x32, bottom: QSizes.x32),
                      child: SizedBox(
                        height: QSizes.x48,
                        child: QButton(
                          style: widget.styles.specs.regular.buttonStyleSet,
                          behaviour: widget.behaviour,
                          text: widget.secondaryButtonText,
                          onPressed: () async {
                            final screenshotWidget = _ProofPageWidget(
                              behaviour: Behaviour.regular,
                              logoImagePath: widget.logoImagePath,
                              styles: widget.styles,
                              title: widget.title,
                              subtitle: widget.subtitle,
                              details: widget.details,
                              firstSectionTitleText: widget.firstSectionTitleText,
                              firstSection: widget.firstSection,
                              secondSectionTitleText: widget.secondSectionTitleText,
                              secondSection: widget.secondSection,
                              observationText: widget.observationText,
                              endSection: widget.endSection,
                              hintSemantics: '',
                              labelSemantics: '',
                              onBackPressed: () {},
                              onScreenShotPressed: (s) {},
                              secondaryButtonText: '',
                              isScreenshot: true,
                            );

                            return _printScreenshot(screenshotWidget);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(String title, String subtitle) {
    return QListTile(
      style: widget.styles.specs.regular.listTileStyle,
      behaviour: widget.behaviour,
      title: title,
      subtitle: subtitle,
    );
  }

  Future<void> _printScreenshot(_ProofPageWidget screenshotWidget) async {
    final renderObject = _screenshotWidgetKey.currentContext?.findRenderObject();

    if (renderObject is RenderBox) {
      final height = renderObject.size.height;
      final mediaQuerySize = MediaQuery.sizeOf(context);

      final image = await screenshotController.captureFromLongWidget(
        MediaQuery(data: MediaQueryData(size: mediaQuerySize), child: screenshotWidget),
        context: context,
        delay: Durations.short1,
        constraints: BoxConstraints(maxHeight: height, maxWidth: mediaQuerySize.width),
      );

      widget.onScreenShotPressed(image);
    }
  }
}
