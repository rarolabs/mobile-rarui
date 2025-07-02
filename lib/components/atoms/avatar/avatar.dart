import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RAvatar extends StatelessWidget {
  final double? badge;
  final Widget? child;
  final Color? backgroundColor;
  final ImageProvider<Object>? backgroundImage;
  final ImageProvider<Object>? foregroundImage;
  final ImageErrorListener? onBackgroundImageError;
  final ImageErrorListener? onForegroundImageError;
  final Color? foregroundColor;
  final double? radius;
  final double? minRadius;
  final double? maxRadius;

  const RAvatar({
    super.key,
    this.badge,
    this.child,
    this.backgroundColor,
    this.backgroundImage,
    this.foregroundImage,
    this.foregroundColor,
    this.radius,
    this.minRadius,
    this.maxRadius,
    this.onBackgroundImageError,
    this.onForegroundImageError,
  });

  BoxDecoration boxDecoration(Color badgeColor) {
    return BoxDecoration(
      color: badgeColor, // Background color
      borderRadius: BorderRadius.circular(20), // Rounded corners
    );
  }

  Center showBadge() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          badge.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: radius != null ? (radius! * 40 / 100) : 8,
          ),
        ),
      ),
    );
  }

  Container buildBadgedWidget(double? badge, Brightness brightness) {
    Color badgeColor = brightness == Brightness.dark
        ? const Color.fromARGB(255, 243, 91, 80)
        : Colors.red;
    if (badge != null) {
      if (badge < 100) {
        return Container(
          height: radius != null ? (radius! * 70 / 100) : 15,
          width: radius != null ? (radius! * 70 / 100) : 15,
          decoration: boxDecoration(badgeColor),
          child: showBadge(),
        );
      }
      return Container(
        height: radius != null ? (radius! * 70 / 100) : 15,
        decoration: boxDecoration(badgeColor),
        child: showBadge(),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: backgroundColor,
          backgroundImage: backgroundImage,
          foregroundImage: foregroundImage,
          foregroundColor: foregroundColor,
          radius: radius,
          minRadius: minRadius,
          maxRadius: maxRadius,
          onBackgroundImageError: onBackgroundImageError,
          onForegroundImageError: onForegroundImageError,
          child: child,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: buildBadgedWidget(badge, brightness),
        ),
      ],
    );
  }
}
