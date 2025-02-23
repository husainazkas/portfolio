import 'package:flutter/material.dart';

import '../resources/custom_icons.dart';
import '../utils/color_utils.dart';
import 'cached_image.dart';

class SocialButton extends StatelessWidget {
  const SocialButton(
    this.iconSrc, {
    super.key,
    this.iconSize = 16.0,
    this.width,
    this.height,
    this.onPressed,
  });

  final String? iconSrc;
  final double? iconSize;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    switch (iconSrc) {
      case 'linkedin':
        return IconButton(
          onPressed: onPressed,
          iconSize: iconSize,
          padding: EdgeInsets.zero,
          icon: const Icon(CustomIcons.linkedin),
          color: sideBarColor(context),
        );
      case 'github':
        return IconButton(
          onPressed: onPressed,
          iconSize: iconSize,
          padding: EdgeInsets.zero,
          icon: const Icon(CustomIcons.github),
          color: sideBarColor(context),
        );
      default:
        if (iconSrc != null &&
            (iconSrc!.startsWith('assets') || iconSrc!.startsWith('http'))) {
          return CachedImage(source: iconSrc!, width: width, height: height);
        }
        return const SizedBox();
    }
  }
}
