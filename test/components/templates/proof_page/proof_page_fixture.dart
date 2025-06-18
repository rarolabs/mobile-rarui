import 'dart:typed_data';

import 'package:rarUI/components/templates/proof_page/proof_page_component.dart';
import 'package:rarUI/components/templates/proof_page/proof_page_specs.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

class ProofPageFixture {
  static ProofPageComponent render({
    required Behaviour behaviour,
    required String logoImagePath,
    required String title,
    required String subtitle,
    required Map<String, String> details,
    required String firstSectionTitleText,
    required Map<String, String> firstSection,
    required Map<String, String> secondSection,
    required String secondSectionTitleText,
    String? observationText,
    required Map<String, String> endSection,
    required String secondaryButtonText,
    required Function(Int8List imageData) onScreenShotPressed,
  }) {
    return ProofPageComponent(
      behaviour: behaviour,
      styles: ProofPageStyleSet.standard,
      title: title,
      subtitle: subtitle,
      details: details,
      firstSectionTitleText: firstSectionTitleText,
      firstSection: firstSection,
      secondSectionTitleText: secondSectionTitleText,
      secondSection: secondSection,
      observationText: observationText,
      endSection: endSection,
      logoImagePath: logoImagePath,
      secondaryButtonText: secondaryButtonText,
      onScreenShotPressed: (imageData) async {},
      onBackPressed: () {},
    );
  }
}
