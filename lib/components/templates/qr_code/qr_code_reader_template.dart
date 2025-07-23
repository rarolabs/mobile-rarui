import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class QrCodeReaderTemplate extends StatefulWidget {
  final String appbarLabel;
  final String? instructionLabel;
  const QrCodeReaderTemplate({super.key, required this.appbarLabel, this.instructionLabel});

  @override
  State<QrCodeReaderTemplate> createState() => _QrCodeReaderTemplateState();
}

class _QrCodeReaderTemplateState extends State<QrCodeReaderTemplate> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  List<Shadow> _shadow(BuildContext context) => <Shadow>[
        Shadow(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: .5),
          blurRadius: 3,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.appbarLabel,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onInverseSurface,
            shadows: _shadow(context),
          ),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onInverseSurface, shadows: _shadow(context)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Theme.of(context).colorScheme.primary,
              borderRadius: 16,
              borderLength: 32,
              borderWidth: 8,
              cutOutSize: MediaQuery.sizeOf(context).shortestSide * 0.7,
            ),
          ),
          if (widget.instructionLabel != null)
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.sizeOf(context).shortestSide * 0.7 + MediaQuery.of(context).padding.top + 32,
                ),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).shortestSide * 0.7,
                  child: Text(
                    widget.instructionLabel!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onInverseSurface,
                      shadows: _shadow(context),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      if (result!.code != null) {
        Navigator.pop(context, result!.code);
      }
    });
  }
}
