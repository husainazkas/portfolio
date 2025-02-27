import 'package:flutter/material.dart';

import '../../../resources/colors.dart';
import '../../../utils/color_utils.dart';

class Section extends StatelessWidget {
  const Section({super.key, this.titleKey, required this.title, this.children});

  final Key? titleKey;
  final String title;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleSection(title, key: titleKey),
          if (children != null) ...[
            const SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 36.0),
              child: DefaultTextStyle.merge(
                style: theme.textTheme.titleSmall?.copyWith(
                  color:
                      theme.isDarkMode
                          ? null
                          : ColorPalette.darkPrimaryColor.withValues(alpha: .8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children!,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(60.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
