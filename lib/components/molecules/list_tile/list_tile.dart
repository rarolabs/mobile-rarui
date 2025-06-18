import '../list_tile/list_tile_specs.dart';
import 'list_tile_style_set.dart';

class QListTile extends ListTileSpecs {
  /// Style configuration for [QListTile]
  final ListTileStyleSet style;

  const QListTile({
    required this.style,
    super.key,
    super.onPressed,
    required super.behaviour,
    required super.title,
    super.statusText,
    super.subtitle,
    super.svgPathLeading,
    super.svgPathTrailing,
    super.hintSemantics,
    super.labelSemantics,
  }) : super(styles: style);

  /// Representa o ListTile principal, incluíndo leadingIcon, trailingIcon, title e subTitle
  const QListTile.standard({
    super.key,
    super.onPressed,
    required super.title,
    super.subtitle,
    required super.behaviour,
    super.svgPathLeading,
    super.svgPathTrailing,
    super.hintSemantics,
    super.labelSemantics,
    super.onPressedTrailingIcon,
  })  : style = ListTileStyleSet.standard,
        super(styles: ListTileStyleSet.standard);

  /// Representa o ListTile principal, incluíndo leadingIcon, trailingIcon, title e subTitle
  const QListTile.standardDisabledWithStatusText({
    super.key,
    super.onPressed,
    required super.title,
    super.statusText,
    super.subtitle,
    required super.behaviour,
    super.svgPathLeading,
    super.svgPathTrailing,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = ListTileStyleSet.standardDisabledWithStatusText,
        super(styles: ListTileStyleSet.standardDisabledWithStatusText);

  /// Representa o ListTile principal, incluíndo leadingIcon, trailingIcon, title e subTitle
  const QListTile.standardDisabledWithStatusTextMiniTrailingIcon({
    super.key,
    super.onPressed,
    required super.title,
    super.statusText,
    super.subtitle,
    required super.behaviour,
    super.svgPathLeading,
    super.svgPathTrailing,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = ListTileStyleSet.standardDisabledWithStatusTextMiniTrailingIcon,
        super(styles: ListTileStyleSet.standardDisabledWithStatusTextMiniTrailingIcon);

  /// Representa o ListTile principal, incluíndo leadingIcon, trailingIcon, title e subTitle
  /// Com os ícones na cor secondary base
  const QListTile.standardDisabledWithStatusTextMiniSecondaryTrailingIcon({
    super.key,
    super.onPressed,
    required super.title,
    super.statusText,
    super.subtitle,
    required super.behaviour,
    super.svgPathLeading,
    super.svgPathTrailing,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = ListTileStyleSet.standardDisabledWithStatusTextMiniSecondaryTrailingIcon,
        super(styles: ListTileStyleSet.standardDisabledWithStatusTextMiniSecondaryTrailingIcon);

  /// Representa o ListTile principal, incluíndo leadingIcon, trailingIcon
  /// title e subtitle e cor do trailing ícone secondary0
  const QListTile.standardTrailingSecondary0({
    super.key,
    super.onPressed,
    required super.title,
    super.subtitle,
    required super.behaviour,
    super.svgPathLeading,
    super.svgPathTrailing,
    super.hintSemantics,
    super.labelSemantics,
    super.onPressedTrailingIcon,
  })  : style = ListTileStyleSet.standardTrailingSecondary0,
        super(styles: ListTileStyleSet.standardTrailingSecondary0);

  /// Representa o ListTile com o título e o subtítulo
  const QListTile.standardTrailingSuccess({
    super.key,
    super.onPressed,
    required super.title,
    super.subtitle,
    required super.behaviour,
    super.svgPathLeading,
    super.svgPathTrailing,
    super.hintSemantics,
    super.labelSemantics,
    super.onPressedTrailingIcon,
  })  : style = ListTileStyleSet.standardTrailingSuccess,
        super(styles: ListTileStyleSet.standardTrailingSuccess);

  /// Representa o ListTile somente com título, subtítulo e trailingIcon
  const QListTile.titleCaption14Gray4SubtitleRoboto14Gray5({
    super.key,
    super.onPressed,
    required super.title,
    super.subtitle,
    required super.behaviour,
    super.onPressedTrailingIcon,
    super.hintSemantics,
    super.labelSemantics,
    super.svgPathLeading,
    super.svgPathTrailing,
  })  : style = ListTileStyleSet.titleCaption14Gray4SubtitleRoboto14Gray5,
        super(styles: ListTileStyleSet.titleCaption14Gray4SubtitleRoboto14Gray5);

  /// Representa o ListTile somente com título, subtítulo e trailingIcon
  const QListTile.titleRoboto14Gray4SubtitleRoboto14Gray5({
    super.key,
    super.onPressed,
    required super.title,
    super.subtitle,
    required super.behaviour,
    super.onPressedTrailingIcon,
    super.svgPathTrailing,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = ListTileStyleSet.titleCaption14Gray4SubtitleRoboto14Gray5,
        super(
          styles: ListTileStyleSet.titleCaption14Gray4SubtitleRoboto14Gray5,
        );

  /// Representa o ListTile principal, incluíndo leadingIcon, trailingIcon, title e subTitle
  const QListTile.standardError({
    super.key,
    super.onPressed,
    required super.title,
    super.subtitle,
    required super.behaviour,
    super.svgPathLeading,
    super.svgPathTrailing,
    super.hintSemantics,
    super.labelSemantics,
    super.onPressedTrailingIcon,
  })  : style = ListTileStyleSet.standardError,
        super(styles: ListTileStyleSet.standardError);

  /// Representa o ListTile para transações
  const QListTile.transaction({
    super.key,
    super.onPressed,
    required super.title,
    required super.subtitle,
    required super.behaviour,
    required super.trailingLabel,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = ListTileStyleSet.transaction,
        super(styles: ListTileStyleSet.transaction);

  /// Representa o ListTile somente com título, subtítulo e radio
  const QListTile.radio({
    super.key,
    super.onPressed,
    required super.title,
    super.subtitle,
    required super.behaviour,
    super.onPressedTrailingIcon,
    super.hintSemantics,
    super.labelSemantics,
    super.valueRadio,
    super.onPressedRadio,
  })  : style = ListTileStyleSet.radio,
        super(styles: ListTileStyleSet.radio, trailingRadio: true);

  /// Representa o ListTile principal, incluíndo leadingIcon, trailingIcon sendo um QToggle
  /// title e subtitle e cor do trailing ícone secondary0
  const QListTile.toggle({
    super.key,
    super.onPressed,
    required super.title,
    super.subtitle,
    required super.behaviour,
    super.svgPathLeading,
    super.hintSemantics,
    super.labelSemantics,
    super.onPressedTrailingIcon,
    super.valueToggle,
    super.onPressedToggle,
  })  : style = ListTileStyleSet.toogle,
        super(styles: ListTileStyleSet.toogle, trailingToggle: true);
}
