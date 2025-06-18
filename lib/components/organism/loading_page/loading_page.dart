import 'loading_page_specs.dart';

class QLoadingPage extends LoadingPageSpecs {
  /// Style configurtion for [ULoadingPage]
  final LoadingPageStyleSet style;

  const QLoadingPage({
    required this.style,
    super.key,
    required super.behaviour,
    super.labelSemantics,
    super.hintSemantics,
    super.title,
    super.description,
    super.onPressed,
    super.showCloseButton,
  }) : super(styles: style);

// Tela de Carregamento com opção de ter texto junto de botão de fechar
  const QLoadingPage.loading({
    super.key,
    required super.behaviour,
    super.labelSemantics,
    super.hintSemantics,
    super.title,
    super.description,
    super.onPressed,
    super.showCloseButton,
  })  : style = LoadingPageStyleSet.loading,
        super(styles: LoadingPageStyleSet.loading);
}
