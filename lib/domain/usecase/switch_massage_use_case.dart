import 'package:multiple_result/multiple_result.dart';
import 'package:rest_now_app/data/model/failure.dart';
import 'package:rest_now_app/data/model/operation_status.dart';
import 'package:rest_now_app/domain/repository/remote/api_repository.dart';

class SwitchMassageUseCase {
  final ApiRepository _apiRepository;

  SwitchMassageUseCase({
    required ApiRepository apiRepository,
  }) : _apiRepository = apiRepository;

  Future<Result<OperationStatus, Failure>> call({
    required bool state,
  }) =>
      _apiRepository.switchMassage(state: state);
}
