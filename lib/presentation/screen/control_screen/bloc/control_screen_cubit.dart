import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rest_now_app/domain/usecase/switch_massage_use_case.dart';

part 'control_screen_state.dart';

class ControlScreenCubit extends Cubit<ControlScreenState> {
  final SwitchMassageUseCase _switchMassageUseCase;

  ControlScreenCubit({
    required SwitchMassageUseCase switchMassageUseCase,
  })  : _switchMassageUseCase = switchMassageUseCase,
        super(ControlScreenInitial(data: ControlScreenStateData()));

  Future<void> switchMassage() async {
    emit(ControlScreenLoading(data: state.data));
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        final result = await _switchMassageUseCase(state: !state.data.state);

        if (result.isError()) {
          emit(ControlScreenFailure(data: state.data));
          return;
        }

        emit(
          ControlScreenSuccess(
            data: ControlScreenStateData(
              state: !state.data.state,
            ),
          ),
        );
      },
    );
  }
}
