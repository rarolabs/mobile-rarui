import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import '../../atoms/circular_progress/circular_progress.dart';
import '../../molecules/app_bar/app_bar.dart';
import 'webview_page_style_set.dart';
import 'webview_page_styles.dart';

class WebviewPageComponent extends StatelessWidget with Component<WebviewPageStyle, WebviewPageSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Estilo do componente
  final WebviewPagePageStyleSet styles;

  /// Label do componente Appbar
  final String appBarTitle;

  /// URL webview
  final String url;

  /// Ação do tap do ícone
  final VoidCallback appBarIconTap;

  /// Texto de acessibilidade
  final String? labelSemantics;

  /// Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  const WebviewPageComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.appBarTitle,
    required this.url,
    required this.appBarIconTap,
    this.labelSemantics,
    this.hintSemantics,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<WebviewPageStyle, WebviewPageSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    WebviewPageStyle style,
    WebviewPageSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      Scaffold(
        appBar: QAppBar.standard(
          behaviour: Behaviour.regular,
          title: appBarTitle,
          onPressedBackButton: appBarIconTap,
        ),
        body: Center(child: LoadingWidget(style: otherStyle.loadingStyle)),
      );

  @override
  Widget whenRegular(
    WebviewPageStyle style,
    WebviewPageSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _CustomWebview(
      behaviour: behaviour,
      appBarTitle: appBarTitle,
      appBarIconTap: appBarIconTap,
      url: url,
      hintSemantics: hintSemantics,
      labelSemantics: labelSemantics,
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.disabled: Behaviour.regular,
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };
}

class _CustomWebview extends StatefulWidget {
  final Behaviour behaviour;
  final String appBarTitle;
  final String url;
  final VoidCallback appBarIconTap;
  final String? hintSemantics;
  final String? labelSemantics;

  const _CustomWebview({
    required this.behaviour,
    required this.appBarTitle,
    required this.appBarIconTap,
    required this.url,
    this.hintSemantics,
    this.labelSemantics,
  });

  @override
  _CustomWebviewState createState() => _CustomWebviewState();
}

class _CustomWebviewState extends State<_CustomWebview> {
  bool _isLoading = false;

  late final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          _isLoading
              ? const Center(
                  child: QCircularProgress.large85Gray2(
                    behaviour: Behaviour.regular,
                  ),
                ) // Show loading indicator while loading
              : const SizedBox.shrink();
        },
        onPageStarted: (String url) {
          setState(() {
            _isLoading = true;
          });
        },
        onPageFinished: (String url) {
          setState(() {
            _isLoading = true;
          });
        },
      ),
    )
    ..loadRequest(Uri.parse(widget.url));

  String changeUrl(String url) {
    // Verifica se a URL já começa com 'https://'
    if (!url.startsWith('https://')) {
      // Se não começar com 'https://', adiciona antes de 'www.'
      if (url.startsWith('www.')) {
        url = 'https://$url';
      }
    }
    return url;
  }

  @override
  void initState() {
    super.initState();

    changeUrl(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.labelSemantics,
      hint: widget.hintSemantics,
      child: Scaffold(
        appBar: QAppBar.standard(
          behaviour: Behaviour.regular,
          title: widget.appBarTitle,
          onPressedBackButton: widget.appBarIconTap,
        ),
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}
