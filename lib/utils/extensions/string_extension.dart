import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

import '../enums/coin_type.dart';

extension StringExtension on String {
  // *
  // * Arquivos -------------------------------------------------------------
  // * São utilizatários para extrar informações de arquivos

  String get nameFile => path.basename(this);

  String get nameFileWithoutExtension => path.basenameWithoutExtension(this);

  String get extensionFile => path.extension(this);

  String get mimeType {
    final text = lookupMimeType(nameFile);

    if (text == null) {
      if (toLowerCase().contains('.jpeg')) {
        return 'image/jpeg';
      } else if (toLowerCase().contains('.jpg')) {
        return 'image/jpg';
      } else if (toLowerCase().contains('.png')) {
        return 'image/png';
      } else if (toLowerCase().contains('.gif')) {
        return 'image/gif';
      } else if (toLowerCase().contains('.pdf')) {
        return 'application/pdf';
      } else if (toLowerCase().contains('.txt')) {
        return 'application/txt';
      } else {
        return 'application/octet-stream';
      }
    } else {
      return text;
    }
  }

  // *
  // * Datas -------------------------------------------------------------
  // * São utilizatários para converter strings em data e validações de data

  /// Converte string em data
  DateTime? get toDateTime => DateFormat('dd/MM/yyyy HH:mm').tryParse(this);
  DateTime? get toDate => DateFormat('dd/MM/yyyy').tryParse(this);
  DateTime? get toHour => DateFormat('HH:mm').tryParse(this);

  ///Formata datas em string
  String get formatToDate => DateFormat('dd/MM/yyyy').format(DateTime.parse(this));
  String get formatToHour => DateFormat('HH:mm').format(DateTime.parse(this));
  String get formatToDateWithWeekday => DateFormat("EEEE, dd 'de' MMMM", 'pt_BR').format(
        DateTime.parse(this),
      );
  String get formatToTime => DateFormat('HH:mm:ss').format(DateTime.parse(this));

  /// Retorna uma string no formato "dia da semana, dia mes-por-extenso ano"
  ///
  /// Exemplo: "Quarta-feira, 05 de março de 2025"
  String get completeDateWithWeekday => DateFormat("EEEE, dd 'de' MMMM 'de' yyyy", 'pt_BR').format(
        DateTime.parse(this),
      );

  /// Função para validar se a data é válida
  bool get dateIsValid {
    if (isEmpty) return false;

    try {
      // Tenta converter a string para uma data válida
      final date = toDate;

      if (date == null) return false;

      // Valida os limites do dia, mês e ano
      final day = date.day;
      final month = date.month;
      final year = date.year;

      if (day <= 0 || day > 31 || month <= 0 || month > 12 || year < 1900) return false;

      return true;
    } catch (e) {
      return false;
    }
  }

  // *
  // * Números --------------------------------------------------
  // *

  /// Remove todos os caracteres especiais, obtém apenas números, usado para remover máscaras
  String get removeSpecialCharacters => replaceAll(RegExp(r'[^\w\s]+'), '').replaceAll(' ', '');

  /// Substitui o . do double em , para melhor visualização
  String get formattedWithComma => replaceAll('.', ',');

  /// Converte valor em String com `R$`
  double get converterMoedaParaDouble =>
      double.tryParse(replaceAll('R\$', '').replaceAll(' ', '').replaceAll('.', '').replaceAll(',', '.')) ?? 0;

  /// Formata valor de string para valor monetário
  String get formatToCurrency => CoinType.real.currencyTextInput.formatString(this);

  // *
  // * Customização Texto --------------------------------------------------
  // *

  /// Este método deve ser usado para inserir conteúdo em negrito dentro de um texto
  /// através do caracterer especial [*] e as tags html de negrito [<b>], italico [<i>] e underline [<u>]
  ///
  /// Se o parâmetro {fontWeightStyle} for diferente de nulo
  /// o parâmetro {fontWeight} será ignorado
  TextSpan toBoldTextSpan(
    TextStyle defaultStyle, {
    FontWeight fontWeight = FontWeight.w700,
    Color? highlightColor,
  }) {
    final List<TextSpan> textSpans = [];
    final RegExp htmlRegExp = RegExp(r'(<b>|<i>|<u>|<\/b>|<\/i>|<\/u>)|(\*([^*]+)\*)');
    final matches = htmlRegExp.allMatches(this);

    int currentIndex = 0;

    for (final match in matches) {
      final matchText = match.group(0);
      if (match.start > currentIndex) {
        // Adiciona texto normal antes do próximo match
        textSpans.add(
          TextSpan(
            text: substring(currentIndex, match.start),
            style: defaultStyle,
          ),
        );
      }

      if (matchText != null) {
        if (matchText.startsWith('<') && matchText.endsWith('>')) {
          // Processar tags HTML
          if (matchText.startsWith('<b>')) {
            final endTagIndex = indexOf('</b>', match.end);
            if (endTagIndex != -1) {
              final boldText = substring(match.end, endTagIndex);
              textSpans.add(
                TextSpan(
                  text: boldText,
                  style: defaultStyle.copyWith(fontWeight: fontWeight, color: highlightColor),
                ),
              );
              currentIndex = endTagIndex + 4; // Salta o fechamento </b>
              continue;
            }
          } else if (matchText.startsWith('<i>')) {
            final endTagIndex = indexOf('</i>', match.end);
            if (endTagIndex != -1) {
              final italicText = substring(match.end, endTagIndex);
              textSpans.add(
                TextSpan(
                  text: italicText,
                  style: defaultStyle.copyWith(fontStyle: FontStyle.italic, color: highlightColor),
                ),
              );
              currentIndex = endTagIndex + 4;
              continue;
            }
          } else if (matchText.startsWith('<u>')) {
            final endTagIndex = indexOf('</u>', match.end);
            if (endTagIndex != -1) {
              final underlineText = substring(match.end, endTagIndex);
              textSpans.add(
                TextSpan(
                  text: underlineText,
                  style: defaultStyle.copyWith(decoration: TextDecoration.underline, color: highlightColor),
                ),
              );
              currentIndex = endTagIndex + 4;
              continue;
            }
          }
        } else if (matchText.startsWith('*')) {
          // Processar texto negrito com `*`
          final boldText = match.group(3);
          if (boldText != null) {
            textSpans.add(
              TextSpan(
                text: boldText,
                style: defaultStyle.copyWith(fontWeight: fontWeight, color: highlightColor),
              ),
            );
          }
        }
      }

      currentIndex = match.end;
    }

    if (currentIndex < length) {
      textSpans.add(
        TextSpan(
          text: substring(currentIndex),
          style: defaultStyle,
        ),
      );
    }

    return TextSpan(children: textSpans);
  }

