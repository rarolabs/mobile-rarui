import '../../../shared_widget/loading_styles.dart';
import '../../atoms/label/label_specs.dart';
import '../../molecules/button/button_specs.dart';
import '../../molecules/list_tile/list_tile_style_set.dart';

class ProofPageSharedStyle {
  final LoadingStyle loadingStyle;

  ProofPageSharedStyle({
    required this.loadingStyle,
  });
}

class ProofPageStyle {
  final LabelStyleSet titleStyle;
  final LabelStyleSet subtitleStyle;
  final LabelStyleSet inlineTitleStyle;
  final LabelStyleSet inlineValueStyle;
  final ListTileStyleSet listTileStyle;
  final LabelStyleSet sectionTitleStyle;
  final LabelStyleSet observationTitleStyle;
  final ButtonStyleSet buttonStyleSet;

  ProofPageStyle({
    required this.titleStyle,
    required this.subtitleStyle,
    required this.inlineTitleStyle,
    required this.inlineValueStyle,
    required this.listTileStyle,
    required this.sectionTitleStyle,
    required this.observationTitleStyle,
    required this.buttonStyleSet,
  });
}

class ProofPageStyles {
  ProofPageSharedStyle shared;
  ProofPageStyle regular;

  ProofPageStyles({
    required this.shared,
    required this.regular,
  });
}
