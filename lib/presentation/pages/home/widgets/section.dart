import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.title,
    this.children,
  });

  final String title;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleSection(title),
          if (children != null) ...[
            const SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: DefaultTextStyle.merge(
                style: Theme.of(context).textTheme.titleSmall,
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
