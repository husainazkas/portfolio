import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scroll_listener_state.dart';
part 'scroll_listener_cubit.freezed.dart';

class ScrollListenerCubit extends Cubit<ScrollListenerState> {
  ScrollListenerCubit() : super(ScrollListenerState.initial());

  void onUpdateScrollPosition(double offset) =>
      emit(state.copyWith(offset: offset));
}
