import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rest_now_app/domain/usecase/make_pay_use_case.dart';

part 'payment_screen_state.dart';

class PaymentScreenCubit extends Cubit<PaymentScreenState> {
  final MakePayUseCase _makePayUseCase;

  PaymentScreenCubit({
    required MakePayUseCase makePayUseCase,
  })  : _makePayUseCase = makePayUseCase,
        super(PaymentScreenInitial());

  Future<void> pay() async {
    emit(PaymentScreenLoading());
    Future.delayed(const Duration(seconds: 2), () async {
      final result = await _makePayUseCase();

      if (result.isError()) {
        emit(PaymentScreenFailure());
        return;
      }

      emit(PaymentScreenSuccess());
    });
  }
}
