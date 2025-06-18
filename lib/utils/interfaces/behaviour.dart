/// Comportamento dos componentes
enum Behaviour {
  /// Behaviour.regular
  regular,

  /// Behaviour.loading
  loading,

  /// Behaviour.error
  error,

  /// Behaviour.disabled
  disabled,

  /// Behaviour.processing
  processing;

  bool get isRegular => this == regular;
  bool get isLoading => this == loading;
  bool get isError => this == error;
  bool get isDisabled => this == disabled;
  bool get isProcessing => this == processing;
  bool get isProcessingOrLoading => this == processing || this == loading;
}
