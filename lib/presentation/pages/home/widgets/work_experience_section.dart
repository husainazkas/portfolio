import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelines/timelines.dart';
import 'package:url_launcher/link.dart';

import '../../../../domain/work_experience/entities/work_experience.dart';
import '../../../../injector.dart';
import '../../../blocs_cubits/work_experience_section/work_experience_section_bloc.dart';
import '../../../utils/color_utils.dart';
import '../../../widgets/cached_image.dart';
import '../../../widgets/timeline_item_view.dart';
import 'section.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection(this.title, {super.key, this.titleKey});

  final Key? titleKey;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkExperienceSectionBloc>(
      create:
          (context) => sl()..add(const WorkExperienceSectionEvent.fetched()),
      child: Section(
        titleKey: titleKey,
        title: title,
        children: [
          BlocBuilder<WorkExperienceSectionBloc, WorkExperienceSectionState>(
            builder:
                (context, state) => state.maybeWhen(
                  loading:
                      () => const Center(
                        child: SizedBox.square(
                          dimension: 75.0,
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      ),
                  failure:
                      (failure) => Center(
                        child: Text(failure.message ?? 'Unknown Error'),
                      ),
                  success:
                      (experiences) => Column(
                        children: List.generate(experiences.length * 2 - 1, (
                          index,
                        ) {
                          final realIndex = index ~/ 2;
                          if (index.isOdd) {
                            return const SizedBox(height: 12.0);
                          }
                          return _ExperienceItemView(experiences[realIndex]);
                        }),
                      ),
                  orElse: () => const SizedBox(),
                ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceItemView extends StatelessWidget {
  const _ExperienceItemView(this._experience);

  final WorkExperience _experience;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 20.0),
      decoration: BoxDecoration(
        color: sideBarColor(context),
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      ),
      child: DefaultTextStyle.merge(
        style: const TextStyle(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  child: CachedImage(
                    source: _experience.thumb ?? '',
                    height: 56.0,
                  ),
                ),
                const SizedBox(width: 12.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Link(
                        uri: Uri.tryParse(_experience.url ?? ''),
                        target: LinkTarget.blank,
                        builder:
                            (context, followLink) => InkWell(
                              onTap: followLink,
                              child: Text(
                                _experience.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                      ),
                      Text(
                        _experience.period,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Text(
                        _experience.address,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Timeline.custom(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childrenDelegate: TimelineTileBuilderDelegate(
                      (context, index) => TimelineItemView(
                        _experience.timeline[index],
                        showStartLine: index > 0,
                        showEndLine: (index + 1) < _experience.timeline.length,
                        textColor: Colors.white,
                      ),
                      childCount: _experience.timeline.length,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Wrap(
                    spacing: 16.0,
                    runSpacing: 8.0,
                    children:
                        _experience.tags
                            .map((e) => Chip(label: Text(e)))
                            .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
