import 'package:flutter/material.dart';

class RRichText extends StatelessWidget {
   const RRichText({
    super.key,
    required this.children,
    this.textAlign,
    this.overflow = TextOverflow.clip,
    this.maxLines,
    this.semanticsLabel,
    this.semanticsIdentifier,
  });
  
  final List<InlineSpan> children;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final String? semanticsLabel;
  final String? semanticsIdentifier;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final baseStyle = theme.textTheme.bodyLarge?.copyWith(
      color: theme.colorScheme.onSurface,
    );

    return Text.rich(
      TextSpan(
        style: baseStyle,
        children: children,
      ),
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow ?? TextOverflow.clip,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      semanticsIdentifier: semanticsIdentifier,
    );
  }
}
