import 'package:rarUI/components/templates/feedback_page/feedback_page_component.dart';
import 'package:rarUI/components/templates/feedback_page/feedback_page_specs.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

class FeedbackErrorPageFixture {
  static FeedbackPageComponent render({
    required Behaviour behaviour,
    required String title,
    required List<String> descriptionTextList,
    required String primaryButtonText,
    required String secondaryButtonText,
  }) {
    return FeedbackPageComponent(
      behaviour: behaviour,
      title: title,
      descriptionTextList: descriptionTextList,
      primaryButtonText: primaryButtonText,
      secondaryButtonText: secondaryButtonText,
      onBackPressed: () {},
      onPrimaryButtonPressed: () {},
      onSecondaryButtonPressed: () {},
      styles: FeedbackPageStyleSet.error,
    );
  }
}
