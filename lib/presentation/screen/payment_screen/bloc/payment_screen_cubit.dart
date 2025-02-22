import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_now_app/domain/usecase/make_pay_use_case.dart';
import 'package:rest_now_app/domain/usecase/read_state_use_case.dart';
import 'package:rest_now_app/domain/usecase/update_state_use_case.dart';

part 'payment_screen_state.dart';

class PaymentScreenCubit extends Cubit<PaymentScreenState> {
  final MakePayUseCase _makePayUseCase;
  final ReadStateUseCase _readStateUseCase;
  final UpdateStateUseCase _updateStateUseCase;

  PaymentScreenCubit({
    required MakePayUseCase makePayUseCase,
    required ReadStateUseCase readStateUseCase,
    required UpdateStateUseCase updateStateUseCase,
  })  : _makePayUseCase = makePayUseCase,
        _readStateUseCase = readStateUseCase,
        _updateStateUseCase = updateStateUseCase,
        super(PaymentScreenInitial(
          data: PaymentScreenStateData(
            lastPaymentDate: DateTime(0),
          ),
        )) {
    init();
  }

  void init() {
    final stateEntity = _readStateUseCase();

    stateEntity.when(
      (success) {
        emit(
          PaymentScreenInitial(
            data: PaymentScreenStateData(
              lastPaymentDate: success.paymentDate,
            ),
          ),
        );
      },
      (error) {
        emit(
          PaymentScreenFailure(
            data: state.data,
          ),
        );
      },
    );
  }

  Future<void> pay() async {
    emit(PaymentScreenLoading(
      data: state.data,
    ));

    Future.delayed(const Duration(seconds: 2), () async {
      final result = await _makePayUseCase();

      if (result.isError()) {
        emit(PaymentScreenFailure(
          data: state.data,
        ));
        return;
      }

      final stateEntity = _readStateUseCase();

      stateEntity.when(
        (success) {
          _updateStateUseCase(
              newState: success.copyWith(
            paymentDate: DateTime.now(),
          ));

          emit(PaymentScreenSuccess(
            data: PaymentScreenStateData(
              lastPaymentDate: DateTime.now(),
            ),
          ));
        },
        (error) {
          emit(
            PaymentScreenFailure(
              data: state.data,
            ),
          );
        },
      );
    });
  }
}
