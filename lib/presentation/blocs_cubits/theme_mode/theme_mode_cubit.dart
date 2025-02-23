import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_mode_state.dart';
part 'theme_mode_cubit.freezed.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(const ThemeModeState(ThemeMode.system));

  void switchMode(Brightness brightness) {
    emit(
      ThemeModeState(
        brightness == Brightness.light ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }
}
