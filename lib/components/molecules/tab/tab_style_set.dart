import 'tab_specs.dart';
import 'tab_style.dart';

enum TabStyleSet {
  standard,
  pix,
  transfer;

  QTabStyles get specs => switch (this) {
        TabStyleSet.standard => TabSpecs.standardStyle,
        TabStyleSet.pix => TabSpecs.pixStyle,
        TabStyleSet.transfer => TabSpecs.transferStyle,
      };
}
