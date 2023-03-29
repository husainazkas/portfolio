import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../domain/skills/entities/skill.dart';
import '../../../../injector.dart';
import '../../../blocs_cubits/skills_section/skills_section_bloc.dart';
import 'section.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection(this.title, {super.key, this.titleKey});

  final Key? titleKey;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SkillsSectionBloc>(
      create: (context) => sl()..add(const SkillsSectionEvent.fetched()),
      child: Section(
        titleKey: titleKey,
        title: title,
        children: [
          BlocBuilder<SkillsSectionBloc, SkillsSectionState>(
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
              success: (data) => AlignedGridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 36.0,
                mainAxisSpacing: 16.0,
                itemCount: data.skills.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => _SkillBar(data.skills[index]),
              ),
              orElse: () => const SizedBox(),
            ),
          ),
          const SizedBox(height: 16.0),
          BlocBuilder<SkillsSectionBloc, SkillsSectionState>(
            builder: (context, state) => state.maybeWhen(
              success: (data) {
                final List<Widget> children = [];
                for (int i = 0; i < data.thresholds.length; i++) {
                  final curr = data.thresholds[i];
                  final next = (i + 1) == data.thresholds.length
                      ? null
                      : data.thresholds[i + 1];
                  children.add(Text(
                    '${curr.value * 100}-${next != null ? next.value * 100 - 1 : '100'}% : ${curr.label}',
                  ));
                }

                return SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 24.0,
                    runSpacing: 8.0,
                    children: children,
                  ),
                );
              },
              orElse: () => const SizedBox(),
            ),
          )
        ],
      ),
    );
  }
}

class _SkillBar extends StatelessWidget {
  const _SkillBar(this._skill);

  final Skill _skill;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.onBackground;
    final backgroundColor = color.withOpacity(.35);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(_skill.title)),
            Text(
              '${_skill.score * 100}%',
              style: const TextStyle(fontSize: 12.0),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(60.0)),
          child: LinearProgressIndicator(
            value: _skill.score,
            color: color,
            backgroundColor: backgroundColor,
            minHeight: 12.0,
          ),
        )
      ],
    );
  }
}
