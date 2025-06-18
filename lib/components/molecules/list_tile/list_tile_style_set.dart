import 'list_tile_specs.dart';
import 'list_tile_style.dart';

enum ListTileStyleSet {
  standard,
  standardDisabledWithStatusText,
  standardDisabledWithStatusTextMiniTrailingIcon,
  standardDisabledWithStatusTextMiniSecondaryTrailingIcon,
  standardTrailingSecondary0,
  standardTrailingSuccess,
  titleCaption14Gray4SubtitleRoboto14Gray5,
  radio,
  titleCaption14Gray4SubtitleRoboto16Gray5,
  standardError,
  transaction,
  toogle;

  const ListTileStyleSet();

  QListTileStyles get specs => switch (this) {
        standard => ListTileSpecs.standardStyle,
        standardDisabledWithStatusText => ListTileSpecs.standardDisabledWithStatusText,
        standardDisabledWithStatusTextMiniTrailingIcon => ListTileSpecs.standardDisabledWithStatusTextMiniTrailingIcon,
        standardDisabledWithStatusTextMiniSecondaryTrailingIcon =>
          ListTileSpecs.standardDisabledWithStatusTextMiniSecondaryTrailingIcon,
        standardTrailingSecondary0 => ListTileSpecs.standardTrailingSecondary0,
        standardTrailingSuccess => ListTileSpecs.standardTrailingSuccessStyle,
        titleCaption14Gray4SubtitleRoboto14Gray5 => ListTileSpecs.titleCaption14Gray4SubtitleRoboto14Gray5Style,
        radio => ListTileSpecs.radioStyle,
        titleCaption14Gray4SubtitleRoboto16Gray5 => ListTileSpecs.titleCaption14Gray4SubtitleRoboto16Gray5Style,
        standardError => ListTileSpecs.standardErrorStyle,
        transaction => ListTileSpecs.transactionStyle,
        toogle => ListTileSpecs.toogleStyle,
      };
}
