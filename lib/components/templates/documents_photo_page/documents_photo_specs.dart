import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/tokens.dart';
import '../../atoms/label/label_specs.dart';
import '../../molecules/button/button_specs.dart';
import 'documents_photo_component.dart';
import 'documents_photo_style.dart';

class DocumentsPhotoSpecs extends DocumentsPhotoComponent {
  const DocumentsPhotoSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.appBarTitle,
    required super.headerLabel,
    required super.cancelButtonLabel,
    required super.body,
    required super.onPressedCamera,
    required super.svgCameraPath,
    required super.onPressedBackButton,
    required super.onPressedCancelButton,
    super.semanticsLabel,
    super.semanticsHint,
  });

  static DocumentsPhotoStyles get regularStyle {
    return DocumentsPhotoStyles(
      sharedStyle: DocumentsPhotoSharedStyle(
        loadingStyle: LoadingStyle(
          size: Size.zero,
          baseColor: QTheme.colors.transparent,
          highlightColor: QTheme.colors.transparent,
        ),
      ),
      regular: DocumentsPhotoStyle(
        headerLabelStyle: LabelStyleSet.h5Roboto20Gray8Bold,
        appBarTitleStyle: LabelStyleSet.paragraphRoboto16WhiteBold,
        cancelButtonStyle: ButtonStyleSet.tertiaryGray9,
        cameraLensColor: QTheme.colors.white,
        cameraButtonBackgroundColor: QTheme.colors.ciano,
        cameraButtonBackgroundColorLoading: QTheme.colors.gray1,
        backgroundPageColor: QTheme.colors.white,
      ),
    );
  }
}
