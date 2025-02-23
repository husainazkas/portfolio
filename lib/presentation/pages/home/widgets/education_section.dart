import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelines/timelines.dart';

import '../../../../domain/shared/entities/timeline_data.dart';
import '../../../../injector.dart';
import '../../../blocs_cubits/education_section/education_section_bloc.dart';
import '../../../utils/color_utils.dart';
import '../../../widgets/timeline_item_view.dart';
import 'section.dart';

class EducationSection extends StatelessWidget {
  const EducationSection(this.title, {super.key, this.titleKey});

  final Key? titleKey;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EducationSectionBloc>(
      create: (context) => sl()..add(const EducationSectionEvent.fetched()),
      child: Section(
        titleKey: titleKey,
        title: title,
        children: [
          BlocBuilder<EducationSectionBloc, EducationSectionState>(
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
                        child: Text(failure.message ?? 'Unknwon Error'),
                      ),
                  success: (data) => _EducationItemView(data),
                  orElse: () => const SizedBox(),
                ),
          ),
        ],
      ),
    );
  }
}

class _EducationItemView extends StatelessWidget {
  const _EducationItemView(this._education);

  final List<TimelineData> _education;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(26.0, 12.0, 26.0, 20.0),
      decoration: BoxDecoration(
        color: sideBarColor(context),
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      ),
      child: DefaultTextStyle.merge(
        style: const TextStyle(color: Colors.white),
        child: Timeline.custom(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childrenDelegate: TimelineTileBuilderDelegate(
            (context, index) => TimelineItemView(
              _education[index],
              showStartLine: index > 0,
              showEndLine: (index + 1) < _education.length,
              textColor: Colors.white,
            ),
            childCount: _education.length,
          ),
        ),
      ),
    );
  }
}
