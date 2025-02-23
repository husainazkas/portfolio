import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../injector.dart';
import 'blocs_cubits/contact_section/contact_section_bloc.dart';
import 'blocs_cubits/theme_mode/theme_mode_cubit.dart';
import 'resources/theme.dart';
import 'routes/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeModeCubit>(create: (context) => ThemeModeCubit()),
        BlocProvider<ContactSectionBloc>(
          lazy: false,
          create: (context) => sl()..add(const ContactSectionEvent.fetched()),
        ),
      ],
      child: BlocBuilder<ThemeModeCubit, ThemeModeState>(
        builder:
            (context, state) => MaterialApp.router(
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
