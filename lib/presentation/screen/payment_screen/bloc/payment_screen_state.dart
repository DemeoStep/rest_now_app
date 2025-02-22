part of 'payment_screen_cubit.dart';

@immutable
sealed class PaymentScreenState {}

final class PaymentScreenInitial extends PaymentScreenState {}

final class PaymentScreenLoading extends PaymentScreenState {}

final class PaymentScreenSuccess extends PaymentScreenState {}

final class PaymentScreenFailure extends PaymentScreenState {}
