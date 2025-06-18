import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import 'webview_page_component.dart';
import 'webview_page_styles.dart';

class WebviewPageSpecs extends WebviewPageComponent {
  const WebviewPageSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.url,
    required super.appBarTitle,
    required super.appBarIconTap,
    super.hintSemantics,
    super.labelSemantics,
  });

  /// Usado para webview page com appbar
  static WebviewPageStyles get standard => WebviewPageStyles(
        regular: WebviewPageStyle(),
        shared: WebviewPageSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(QSizes.x108, QSizes.x32),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
        ),
      );
}
