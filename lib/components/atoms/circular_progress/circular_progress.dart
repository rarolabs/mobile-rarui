import 'circular_progress_specs.dart';

class QCircularProgress extends CircularProgressSpecs {
  /// Style configuration for [QCircularProgress]
  final CircularProgressStyleSet style;

  const QCircularProgress({
    required this.style,
    required super.behaviour,
    super.key,
    super.hintSemantics,
    super.labelSemantics,
  }) : super(styles: style);

  const QCircularProgress.small12Gray2({
    required super.behaviour,
    super.key,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = CircularProgressStyleSet.small12Gray2Style,
        super(styles: CircularProgressStyleSet.small12Gray2Style);

  const QCircularProgress.small12SuccessColorBase({
    required super.behaviour,
    super.key,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = CircularProgressStyleSet.small12SuccessColorBaseStyle,
        super(styles: CircularProgressStyleSet.small12SuccessColorBaseStyle);

  const QCircularProgress.small12PrimaryColorBase({
    required super.behaviour,
    super.key,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = CircularProgressStyleSet.small12PrimaryColorBaseStyle,
        super(styles: CircularProgressStyleSet.small12PrimaryColorBaseStyle);

  const QCircularProgress.large85Gray2({
    required super.behaviour,
    super.key,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = CircularProgressStyleSet.large85Gray2Style,
        super(styles: CircularProgressStyleSet.large85Gray2Style);
}
