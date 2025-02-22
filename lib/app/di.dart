import 'package:get_it/get_it.dart';
import 'package:rest_now_app/data/repository/api_repository_impl.dart';
import 'package:rest_now_app/data/source/remote/api_source.dart';
import 'package:rest_now_app/data/source/remote/api_source_impl.dart';
import 'package:rest_now_app/domain/repository/remote/api_repository.dart';
import 'package:rest_now_app/domain/usecase/make_pay_use_case.dart';
import 'package:rest_now_app/domain/usecase/switch_massage_use_case.dart';
import 'package:rest_now_app/presentation/screen/control_screen/bloc/control_screen_cubit.dart';
import 'package:rest_now_app/presentation/screen/payment_screen/bloc/payment_screen_cubit.dart';

void initDi(GetIt getIt) {
  getIt.registerSingleton<ApiSource>(ApiSourceImpl());
  getIt.registerSingleton<ApiRepository>(ApiRepositoryImpl(
    apiSource: GetIt.I<ApiSource>(),
  ));
  getIt.registerSingleton<MakePayUseCase>(MakePayUseCase(
    apiRepository: GetIt.I<ApiRepository>(),
  ));
  getIt.registerSingleton<SwitchMassageUseCase>(SwitchMassageUseCase(
    apiRepository: GetIt.I<ApiRepository>(),
  ));

  getIt.registerFactory<PaymentScreenCubit>(() => PaymentScreenCubit(
        makePayUseCase: GetIt.I<MakePayUseCase>(),
      ));
  getIt.registerFactory<ControlScreenCubit>(() => ControlScreenCubit(
        switchMassageUseCase: GetIt.I<SwitchMassageUseCase>(),
      ));
}
