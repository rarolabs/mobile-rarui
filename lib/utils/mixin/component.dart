import 'package:flutter/material.dart';

import '../helpers/behaviour_helper.dart';
import '../interfaces/base_component.dart';
import '../interfaces/behaviour.dart';
import '../interfaces/style.dart';

/// __Component__ é a classe pai de todos os componentes do projeto.
/// Define uma interface comum para que os componentes garantam suas
/// propriedades uniformes.
/// Um componente pode ser renderizado em diversos contextos. Esses contextos
/// são chamados de Behaviour.
mixin Component<T, U> implements BaseComponent<T, U> {
  @override
  Widget whenRegular(
    T style,
    U otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    throw ('$this does not implements Behaviour.regular');
  }

  @override
  Widget whenLoading(
    T style,
    U otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    throw ('$this does not implements Behaviour.loading');
  }

  @override
  Widget whenError(
    T style,
    U otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    throw ('$this does not implements Behaviour.error');
  }

  @override
  Widget whenDisabled(
    T style,
    U otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    throw ('$this does not implements Behaviour.disabled');
  }

  @override
  Widget whenEmpty(
    T style,
    U otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    throw ('$this does not implements Behaviour.empty');
  }

  @override
  Widget whenProcessing(
    T style,
    U otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    throw ('$this does not implements Behaviour.processing');
  }

  @override
  Widget render(BuildContext context, Behaviour behaviour, Style styles) {
    final actualBehaviour = BehaviourHelper.childBehaviour(behaviour, delegate);

    switch (actualBehaviour) {
      case Behaviour.regular:
        if (styles.regular == null) {
          throw '$this usa $behaviour mas não possui estilo $behaviour definido';
        }

        return whenRegular(
          styles.regular as T,
          styles.shared!,
          context,
          actualBehaviour,
        );

      case Behaviour.loading:
        if (styles.regular == null) {
          throw '$this usa $behaviour mas não possui estilo $behaviour definido';
        }

        return whenLoading(
          styles.regular as T,
          styles.shared!,
          context,
          actualBehaviour,
        );

      case Behaviour.error:
        if (styles.regular == null) {
          throw '$this usa $behaviour mas não possui estilo $behaviour definido';
        }

        return whenError(
          styles.error as T,
          styles.shared!,
          context,
          actualBehaviour,
        );

      case Behaviour.disabled:
        if (styles.regular == null) {
          throw '$this usa $behaviour mas não possui estilo $behaviour definido';
        }

        return whenDisabled(
          styles.disabled as T,
          styles.shared!,
          context,
          actualBehaviour,
        );

      case Behaviour.processing:
        if (styles.regular == null) {
          throw '$this usa $behaviour mas não possui estilo $behaviour definido';
        }

        return whenProcessing(
          styles.processing as T,
          styles.shared!,
          context,
          actualBehaviour,
        );
    }
  }
}
