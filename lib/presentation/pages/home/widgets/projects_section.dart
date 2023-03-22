import 'package:flutter/material.dart';

import '../../../utils/color_utils.dart';
import '../../../widgets/cached_image.dart';
import '../../../widgets/expandable_group.dart';
import 'section.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Section(
      title: title,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: sideBarColor(context),
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            child: ExpandableGroup(
              items: [
                ExpandableItem(
                  headerBuilder: (isExpanded) => const Text('data213'),
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: _ProjectItemCard(
                      imageUrl:
                          'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/orange-and-black-design-template-logo-icon-d225e1dce23b44a25e755e220779b9ca_screen.jpg?ts=1596483534',
                      description:
                          'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Incidunt, iste. Doloremque, libero nobis ipsam neque obcaecati reprehenderit porro incidunt, magnam nemo unde, omnis cupiditate dolores? Voluptatibus, ex! Ut, neque nihil?',
                      onTap: () {},
                      tags: const ['Kotlin', 'Java', 'Android Studio'],
                    ),
                  ),
                ),
                ExpandableItem(
                  headerBuilder: (isExpanded) => const Text('data waokaw'),
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: const [
                        Text('data'),
                        Text('anjay'),
                      ],
                    ),
                  ),
                ),
                ExpandableItem(
                  headerBuilder: (isExpanded) => const Text('data'),
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: const [
                        Text('data'),
                        Text('anjay'),
                      ],
                    ),
                  ),
                ),
                ExpandableItem(
                  headerBuilder: (isExpanded) => const Text('data hehe'),
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: const [
                        Text('data'),
                        Text('anjay'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ProjectItemCard extends StatelessWidget {
  const _ProjectItemCard({
    required this.imageUrl,
    required this.description,
    this.onTap,
    this.tags = const [],
  });

  final String imageUrl;
  final String description;
  final VoidCallback? onTap;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageWidth = size.width * .2;
    final isSmaller = size.width < 1024;

    List<Widget>? tagsChip;
    if (tags.isNotEmpty) {
      tagsChip = [
        const SizedBox(height: 12.0),
        Wrap(
          spacing: 16.0,
          runSpacing: 8.0,
          children: tags.map((e) => Chip(label: Text(e))).toList(),
        )
      ];
    }

    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            !isSmaller
                ? _buildRowCard(imageWidth, chips: tagsChip)
                : _buildColumnCard(imageWidth, chips: tagsChip),
          ],
        ),
      ),
    );
  }

  Widget _buildColumnCard(double width, {List<Widget>? chips}) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: double.infinity,
            maxHeight: width * 1.2,
          ),
          child: AspectRatio(
            aspectRatio: 6 / 4,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: CachedImage(
                source: imageUrl,
                width: width,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            if (chips != null) ...chips,
          ],
        ),
      ],
    );
  }

  Widget _buildRowCard(double width, {List<Widget>? chips}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: width * .5),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            child: CachedImage(
              source: imageUrl,
              width: width,
            ),
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(description),
              if (chips != null) ...chips,
            ],
          ),
        ),
      ],
    );
  }
}
