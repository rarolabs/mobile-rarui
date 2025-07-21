import 'package:flutter/material.dart';
import 'package:rarUI/rarui.dart';

enum RShimmerPlaceholderType { text, avatar, card }

class RShimmerPlaceholder extends StatefulWidget {
  const RShimmerPlaceholder({
    super.key,
    required this.type,
    this.width,
    this.height,
    this.radius,
    this.margin,
    this.lines = 1,
  });

  const RShimmerPlaceholder.text({
    super.key,
    this.width,
    this.height = 14,
    this.radius = 4,
    this.margin,
    this.lines = 1,
  }) : type = RShimmerPlaceholderType.text;

  const RShimmerPlaceholder.avatar({
    super.key,
    this.width = 48,
    this.height,
    this.margin,
  })  : type = RShimmerPlaceholderType.avatar,
        radius = null,
        lines = 1;

  const RShimmerPlaceholder.card({
    super.key,
    this.width,
    this.height = 120,
    this.radius = 8,
    this.margin,
  })  : type = RShimmerPlaceholderType.card,
        lines = 1;

  final RShimmerPlaceholderType type;
  final double? width;
  final double? height;
  final double? radius;
  final EdgeInsets? margin;
  final int lines;

  @override
  State<RShimmerPlaceholder> createState() => _RShimmerPlaceholderState();
}

class _RShimmerPlaceholderState extends State<RShimmerPlaceholder> {
  Listenable? _shimmerChanges;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_shimmerChanges != null) {
      _shimmerChanges!.removeListener(_onShimmerChange);
    }
    _shimmerChanges = RShimmerProvider.of(context)?.shimmerChanges;
    if (_shimmerChanges != null) {
      _shimmerChanges!.addListener(_onShimmerChange);
    }
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() => setState(() {});

  Widget _buildPlaceholder() {
    switch (widget.type) {
      case RShimmerPlaceholderType.text:
        return _buildText();
      case RShimmerPlaceholderType.avatar:
        return _buildAvatar();
      case RShimmerPlaceholderType.card:
        return _buildCard();
    }
  }

  Widget _buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(widget.lines, (index) {
        return Container(
          width: widget.width ?? double.infinity,
          height: widget.height ?? 14,
          margin: index > 0 ? const EdgeInsets.only(top: 4) : null,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(widget.radius ?? 4),
          ),
        );
      }),
    );
  }

  Widget _buildAvatar() {
    final size = widget.width ?? widget.height ?? 48;
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      width: widget.width,
      height: widget.height ?? 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(widget.radius ?? 8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shimmer = RShimmerProvider.of(context);
    final renderObject = context.findRenderObject();
    final hasValidLayout = shimmer != null && shimmer.isSized && renderObject is RenderBox && renderObject.hasSize;
    final LinearGradient gradient = hasValidLayout ? shimmer.gradient : RShimmerConfig.shimmerGradient(context);
    final shimmerSize = hasValidLayout ? shimmer.size : const Size(300, 200);
    final offset = hasValidLayout ? shimmer.getDescendantOffset(descendant: renderObject) : Offset.zero;

    final placeholder = _buildPlaceholder();

    return Container(
      margin: widget.margin,
      child: IgnorePointer(
        ignoring: true,
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            return gradient.createShader(
              Rect.fromLTWH(
                -offset.dx,
                -offset.dy,
                shimmerSize.width,
                shimmerSize.height,
              ),
            );
          },
          child: placeholder,
        ),
      ),
    );
  }
}