  /// Retorna a cor através de um hexadecimal
  Color? get getColor => trim().isEmpty ? null : Color(int.parse('FF${replaceAll('#', '')}', radix: 16));

  ///Deixa primeira letra da string maiuscula
  String get capitalizeFirstLetter => this[0].toUpperCase() + substring(1);

  /// Formata data para envio na API
  /// data de exemplo: yyyy-mm-dd
  String get toApiDateFormat {
    final parts = split('/');
    if (parts.length != 3) {
      return this;
    }
    final day = parts[0].padLeft(2, '0');
    final month = parts[1].padLeft(2, '0');
    final year = parts[2];
    return '$year-$month-$day';
  }

  /// Retorna a string a partir de um base64
  String get fromBase64 => utf8.fuse(base64).decode(this);

  // *
  // * Formatters --------------------------------------------------
  // *

  String get formatCep => this == '' ? this : '${substring(0, 5)}-${substring(5, 8)}';

  String get extractOnlyDigits => trim().replaceAll(RegExp(r'[^0-9]'), '');

  String get formatCPF {
    if (extractOnlyDigits.length != 11) return this;
    return '${substring(0, 3)}.${substring(3, 6)}.${substring(6, 9)}-${substring(9, 11)}';
  }

  String get formatCnpj {
    if (extractOnlyDigits.length != 14) return this;
    return '${substring(0, 2)}.${substring(2, 5)}.${substring(5, 8)}/${substring(8, 12)}-${substring(12, 14)}';
  }

  String get formatPhone {
    if (extractOnlyDigits.length == 9) {
      return '${substring(0, 5)}-${substring(5, 9)}';
    }
    if (extractOnlyDigits.length == 10) {
      return '(${substring(0, 2)}) ${substring(2, 6)}-${substring(6, 10)}';
    }
    if (extractOnlyDigits.length != 11) return this;
    return '(${substring(0, 2)}) ${substring(2, 7)}-${substring(7, 11)}';
  }

  /// Ofusca o email até o @
  String get ofuscateEmail {
    final parts = split('@');
    if (parts.length != 2) return this;

    final local = parts[0];
    final domain = parts[1];

    if (local.length <= 3) {
      return '${local[0]}••••••@$domain'; // Se for muito curto, mostra apenas o primeiro
    }

    return '${local.substring(0, 3)}••••••@$domain';
  }

  /// Ofusca os primeiros digitos do número de telefone
  String get ofuscatePhone {
    final digits = replaceAll(RegExp(r'\D'), ''); // Remove não numéricos
    if (digits.length < 4) return this; // Retorna original se for muito curto

    return '•••••••${digits.substring(digits.length - 4)}'; // Formato com asteriscos
  }

  String get ofuscateCpf {
    final digits = removeSpecialCharacters;
    if (digits.length != 11) return this;

    return '•••.${digits.substring(3, 6)}.${digits.substring(6, 9)}-••';
  }

  String get ofuscateCnpj {
    final digits = removeSpecialCharacters;
    if (digits.length != 14) return this;

    return '••.${digits.substring(2, 5)}.${digits.substring(5, 8)}/••••-••';
  }

  String get ofuscateEvp {
    final digits = trim();
    if (digits.length <= 6) return '••••••';

    return '••••••${digits.substring(6)}';
  }

  String get firstAndLastName {
    final names = split(' ');
    if (names.length < 2) return this;
    final firstName = names.first;
    final lastName = names.last;
    return '$firstName $lastName';
  }

  /// Substitui todos * por • na chave Pix que vier mascarada
  String get replacePixKeyMasked => replaceAll('*', '•');
}
