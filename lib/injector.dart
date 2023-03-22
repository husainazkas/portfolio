import 'package:get_it/get_it.dart';

import 'domain/skills/repositories/i_skill_repository.dart';
import 'domain/skills/usecases/get_skills.dart';
import 'infrastructure/skills/datasources/skill_local_datasource.dart';
import 'infrastructure/skills/repositories/skill_repository.dart';
import 'presentation/blocs_cubits/skills_section/skills_section_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> initApp() async {
  _initSkillsSection();
}

void _initSkillsSection() {
  sl.registerLazySingleton<ISkillLocalDatasource>(
      () => AssetsSkillLocalDatasource());
  sl.registerLazySingleton<ISkillRepository>(() => SkillRepository(sl()));
  sl.registerLazySingleton(() => GetSkills(sl()));

  sl.registerFactory(() => SkillsSectionBloc(sl()));
}
