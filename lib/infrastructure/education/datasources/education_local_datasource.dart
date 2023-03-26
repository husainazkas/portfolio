import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../domain/core/failures.dart';
import '../../../domain/education/entities/education.dart';

abstract class IEducationLocalDatasource {
  Future<List<Education>> getEducations();
}

class AssetsEducationLocalDatasource implements IEducationLocalDatasource {
  @override
  Future<List<Education>> getEducations() async {
    try {
      final result = await rootBundle.loadString('assets/data/educations.json');
      return ((jsonDecode(result) as Map)['data'] as List?)
              ?.map((e) => Education.fromJson((e as Map).cast()))
              .toList() ??
          const [];
    } catch (e) {
      throw Failure.local(code: -1, message: e.toString());
    }
  }
}
