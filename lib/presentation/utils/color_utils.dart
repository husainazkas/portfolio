import 'package:flutter/material.dart';

Color sideBarColor(BuildContext context) {
  final theme = Theme.of(context);

  return theme.isDarkMode
      ? theme.colorScheme.primaryContainer
      : theme.colorScheme.surface;
}

Color headerColor(BuildContext context) {
  final theme = Theme.of(context);

  return theme.isDarkMode
      ? theme.colorScheme.surface
      : theme.colorScheme.primary;
}

extension ThemeExtension on ThemeData {
  bool get isDarkMode => brightness == Brightness.dark;
}
