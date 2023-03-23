import 'package:get_it/get_it.dart';

import 'domain/projects/repositories/i_project_repository.dart';
import 'domain/projects/usecases/get_projects.dart';
import 'domain/skills/repositories/i_skill_repository.dart';
import 'domain/skills/usecases/get_skills.dart';
import 'domain/work_experience/repositories/i_work_experience_repository.dart';
import 'domain/work_experience/usecases/get_work_experiences.dart';
import 'infrastructure/projects/datasources/project_local_datasource.dart';
import 'infrastructure/projects/repositories/project_repository.dart';
import 'infrastructure/skills/datasources/skill_local_datasource.dart';
import 'infrastructure/skills/repositories/skill_repository.dart';
import 'infrastructure/work_experience/datasources/work_experience_local_datasource.dart';
import 'infrastructure/work_experience/repositories/work_experience_repository.dart';
import 'presentation/blocs_cubits/projects_section/projects_section_bloc.dart';
import 'presentation/blocs_cubits/skills_section/skills_section_bloc.dart';
import 'presentation/blocs_cubits/work_experience_section/work_experience_section_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> initApp() async {
  _initSkillsSection();
  _initProjectsSection();
  _initWorkExperienceSection();
}

void _initSkillsSection() {
  sl.registerLazySingleton<ISkillLocalDatasource>(
      () => AssetsSkillLocalDatasource());
  sl.registerLazySingleton<ISkillRepository>(() => SkillRepository(sl()));
  sl.registerLazySingleton(() => GetSkills(sl()));

  sl.registerFactory(() => SkillsSectionBloc(sl()));
}

void _initProjectsSection() {
  sl.registerLazySingleton<IProjectLocalDatasource>(
      () => AssetsProjectLocalDatasource());
  sl.registerLazySingleton<IProjectRepository>(() => ProjectRepository(sl()));
  sl.registerLazySingleton(() => GetProjects(sl()));

  sl.registerFactory(() => ProjectsSectionBloc(sl()));
}

void _initWorkExperienceSection() {
  sl.registerLazySingleton<IWorkExperienceLocalDatasource>(
      () => AssetsWorkExperienceLocalDatasource());
  sl.registerLazySingleton<IWorkExperienceRepository>(
      () => WorkExperienceRepository(sl()));
  sl.registerLazySingleton(() => GetWorkExperiences(sl()));

  sl.registerFactory(() => WorkExperienceSectionBloc(sl()));
}
