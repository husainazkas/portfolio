part of 'scroll_listener_cubit.dart';

@freezed
class ScrollListenerState with _$ScrollListenerState {
  const factory ScrollListenerState([@Default(0.0) double offset]) =
      _ScrollListenerState;

  factory ScrollListenerState.initial() => const ScrollListenerState(0.0);
}
