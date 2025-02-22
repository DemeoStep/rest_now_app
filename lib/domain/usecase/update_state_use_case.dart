import 'package:multiple_result/multiple_result.dart';
import 'package:rest_now_app/domain/entity/state_entity.dart';
import 'package:rest_now_app/domain/repository/local/store_repository.dart';

class UpdateStateUseCase {
  final StoreRepository _storeRepository;

  UpdateStateUseCase({required StoreRepository storeRepository})
      : _storeRepository = storeRepository;

  Result<void, Exception> call({required StateEntity newState}) =>
      _storeRepository.updateState(newState);
}
