import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/utils/extensions/string_extension.dart';

void main() {
  group('extractDigits', () {
    test('should remove all non-numeric characters', () {
      expect('abc123'.extractOnlyDigits, '123');
      expect('1a2b3c'.extractOnlyDigits, '123');
      expect('(11) 99999-8888'.extractOnlyDigits, '11999998888');
      expect('CPF: 123.456.789-00'.extractOnlyDigits, '12345678900');
    });
  });

  group('formatCPF', () {
    test('should format a valid CPF correctly', () {
      expect('12345678900'.formatCPF, '123.456.789-00');
    });

    test('should return the original string if CPF is invalid', () {
      expect('1234567890'.formatCPF, '1234567890');
    });
  });

  group('formatCnpj', () {
    test('should format a valid CNPJ correctly', () {
      expect('65908162000178'.formatCnpj, '65.908.162/0001-78');
      expect('69892878000185'.formatCnpj, '69.892.878/0001-85');
    });

    test('should return the original string if CNPJ is invalid', () {
      expect('1122233300018'.formatCnpj, '1122233300018');
    });
  });

  group('formatPhone', () {
    test('should format 9-digit numbers correctly', () {
      expect('999999999'.formatPhone, '99999-9999');
    });

    test('should format 10-digit numbers correctly', () {
      expect('1199999999'.formatPhone, '(11) 9999-9999');
    });

    test('should format 11-digit  numbers correctly', () {
      expect('11999999999'.formatPhone, '(11) 99999-9999');
    });

    test('should return the original string if phone number is invalid', () {
      expect('99999999'.formatPhone, '99999999');
    });
  });

  group('firstAndLastName', () {
    test('should return the first and last name', () {
      expect('Lorem Ipsum Dolor'.firstAndLastName, 'Lorem Dolor');
      expect('John Doe'.firstAndLastName, 'John Doe');
      expect('Jane'.firstAndLastName, 'Jane');
      expect(''.firstAndLastName, '');
      expect('John Doe Smith'.firstAndLastName, 'John Smith');
    });
  });
}
