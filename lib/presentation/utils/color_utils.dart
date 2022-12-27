import 'package:flutter/material.dart';

Color sideBarColor(BuildContext context) {
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;

  return isDark
      ? theme.colorScheme.primaryContainer
      : theme.colorScheme.surface;
}
