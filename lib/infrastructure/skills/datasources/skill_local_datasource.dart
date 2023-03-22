import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../domain/core/failures.dart';
import '../../../domain/skills/entities/skill_section.dart';

abstract class ISkillLocalDatasource {
  Future<SkillSection> getSkills();
}

class AssetsSkillLocalDatasource implements ISkillLocalDatasource {
  @override
  Future<SkillSection> getSkills() async {
    try {
      final data = await rootBundle.loadString('assets/data/skills.json');

      return SkillSection.fromJson((jsonDecode(data) as Map).cast());
    } catch (e) {
      throw Failure.local(code: -1, message: e.toString());
    }
  }
}
