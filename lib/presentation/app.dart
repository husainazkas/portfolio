import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs_cubits/theme_mode/theme_mode_cubit.dart';
import 'resources/theme.dart';
import 'routes/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeModeCubit>(
      create: (context) => ThemeModeCubit(),
      child: BlocBuilder<ThemeModeCubit, ThemeModeState>(
        builder: (context, state) => MaterialApp.router(
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
          routerDelegate: router.routerDelegate,
          title: 'Husain Fadhilah Azka S',
          themeMode: state.themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
        ),
      ),
    );
  }
}
