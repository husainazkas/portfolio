import 'package:flutter/material.dart';

import '../resources/custom_icons.dart';
import '../utils/color_utils.dart';

class SocialButton extends StatelessWidget {
  const SocialButton(this.iconSrc, {super.key, this.iconSize = 16.0, this.onPressed});

  final String? iconSrc;
  final double? iconSize;
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
        if (iconSrc?.startsWith('assets') ?? false) {
        } else if (iconSrc?.startsWith('http') ?? false) {}
        return const SizedBox();
    }
  }
}
