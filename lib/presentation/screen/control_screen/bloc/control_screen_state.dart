part of 'control_screen_cubit.dart';

sealed class ControlScreenState {
  final ControlScreenStateData data;

  const ControlScreenState({
    required this.data,
  });
}

final class ControlScreenInitial extends ControlScreenState {
  const ControlScreenInitial({required super.data});
}

final class ControlScreenLoading extends ControlScreenState {
  const ControlScreenLoading({required super.data});
}

final class ControlScreenSuccess extends ControlScreenState {
  const ControlScreenSuccess({required super.data});
}

final class ControlScreenFailure extends ControlScreenState {
  const ControlScreenFailure({required super.data});
}

final class ControlScreenStateData {
  final bool state;

  ControlScreenStateData({
    this.state = false,
  });
}
