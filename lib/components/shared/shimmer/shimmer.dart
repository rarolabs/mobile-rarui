import 'package:flutter/material.dart';
import 'package:rarUI/rarui.dart';

class RShimmer extends StatefulWidget {
  const RShimmer({
    super.key,
    required this.isLoading,
    this.ignoring = true,
    required this.child,
  });

  final bool isLoading;
  final bool ignoring;
  final Widget child;

  @override
  State<RShimmer> createState() => _RShimmerState();
}

class _RShimmerState extends State<RShimmer> {
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

  void _onShimmerChange() {
    if (widget.isLoading) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) return widget.child;

    final shimmer = RShimmerProvider.of(context);
    final renderObject = context.findRenderObject();
    final hasValidLayout = shimmer != null && shimmer.isSized && renderObject is RenderBox && renderObject.hasSize;
    final LinearGradient gradient = hasValidLayout ? shimmer.gradient : RShimmerConfig.shimmerGradient(context);
    final shimmerSize = hasValidLayout ? shimmer.size : const Size(300, 200);
    final offset = hasValidLayout ? shimmer.getDescendantOffset(descendant: renderObject) : Offset.zero;

    return IgnorePointer(
      ignoring: widget.ignoring,
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
        child: widget.child,
      ),
    );
  }
}
