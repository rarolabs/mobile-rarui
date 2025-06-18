import '../interfaces/behaviour.dart';

/// Utilitário que ajuda a definir quais comportamentos (Behaviours) o componente deve implementar.

class BehaviourHelper {
  static const Map<Behaviour, Behaviour> processingAsRegular = {
    Behaviour.processing: Behaviour.regular,
  };

  static Behaviour childBehaviour(
    Behaviour behaviour,
    Map<Behaviour, Behaviour>? delegate,
  ) =>
      delegate != null ? delegate[behaviour] ?? behaviour : behaviour;
}
