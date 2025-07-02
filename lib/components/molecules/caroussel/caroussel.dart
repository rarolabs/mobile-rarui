import 'package:flutter/material.dart';

class RCaroussel extends StatelessWidget {
   const RCaroussel({
    super.key,
    required this.items,
    this.itemSpacing = 8.0,
    this.padding,
    this.showIndicator = false,
    this.height = 200,
    this.durationForEachItem = const Duration(milliseconds: 300),
  }); 
  
  final List<Widget> items;
  final double itemSpacing;
  final EdgeInsetsGeometry? padding;
  final bool showIndicator;
  final double height;
  final Duration durationForEachItem;

  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 0.8);

    return SizedBox(
      height: height + (showIndicator ? 24 : 0),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: items.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 0 : itemSpacing / 2,
                  right: index == items.length - 1 ? 0 : itemSpacing / 2,
                ),
                child: Padding(
                  padding: padding ?? EdgeInsets.zero,
                  child: items[index],
                ),
              ),
            ),
          ),
          if (showIndicator)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: _PageIndicator(
                controller: controller,
                itemCount: items.length,
                duration: durationForEachItem,
              ),
            ),
        ],
      ),
    );
  }
}

class _PageIndicator extends StatefulWidget {
  final PageController controller;
  final int itemCount;
   final Duration duration;
  

  const _PageIndicator({
    required this.controller,
    required this.itemCount,
    required this.duration,
  });

  @override
  State<_PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<_PageIndicator> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateCurrentPage);
  }

  void _updateCurrentPage() {
    final newPage = widget.controller.page?.round() ?? 0;
    if (_currentPage != newPage) {
      setState(() => _currentPage = newPage);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateCurrentPage);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.itemCount, (index) {
        final isActive = index == _currentPage;
        return AnimatedContainer(
          duration:  widget.duration,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 12 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
