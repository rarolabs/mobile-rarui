import 'package:flutter/material.dart';
import 'behaviour.dart';
import 'style.dart';

abstract class BaseComponent<T, U> {
  /// Define como o componente deve ser mostrado se o comportamento atual
  /// for __REGULAR__
  Widget whenRegular(
    T style,
    U otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  );

  /// Define como o componente deve ser mostrado se o comportamento atual
  /// for __LOADING__
  Widget whenLoading(
    T style,
    U otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  );

  /// Define como o componente deve ser mostrado se o comportamento atual
  /// for __ERROR__
  Widget whenError(
    T style,
    U otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  );

  /// Define como o componente deve ser mostrado se o comportamento atual
  /// for __DISABLED__
  Widget whenDisabled(
    T style,
    U otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  );

  /// Define como o componente deve ser mostrado se o comportamento atual
  /// for __EMPTY__
  Widget whenEmpty(
    T style,
    U otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  );

  /// Define como o componente deve ser mostrado se o comportamento atual
  /// for __PROCESSING__
  Widget whenProcessing(
    T style,
    U otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  );

  Widget render(
    BuildContext context,
    Behaviour behaviour,
    Style<T, U> styles,
  );

  Map<Behaviour, Behaviour>? get delegate;
}
