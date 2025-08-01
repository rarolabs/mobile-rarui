import 'package:flutter/material.dart';
import 'package:rarUI/components/atoms/label/label.dart';
import 'package:rarUI/components/molecules/list_tile/list_tile.dart';

class RLimitPix extends StatelessWidget {
  final String title;
  final String subtitle;
  final String titlePeriodoDiurno;
  final String subtitlePeriodoDiurno;
  final String titlePeriodoNoturno;
  final String subtitlePeriodoNoturno;
  final VoidCallback? onTapPeriodoDiurno;
  final VoidCallback? onTapPeriodoNoturno;

  const RLimitPix({
    super.key,
    this.title = 'Editar limites do Pix',
    this.subtitle = 'Ajuste os valores máximos permitidos para cada período do dia.',
    this.titlePeriodoDiurno = 'Período Diurno',
    this.subtitlePeriodoDiurno = '06h - 20h (Horário de Brasília)',
    this.titlePeriodoNoturno = 'Período Noturno',
    this.subtitlePeriodoNoturno = '20h - 06h (Horário de Brasília)',
    this.onTapPeriodoDiurno,
    this.onTapPeriodoNoturno,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RLabel(
              text: title,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            RLabel(
              text: subtitle,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withAlpha((0.7 * 255).toInt()),
              ),
            ),
            const SizedBox(height: 32),
            RListTile(
              title: RLabel(text: titlePeriodoDiurno),
              subtitle: RLabel(text: subtitlePeriodoDiurno),
              leading: const Icon(Icons.light_mode),
              trailing: const Icon(Icons.chevron_right),
              onTap: onTapPeriodoDiurno,
            ),
            const SizedBox(height: 16),
            RListTile(
              title: RLabel(text: titlePeriodoNoturno),
              subtitle: RLabel(text: subtitlePeriodoNoturno),
              leading: const Icon(Icons.dark_mode),
              trailing: const Icon(Icons.chevron_right),
              onTap: onTapPeriodoNoturno,
            ),
          ],
        ),
      ),
    );
  }
}
