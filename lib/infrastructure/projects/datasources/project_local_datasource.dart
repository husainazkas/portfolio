import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../domain/core/failures.dart';
import '../../../domain/projects/entities/project_group.dart';

abstract class IProjectLocalDatasource {
  Future<List<ProjectGroup>> getProjects();
}

class AssetsProjectLocalDatasource implements IProjectLocalDatasource {
  @override
  Future<List<ProjectGroup>> getProjects() async {
    try {
      final result = await rootBundle.loadString('assets/data/projects.json');
      return ((jsonDecode(result) as Map)['data'] as List?)
              ?.map((e) => ProjectGroup.fromJson((e as Map).cast()))
              .toList() ??
          const [];
    } catch (e) {
      throw Failure.local(code: -1, message: e.toString());
    }
  }
}
