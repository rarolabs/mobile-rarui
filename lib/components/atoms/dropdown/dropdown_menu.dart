import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RDropdownMenu<T> extends StatelessWidget {
  const RDropdownMenu({
    Key? key,
    this.enabled = true,
    this.width,
    this.menuHeight,
    this.leadingIcon,
    this.trailingIcon,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.selectedTrailingIcon,
    this.enableFilter = false,
    this.enableSearch = true,
    this.keyboardType,
    this.textStyle,
    this.textAlign = TextAlign.start,
    this.inputDecorationTheme,
    this.menuStyle,
    this.controller,
    this.initialSelection,
    this.onSelected,
    this.focusNode,
    this.requestFocusOnTap,
    this.expandedInsets,
    this.filterCallback,
    this.searchCallback,
    this.alignmentOffset,
    required this.dropdownMenuEntries,
    this.inputFormatters,
    this.textInputAction,
  }) : super(key: key);

  final bool enabled;
  final double? width;
  final double? menuHeight;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final Widget? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? selectedTrailingIcon;
  final bool enableFilter;
  final bool enableSearch;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final InputDecorationTheme? inputDecorationTheme;
  final MenuStyle? menuStyle;
  final TextEditingController? controller;
  final T? initialSelection;
  final void Function(T?)? onSelected;
  final FocusNode? focusNode;
  final bool? requestFocusOnTap;
  final EdgeInsetsGeometry? expandedInsets;
  final List<DropdownMenuEntry<T>> Function(List<DropdownMenuEntry<T>>, String)?
      filterCallback;
  final int? Function(List<DropdownMenuEntry<T>>, String)? searchCallback;
  final Offset? alignmentOffset;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final List<TextInputFormatter>? inputFormatters;
  final DropdownMenuCloseBehavior closeBehavior = DropdownMenuCloseBehavior.all;
  final int? maxLines = 1;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      enabled: enabled,
      width: width,
      menuHeight: menuHeight,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      label: label,
      hintText: hintText,
      helperText: helperText,
      errorText: errorText,
      selectedTrailingIcon: selectedTrailingIcon,
      enableFilter: enableFilter,
      enableSearch: enableSearch,
      keyboardType: keyboardType,
      textStyle: textStyle,
      textAlign: textAlign,
      inputDecorationTheme: inputDecorationTheme,
      menuStyle: menuStyle,
      controller: controller,
      initialSelection: initialSelection,
      onSelected: onSelected,
      focusNode: focusNode,
      requestFocusOnTap: requestFocusOnTap,
      expandedInsets: expandedInsets,
      filterCallback: filterCallback,
      searchCallback: searchCallback,
      alignmentOffset: alignmentOffset,
      dropdownMenuEntries: dropdownMenuEntries,
      inputFormatters: inputFormatters,
      closeBehavior: closeBehavior,
      maxLines: maxLines,
      textInputAction: textInputAction,
    );
  }
}
