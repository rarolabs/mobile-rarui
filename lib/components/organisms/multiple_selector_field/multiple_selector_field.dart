import 'package:flutter/material.dart';

import '../../atoms/atoms.dart';

class RMultipleSelectorField<T> extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String label;
  final List<T>? currentSelectedItems;
  final String Function(T item) labelOfItem;
  final Function(T item)? onRemoveItemTap;
  final Color? leadingIconColor;
  final Color? borderColor;
  final Color itemBorderColor;
  final double? borderRadius;
  final double? itemsSpacing;
  final double? itemsRunSpacing;
  final double? itemHeight;
  final double? itemRadius;
  final double? itemSpacing;
  final double? iconSize;
  final TextStyle? labelStyle;
  final TextStyle? itemLabelStyle;
  final Color? itemIconColor;

  const RMultipleSelectorField({
    super.key,
    this.onTap,
    required this.label,
    required this.currentSelectedItems,
    required this.labelOfItem,
    this.leadingIconColor,
    this.borderColor,
    this.borderRadius,
    required this.itemBorderColor,
    this.onRemoveItemTap,
    this.itemsSpacing,
    this.itemsRunSpacing,
    this.itemHeight,
    this.itemRadius,
    this.itemSpacing,
    this.iconSize,
    this.labelStyle,
    this.itemLabelStyle,
    this.itemIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: labelStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 4.0),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16.0,
          children: [
            RIcon(
              Icons.search,
              color: leadingIconColor,
            ),
            if (currentSelectedItems != null && currentSelectedItems!.isNotEmpty)
              Flexible(
                child: Wrap(
                  spacing: itemsSpacing ?? 8.0,
                  runSpacing: itemsRunSpacing ?? 8.0,
                  children: currentSelectedItems!.asMap().entries.map((item) {
                    return Container(
                      height: itemHeight ?? 32.0,
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: itemBorderColor),
                        borderRadius: BorderRadius.circular(itemRadius ?? 8.0),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
                              spacing: itemSpacing ?? 8.0,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RLabel(
                                  text: labelOfItem(item.value),
                                  style: itemLabelStyle,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (onRemoveItemTap != null) {
                                      onRemoveItemTap!(item.value);
                                    }
                                  },
                                  child: RIcon(
                                    Icons.close,
                                    size: iconSize ?? 16.0,
                                    color: itemIconColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
