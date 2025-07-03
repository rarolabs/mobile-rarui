import 'package:flutter/material.dart';

class RImage extends StatelessWidget {
  const RImage({
    super.key,
    required this.image,
    this.size,
    this.fit,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.centerSlice,
    this.matchTextDirection = false,
    this.color,
    this.colorBlendMode,
    this.errorBuilder,
    this.filterQuality = FilterQuality.medium,
    this.frameBuilder,
    this.gaplessPlayback = false,
    this.isAntiAlias = false,
    this.excludeFromSemantics = false,
    this.loadingBuilder,
    this.opacity,
    this.semanticLabel,
  });

  final ImageProvider<Object> image;
  final Size? size;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final ImageRepeat repeat;
  final Rect? centerSlice;
  final bool matchTextDirection;
  final Color? color;
  final BlendMode? colorBlendMode;
  final ImageErrorWidgetBuilder? errorBuilder;
  final FilterQuality filterQuality;
  final ImageFrameBuilder? frameBuilder;
  final bool gaplessPlayback;
  final bool isAntiAlias;
  final bool excludeFromSemantics;
  final Widget Function(BuildContext, Widget, ImageChunkEvent?)? loadingBuilder;
  final Animation<double>? opacity;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Image(
      key: key,
      image: image,
      width: size?.width,
      height: size?.height,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      color: color,
      colorBlendMode: colorBlendMode,
      errorBuilder: errorBuilder,
      filterQuality: filterQuality,
      frameBuilder: frameBuilder,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      excludeFromSemantics: excludeFromSemantics,
      loadingBuilder: loadingBuilder,
      opacity: opacity,
      semanticLabel: semanticLabel,
    );
  }
}
