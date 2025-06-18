import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/qr_code/qr_code.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  testWidgets('Valida se ao carregar a imagem, nao vai ocorrer erro ao renderizar o qrcode', (tester) async {
    bool hasError = false;
    final imageByte =
        base64Decode('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+ip1sAAAAASUVORK5CYII=');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QrCode.standard(
            behaviour: Behaviour.regular,
            imageByte: imageByte,
            onError: (_, __) {
              hasError = true;
            },
            qrCodeDescription: 'Seu QR foi criado',
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(hasError, false);
    expect(find.text('Seu QR foi criado'), findsOne);
  });
}
