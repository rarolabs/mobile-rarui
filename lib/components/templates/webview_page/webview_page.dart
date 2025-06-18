import 'webview_page_specs.dart';
import 'webview_page_style_set.dart';

class QWebviewPage extends WebviewPageSpecs {
  final WebviewPagePageStyleSet style;

  const QWebviewPage({
    required this.style,
    super.key,
    required super.behaviour,
    required super.url,
    required super.appBarTitle,
    required super.appBarIconTap,
    super.hintSemantics,
    super.labelSemantics,
  }) : super(styles: style);

  /// Tela de Webview
  const QWebviewPage.standard({
    super.key,
    required super.behaviour,
    required super.url,
    required super.appBarTitle,
    required super.appBarIconTap,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = WebviewPagePageStyleSet.standard,
        super(
          styles: WebviewPagePageStyleSet.standard,
        );
}
