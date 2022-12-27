import 'package:flutter/material.dart';

import '../../../widgets/cached_image.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
    required this.items,
    this.width = 304.0,
    this.onTap,
  }) : assert(items.length > 0);

  final List<SideBarMenuItem> items;
  final ValueChanged<int>? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final photoDimension = width * .6;
    return Drawer(
      width: width,
      backgroundColor: theme.colorScheme.primaryContainer,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(width * .1),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: photoDimension,
                height: photoDimension,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                foregroundDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4.0),
                ),
                child: const CachedImage(source: ''),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Husain Fadhilah Azka Syamlan',
                style: theme.textTheme.headline6?.copyWith(color: Colors.white),
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
                      onPressed: () => onTap?.call(index),
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
    );
  }
}

class SideBarMenuItem {
  final String label;
  final TextStyle? textStyle;

  const SideBarMenuItem({required this.label, this.textStyle});
}
