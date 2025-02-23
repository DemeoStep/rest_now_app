import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_now_app/data/model/failure.dart';
import 'package:rest_now_app/domain/usecase/read_state_use_case.dart';
import 'package:rest_now_app/domain/usecase/switch_massage_use_case.dart';
import 'package:rest_now_app/domain/usecase/update_state_use_case.dart';

part 'control_screen_state.dart';

class ControlScreenCubit extends Cubit<ControlScreenState> {
  final SwitchMassageUseCase _switchMassageUseCase;
  final ReadStateUseCase _readStateUseCase;
  final UpdateStateUseCase _updateStateUseCase;

  ControlScreenCubit({
    required SwitchMassageUseCase switchMassageUseCase,
    required ReadStateUseCase readStateUseCase,
    required UpdateStateUseCase updateStateUseCase,
  })  : _switchMassageUseCase = switchMassageUseCase,
        _readStateUseCase = readStateUseCase,
        _updateStateUseCase = updateStateUseCase,
        super(ControlScreenInitial(data: ControlScreenStateData())) {
    _init();
  }

  void _init() {
    final stateEntity = _readStateUseCase();

    stateEntity.when(
      (success) {
        emit(
          ControlScreenSuccess(
            data: ControlScreenStateData(
              state: success.massageState,
            ),
          ),
        );
      },
      (error) {
        emit(
          ControlScreenFailure(
            data: state.data,
            failure: error,
          ),
        );
      },
    );
  }

  Future<void> switchMassage() async {
    emit(ControlScreenLoading(data: state.data));
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        final result = await _switchMassageUseCase(state: !state.data.state);

        if (result.isError()) {
          final failure = result.tryGetError();
          if (failure != null) {
            emit(ControlScreenFailure(data: state.data, failure: failure));
          }
          return;
        }

        final stateEntity = _readStateUseCase();

        stateEntity.when(
          (success) {
            _updateStateUseCase(
              newState: success.copyWith(
                massageState: !state.data.state,
              ),
            );

            emit(
              ControlScreenSuccess(
                data: ControlScreenStateData(
                  state: !state.data.state,
                ),
              ),
            );
          },
          (error) {
            emit(
              ControlScreenFailure(
                data: state.data,
                failure: error,
              ),
            );
          },
        );
      },
    );
  }
}
