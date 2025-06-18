import 'webview_page_specs.dart';
import 'webview_page_styles.dart';

enum WebviewPagePageStyleSet {
  standard;

  const WebviewPagePageStyleSet();

  WebviewPageStyles get specs => switch (this) {
        standard => WebviewPageSpecs.standard,
      };
}
