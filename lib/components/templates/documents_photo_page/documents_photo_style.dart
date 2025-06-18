import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../atoms/label/label_specs.dart';
import '../../molecules/button/button_specs.dart';

class DocumentsPhotoSharedStyle {
  final LoadingStyle loadingStyle;

  DocumentsPhotoSharedStyle({required this.loadingStyle});
}

class DocumentsPhotoStyle {
  final LabelStyleSet appBarTitleStyle;
  final LabelStyleSet headerLabelStyle;
  final ButtonStyleSet cancelButtonStyle;
  final Color cameraButtonBackgroundColor;
  final Color cameraButtonBackgroundColorLoading;
  final Color backgroundPageColor;
  final Color cameraLensColor;

  DocumentsPhotoStyle({
    required this.appBarTitleStyle,
    required this.headerLabelStyle,
    required this.cancelButtonStyle,
    required this.cameraButtonBackgroundColor,
    required this.cameraButtonBackgroundColorLoading,
    required this.backgroundPageColor,
    required this.cameraLensColor,
  });
}

class DocumentsPhotoStyles {
  final DocumentsPhotoSharedStyle sharedStyle;
  final DocumentsPhotoStyle regular;

  const DocumentsPhotoStyles({
    required this.sharedStyle,
    required this.regular,
  });
}
