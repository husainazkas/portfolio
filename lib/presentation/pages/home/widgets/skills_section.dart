import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'section.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection(this.title, {super.key});

  final String title;

  final List<Skill> _skills = const [
    Skill(title: 'Flutter', score: .75),
    Skill(title: 'C++', score: .05),
    Skill(title: 'Android Native (Kotlin)', score: .25),
    Skill(title: 'HTML, CSS', score: .2),
    Skill(title: 'Android Native (Java)', score: .25),
    Skill(title: 'NodeJS, JavaScript, TypeScript', score: .15),
    Skill(title: 'IOS Native (Swift)', score: .0),
    Skill(title: 'Version Control (GIT)', score: .65),
  ];

  @override
  Widget build(BuildContext context) {
    return Section(
      title: title,
      children: [
        AlignedGridView.count(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(right: 36.0),
          crossAxisCount: 2,
          crossAxisSpacing: 36.0,
          mainAxisSpacing: 16.0,
          itemCount: _skills.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => _SkillBar(_skills[index]),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('0-25% : Beginner'),
            Text('26-75% : Intermediate'),
            Text('76-100% : Advanced/Expert'),
          ],
        )
      ],
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_skill.title),
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

class Skill {
  final String title;
  final double score;

  const Skill({required this.title, required this.score});
}
