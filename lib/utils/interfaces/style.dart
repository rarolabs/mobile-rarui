class Style<T, U> {
  /// regular
  final T? regular;

  /// loading
  final T? loading;

  /// error
  final T? error;

  /// disabled
  final T? disabled;

  /// empty
  final T? empty;

  /// processing
  final T? processing;

  /// regular
  final U shared;

  ///Estilos do componente quando o comportamento for [regular]
  ///Estilos do componente quando o comportamento for [loading]
  ///Estilos do componente quando o comportamento for [error]
  ///Estilos do componente quando o comportamento for [disabled]
  ///Estilos do componente quando o comportamento for [empty]
  ///Estilos do componente quando o comportamento for [processing]
  const Style({
    this.regular,
    this.loading,
    this.error,
    this.disabled,
    this.empty,
    this.processing,
    required this.shared,
  });

  T create(T Function() creator) => creator();
}
