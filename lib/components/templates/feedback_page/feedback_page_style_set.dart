part of 'feedback_page_specs.dart';

enum FeedbackPageStyleSet {
  error,
  success,
  warning,
  closeAccount,
  warningCloseAccount;

  const FeedbackPageStyleSet();

  FeedbackPageStyles get specs {
    return switch (this) {
      error => FeedbackPageSpecs.error,
      success => FeedbackPageSpecs.success,
      warning => FeedbackPageSpecs.warning,
      closeAccount => FeedbackPageSpecs.closeAccount,
      warningCloseAccount => FeedbackPageSpecs.warningCloseAccount,
    };
  }
}
