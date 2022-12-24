import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
    required this.items,
    this.width,
    this.onTap,
  }) : assert(items.length > 0);

  final List<SideBarMenuItem> items;
  final ValueChanged<int>? onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      width: width,
      backgroundColor: theme.colorScheme.primaryContainer,
      child: Center(
        child: TextButtonTheme(
          data: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor:
                  theme.brightness == Brightness.dark ? Colors.white : null,
              fixedSize: Size.fromWidth((width ?? 304) * .8),
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 20.0,
              ),
            ),
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
      ),
    );
  }
}

class SideBarMenuItem {
  final String label;
  final TextStyle? textStyle;

  const SideBarMenuItem({required this.label, this.textStyle});
}
