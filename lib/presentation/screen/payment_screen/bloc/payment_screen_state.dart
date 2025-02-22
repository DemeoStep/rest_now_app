part of 'payment_screen_cubit.dart';

sealed class PaymentScreenState {
  final PaymentScreenStateData data;

  const PaymentScreenState({
    required this.data,
  });
}

final class PaymentScreenInitial extends PaymentScreenState {
  const PaymentScreenInitial({required super.data});
}

final class PaymentScreenLoading extends PaymentScreenState {
  const PaymentScreenLoading({required super.data});
}

final class PaymentScreenSuccess extends PaymentScreenState {
  const PaymentScreenSuccess({required super.data});
}

final class PaymentScreenFailure extends PaymentScreenState {
  const PaymentScreenFailure({required super.data});
}

final class PaymentScreenStateData {
  final DateTime lastPaymentDate;

  PaymentScreenStateData({
    required this.lastPaymentDate,
  });
}
