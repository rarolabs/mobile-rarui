import 'package:flutter/material.dart';
import 'package:rarUI/rarui.dart';

class RTransferValueTemplate extends StatefulWidget {
  final double? initialValue;
  final double accountBallance;
  final Map<String, String> details;
  final VoidCallback? onContinuePressed;
  final TextEditingController controller;
  final String titleLabel;
  final String descriptionLabel;
  final String balanceDescriptionLabel;
  final String onContinueLabel;
  final String onCancelLabel;
  const RTransferValueTemplate({
    super.key,
    this.initialValue,
    required this.accountBallance,
    required this.details,
    required this.onContinuePressed,
    required this.controller,
    this.titleLabel = 'Quanto gostaria de transferir?',
    this.descriptionLabel = 'Informe quanto você quer transferir.',
    this.balanceDescriptionLabel = 'Seu saldo atual é de',
    this.onContinueLabel = 'Continuar',
    this.onCancelLabel = 'Cancelar',
  });

  @override
  State<RTransferValueTemplate> createState() => _RTransferValueTemplateState();
}

class _RTransferValueTemplateState extends State<RTransferValueTemplate> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RTitleSubtitle(
            title: widget.titleLabel,
            subTitle: widget.descriptionLabel,
          ),
          Expanded(
            child: Center(
              child: RMoneyInput(
                controller: widget.controller,
                initialValue: widget.initialValue,
                balanceValue: widget.accountBallance,
                balanceDescription: widget.balanceDescriptionLabel,
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: widget.controller,
            builder: (context, value, child) {
              return RElevatedButton(
                text: widget.onContinueLabel,
                onPressed: widget.onContinuePressed,
              );
            },
          ),
          ROutlinedButton(
            text: widget.onCancelLabel,
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
