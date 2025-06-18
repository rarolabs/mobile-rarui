import 'feedback_page_specs.dart';

class QFeedbackPage extends FeedbackPageSpecs {
  /// Style configuration for [QFeedbackPage]
  final FeedbackPageStyleSet style;

  const QFeedbackPage({
    required this.style,
    super.key,
    required super.behaviour,
    required super.primaryButtonBehaviour,
    required super.title,
    super.primaryButtonText,
    super.secondaryButtonText,
    super.descriptionTextList,
    super.onBackPressed,
    super.onPrimaryButtonPressed,
    super.onSecondaryButtonPressed,
    super.hintSemantics,
    super.onPopInvokedWithResult,
  }) : super(styles: style);

  /// Tela de feedback de erro com dois botões de ação
  const QFeedbackPage.error({
    super.key,
    required super.behaviour,
    super.primaryButtonBehaviour,
    required super.title,
    super.primaryButtonText,
    super.secondaryButtonText,
    super.descriptionTextList,
    super.onBackPressed,
    super.onPrimaryButtonPressed,
    super.onSecondaryButtonPressed,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = FeedbackPageStyleSet.error,
        super(styles: FeedbackPageStyleSet.error);

  /// Tela de feedback de sucesso com botão do tipo primary
  const QFeedbackPage.success({
    super.key,
    required super.behaviour,
    required super.title,
    super.primaryButtonBehaviour,
    super.primaryButtonText,
    super.secondaryButtonText,
    super.descriptionTextList,
    super.onBackPressed,
    super.onPrimaryButtonPressed,
    super.onSecondaryButtonPressed,
    super.hintSemantics,
    super.labelSemantics,
    super.onPopInvokedWithResult,
  })  : style = FeedbackPageStyleSet.success,
        super(styles: FeedbackPageStyleSet.success);

  /// Tela de feedback de alerta com botão tipo primary
  const QFeedbackPage.warning({
    super.key,
    required super.behaviour,
    required super.title,
    super.primaryButtonBehaviour,
    super.primaryButtonText,
    super.secondaryButtonText,
    super.descriptionTextList,
    super.onBackPressed,
    super.onPrimaryButtonPressed,
    super.onSecondaryButtonPressed,
    super.hintSemantics,
    super.labelSemantics,
    super.onPopInvokedWithResult,
  })  : style = FeedbackPageStyleSet.warning,
        super(styles: FeedbackPageStyleSet.warning);

  /// Tela de feedback para encerrar a conta
  const QFeedbackPage.closeAccount({
    super.key,
    required super.behaviour,
    super.primaryButtonBehaviour,
    required super.title,
    super.primaryButtonText,
    super.secondaryButtonText,
    super.descriptionTextList,
    super.onBackPressed,
    super.onPrimaryButtonPressed,
    super.onSecondaryButtonPressed,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = FeedbackPageStyleSet.closeAccount,
        super(styles: FeedbackPageStyleSet.closeAccount);

  /// Tela de feedback para encerrar a conta com alguma pendência
  const QFeedbackPage.warningCloseAccount({
    super.key,
    required super.behaviour,
    super.primaryButtonBehaviour,
    required super.title,
    super.primaryButtonText,
    super.secondaryButtonText,
    super.descriptionTextList,
    super.onBackPressed,
    super.onPrimaryButtonPressed,
    super.onSecondaryButtonPressed,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = FeedbackPageStyleSet.warningCloseAccount,
        super(styles: FeedbackPageStyleSet.warningCloseAccount);
}
