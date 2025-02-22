import 'package:get_it/get_it.dart';
import 'package:rest_now_app/data/repository/local/store_repository_impl.dart';
import 'package:rest_now_app/data/repository/remote/api_repository_impl.dart';
import 'package:rest_now_app/data/source/remote/api_source.dart';
import 'package:rest_now_app/data/source/remote/api_source_impl.dart';
import 'package:rest_now_app/domain/repository/local/store_repository.dart';
import 'package:rest_now_app/domain/repository/remote/api_repository.dart';
import 'package:rest_now_app/domain/usecase/make_pay_use_case.dart';
import 'package:rest_now_app/domain/usecase/read_state_use_case.dart';
import 'package:rest_now_app/domain/usecase/switch_massage_use_case.dart';
import 'package:rest_now_app/domain/usecase/update_state_use_case.dart';
import 'package:rest_now_app/presentation/screen/control_screen/bloc/control_screen_cubit.dart';
import 'package:rest_now_app/presentation/screen/payment_screen/bloc/payment_screen_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initDi(GetIt getIt) async {
  final prefs = await SharedPreferences.getInstance();

  getIt.registerSingleton<ApiSource>(ApiSourceImpl());
  getIt.registerSingleton<ApiRepository>(ApiRepositoryImpl(
    apiSource: GetIt.I<ApiSource>(),
  ));
  getIt.registerSingleton<StoreRepository>(StoreRepositoryImpl(prefs));
  getIt.registerSingleton<MakePayUseCase>(MakePayUseCase(
    apiRepository: GetIt.I<ApiRepository>(),
  ));
  getIt.registerSingleton<SwitchMassageUseCase>(SwitchMassageUseCase(
    apiRepository: GetIt.I<ApiRepository>(),
  ));
  getIt.registerSingleton<UpdateStateUseCase>(UpdateStateUseCase(
    storeRepository: GetIt.I<StoreRepository>(),
  ));
  getIt.registerSingleton<ReadStateUseCase>(ReadStateUseCase(
    storeRepository: GetIt.I<StoreRepository>(),
  ));

  getIt.registerFactory<PaymentScreenCubit>(() => PaymentScreenCubit(
        makePayUseCase: GetIt.I<MakePayUseCase>(),
        readStateUseCase: GetIt.I<ReadStateUseCase>(),
        updateStateUseCase: GetIt.I<UpdateStateUseCase>(),
      ));
  getIt.registerFactory<ControlScreenCubit>(() => ControlScreenCubit(
        switchMassageUseCase: GetIt.I<SwitchMassageUseCase>(),
        readStateUseCase: GetIt.I<ReadStateUseCase>(),
        updateStateUseCase: GetIt.I<UpdateStateUseCase>(),
      ));
}
