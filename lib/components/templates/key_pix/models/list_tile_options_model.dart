import 'package:flutter/material.dart';

class ListTileOptionsModel {
  final String title;
  final String? subtitle;
  final Icon leadingIcon;
  final Icon trailingIcon;
  final void Function()? onTap;

  ListTileOptionsModel({
    required this.title,
    this.subtitle,
    required this.leadingIcon,
    required this.trailingIcon,
    this.onTap,
  });
}
