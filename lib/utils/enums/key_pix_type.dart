import 'package:flutter/services.dart';
import 'package:br_validators/br_validators.dart';

enum KeyPixType {
  phone,
  email,
  cpf,
  cnpj,
  random
}

extension KeyPixTypeExtension on KeyPixType {
  List<TextInputFormatter> get inputFormatter {
    switch (this) {
      case KeyPixType.cpf:
        return [BRMasks.cpf];
      case KeyPixType.cnpj:
        return [BRMasks.cnpj];
      case KeyPixType.phone:
        return [BRMasks.mobilePhone];
      case KeyPixType.email:
        return [];
      case KeyPixType.random:
        return [];
    }
  }

  bool validator(String? value) {
    switch (this) {
      case KeyPixType.cpf:
        return BRValidators.validateCPF(value ?? '');
      case KeyPixType.cnpj:
        return BRValidators.validateCNPJ(value ?? '');
      case KeyPixType.phone:
        return BRValidators.validateMobileNumber(value ?? '');
      case KeyPixType.email:
        final emailRegex = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
        return emailRegex.hasMatch(value!);
      case KeyPixType.random:
        return true;
    }
  }
}
