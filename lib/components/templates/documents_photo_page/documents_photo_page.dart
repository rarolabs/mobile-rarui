import '../../../theme/theme_data.dart';
import 'documents_photo_specs.dart';
import 'documents_photo_style_set.dart';

class QDocumentsPhotoPage extends DocumentsPhotoSpecs {
  final DocumentsPhotoStyleSet style;

  const QDocumentsPhotoPage({
    super.key,
    required super.behaviour,
    required super.appBarTitle,
    required this.style,
    required super.headerLabel,
    required super.cancelButtonLabel,
    required super.body,
    required super.onPressedCamera,
    required super.svgCameraPath,
    required super.onPressedBackButton,
    required super.onPressedCancelButton,
    super.semanticsLabel,
    super.semanticsHint,
  }) : super(styles: style);

  QDocumentsPhotoPage.regular({
    super.key,
    required super.behaviour,
    required super.appBarTitle,
    required super.headerLabel,
    required super.cancelButtonLabel,
    required super.body,
    required super.onPressedCamera,
    required super.onPressedBackButton,
    required super.onPressedCancelButton,
    super.semanticsLabel,
    super.semanticsHint,
  })  : style = DocumentsPhotoStyleSet.regular,
        super(
          styles: DocumentsPhotoStyleSet.regular,
          svgCameraPath: QTheme.svgs.camera,
        );
}
