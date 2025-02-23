import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs_cubits/theme_mode/theme_mode_cubit.dart';
import '../../../utils/color_utils.dart';
import '../../../widgets/cached_image.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
    required this.items,
    this.width = 304.0,
    this.shape,
    this.onTap,
  }) : assert(items.length > 0);

  final List<SideBarMenuItem> items;
  final void Function(BuildContext context, int index)? onTap;
  final double width;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final photoDimension = width * .6;
    return Drawer(
      width: width,
      shape: shape,
      backgroundColor: sideBarColor(context),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(width * .1),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CachedImage(
                      source: 'assets/images/profile_picture.jpg',
                      width: photoDimension,
                      height: photoDimension,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4.0),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Husain Fadhilah Azka Syamlan',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
                    TextButtonTheme(
                      data: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          fixedSize: Size.fromWidth(width),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24.0,
                            vertical: 20.0,
                          ),
                        ).merge(theme.textButtonTheme.style),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          items.length,
                          (index) => TextButton(
                            onPressed: () => onTap?.call(context, index),
                            child: Text(
                              items[index].label,
                              style: items[index].textStyle,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.read<ThemeModeCubit>().switchMode(theme.brightness);
                  },
                  icon: Icon(
                    theme.brightness == Brightness.light
                        ? Icons.light_mode_outlined
                        : Icons.light_mode,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SideBarMenuItem {
  final String label;
  final TextStyle? textStyle;

  const SideBarMenuItem({required this.label, this.textStyle});
}
