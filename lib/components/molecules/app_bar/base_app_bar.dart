part of './app_bar.dart';

///
abstract class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Comportamento do componente, padrão [Behaviour.regular], desabilitado [Behaviour.disabled], error [Behaviour.error], processando [Behaviour.processing], carregando [Behaviour.loading].
  final Behaviour behaviour;
  final double? height;

  const BaseAppBar({
    super.key,
    required this.behaviour,
    this.height,
  });

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
