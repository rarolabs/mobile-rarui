import 'package:flutter/material.dart';

class RSearchAnchor extends StatelessWidget {
  const RSearchAnchor({
    Key? key,
    required this.suggestionsBuilder,
    required this.builder,
    this.backgroundColor,
    this.enabled = true,
    this.keyboardType,
    this.isFullscreen,
    this.anchorLeading,
    this.anchorTrailing,
    this.shrinkWrap,
    this.viewOnSubmitted,
    this.viewOnChanged,
  }) : super(key: key);

  final SearchAnchorChildBuilder builder;
  final SuggestionsBuilder suggestionsBuilder;
  final bool? isFullscreen;
  final bool enabled;
  final Color? backgroundColor;
  final Widget? anchorLeading;
  final Iterable<Widget>? anchorTrailing;
  final bool? shrinkWrap;
  final ValueChanged<String>? viewOnChanged;
  final ValueChanged<String>? viewOnSubmitted;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: builder,
      suggestionsBuilder: suggestionsBuilder,
      isFullScreen: isFullscreen,
      enabled: enabled,
      viewBackgroundColor: backgroundColor,
      viewLeading: anchorLeading,
      viewTrailing: anchorTrailing,
      shrinkWrap: shrinkWrap,
      viewOnChanged: viewOnChanged,
      viewOnSubmitted: viewOnSubmitted,
      keyboardType: keyboardType,
    );
  }
}
