import 'documents_photo_specs.dart';
import 'documents_photo_style.dart';

enum DocumentsPhotoStyleSet {
  regular;

  const DocumentsPhotoStyleSet();

  DocumentsPhotoStyles get specs {
    return switch (this) {
      regular => DocumentsPhotoSpecs.regularStyle,
    };
  }
}
