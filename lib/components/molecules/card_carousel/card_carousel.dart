import 'package:flutter/material.dart';
import 'package:rarUI/components/atoms/atoms.dart';

class RCardCarousel extends StatelessWidget {
  const RCardCarousel({
    super.key,
    required this.title,
    required this.subtitle,
    required this.actionLabel,
    required this.cardIcon,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String actionLabel;
  final Widget cardIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RCard(
      size: Size(328.0, 233.0),
      color: theme.colorScheme.surfaceContainerLowest,
      child: Material(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 75,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8.0,
                          children: [
                            Flexible(
                              flex: 45,
                              child: RLabel(
                                text: title,
                                maxLines: 2,
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: theme.colorScheme.tertiary,
                                  fontSize: 20.0,
                                  height: 1.4,
                                ),
                              ),
                            ),
                            Container(
                              width: 32.0,
                              height: 4.0,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                            Flexible(
                              flex: 55,
                              child: RLabel(
                                text: subtitle,
                                maxLines: 3,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          width: 64.0,
                          height: 100.0,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: cardIcon,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: RDivider(
                  color: theme.disabledColor,
                ),
              ),
              Flexible(
                flex: 24,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    spacing: 12.0,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: RLabel(
                          text: actionLabel,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            height: 1.5,
                          ),
                        ),
                      ),
                      RIcon(
                        size: 24.0,
                        Icons.chevron_right,
                        color: theme.disabledColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
