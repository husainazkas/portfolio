import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelines/timelines.dart';

import '../../../../domain/work_experience/entities/work_experience.dart';
import '../../../../injector.dart';
import '../../../blocs_cubits/work_experience_section/work_experience_section_bloc.dart';
import '../../../widgets/cached_image.dart';
import '../../../widgets/timeline_item_view.dart';
import 'section.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkExperienceSectionBloc>(
      create: (context) =>
          sl()..add(const WorkExperienceSectionEvent.fetched()),
      child: Section(
        title: title,
        children: [
          BlocBuilder<WorkExperienceSectionBloc, WorkExperienceSectionState>(
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
              success: (experiences) => Column(
                children:
                    experiences.map((e) => _ExperienceItemView(e)).toList(),
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
    return Column(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: _experience.url != null ? () {} : null,
                  child: Text(
                    _experience.name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Text(
                  _experience.period,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.75),
                  ),
                ),
                Text(
                  _experience.address,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.75),
                  ),
                )
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14.0, top: 8.0),
          child: Timeline.custom(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childrenDelegate: TimelineTileBuilderDelegate(
              (context, index) => TimelineItemView(
                _experience.timeline[index],
                showStartLine: index > 0,
                showEndLine: (index + 1) < _experience.timeline.length,
              ),
              childCount: _experience.timeline.length,
            ),
          ),
        )
      ],
    );
  }
}
