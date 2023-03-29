import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector.dart';
import '../../../blocs_cubits/projects_section/projects_section_bloc.dart';
import '../../../utils/color_utils.dart';
import '../../../widgets/cached_image.dart';
import '../../../widgets/expandable_group.dart';
import 'section.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection(this.title, {super.key, this.titleKey});

  final Key? titleKey;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProjectsSectionBloc>(
      create: (context) => sl()..add(const ProjectsSectionEvent.fetched()),
      child: Section(
        titleKey: titleKey,
        title: title,
        children: [
          BlocBuilder<ProjectsSectionBloc, ProjectsSectionState>(
            builder: (context, state) => state.maybeWhen(
              loading: () => const Center(
                child: SizedBox.square(
                  dimension: 75.0,
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
              failure: (failure) => Center(
                child: Text(failure.message ?? 'Unknown Error'),
              ),
              success: (projects) {
                if (projects.isEmpty) return const SizedBox();

                return Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: sideBarColor(context),
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    child: ExpandableGroup(
                      items: projects
                          .map((e) => ExpandableItem(
                                headerBuilder: (isExpanded) => Text(e.title),
                                content: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: _ProjectItemCard(
                                    imageUrl: e.thumb ?? '',
                                    description: e.description,
                                    tags: e.tags,
                                    onTap: () {},
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                );
              },
              orElse: () => const SizedBox(),
            ),
          ),
        ],
      ),
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
