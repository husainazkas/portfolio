import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../domain/core/failures.dart';
import '../../../domain/work_experience/entities/work_experience.dart';

abstract class IWorkExperienceLocalDatasource {
  Future<List<WorkExperience>> getWorkExperiences();
}

class AssetsWorkExperienceLocalDatasource
    implements IWorkExperienceLocalDatasource {
  @override
  Future<List<WorkExperience>> getWorkExperiences() async {
    try {
      final result =
          await rootBundle.loadString('assets/data/work_experience.json');
      return ((jsonDecode(result) as Map)['data'] as List?)
              ?.map((e) => WorkExperience.fromJson((e as Map).cast()))
              .toList() ??
          const [];
    } catch (e) {
      throw Failure.local(code: -1, message: e.toString());
    }
  }
}
