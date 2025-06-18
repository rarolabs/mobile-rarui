import 'instructions_photo_specs.dart';
import 'instructions_photo_style_set.dart';

class QInstructionsPhotoPage extends InstructionsPhotoSpecs {
  final InstructionsPhotoStyleSet style;

  const QInstructionsPhotoPage({
    super.key,
    required super.behaviour,
    required this.style,
    super.onPressedBackButton,
    required super.appBarTitle,
    required super.title,
    required super.subtitle,
    required super.textIcons,
    required super.textButton,
    required super.onPressedButton,
    super.semanticsLabel,
    super.semanticsHint,
  }) : super(styles: style);

  const QInstructionsPhotoPage.regular({
    super.key,
    required super.behaviour,
    super.onPressedBackButton,
    required super.appBarTitle,
    required super.title,
    required super.subtitle,
    required super.textIcons,
    required super.textButton,
    required super.onPressedButton,
    super.semanticsLabel,
    super.semanticsHint,
  })  : style = InstructionsPhotoStyleSet.regular,
        super(styles: InstructionsPhotoStyleSet.regular);
}
