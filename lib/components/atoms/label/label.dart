import 'package:flutter/material.dart';

class RLabel extends StatelessWidget {
 const RLabel({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.semanticsLabel,
    this.semanticsIdentifier,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? semanticsLabel;
  final String? semanticsIdentifier;
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.textTheme;
    final baseStyle = typography.bodyLarge?.copyWith(
      color: theme.colorScheme.onSurface,  
    );

    return Text(
      text,
      style: baseStyle?.merge(style), 
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
      semanticsLabel: semanticsLabel,
      semanticsIdentifier: semanticsIdentifier,
    );
  }
}