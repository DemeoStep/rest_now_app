import 'package:multiple_result/multiple_result.dart';
import 'package:rest_now_app/data/model/failure.dart';
import 'package:rest_now_app/domain/entity/state_entity.dart';
import 'package:rest_now_app/domain/repository/local/store_repository.dart';

class ReadStateUseCase {
  final StoreRepository _storeRepository;

  ReadStateUseCase({required StoreRepository storeRepository})
      : _storeRepository = storeRepository;

  Result<StateEntity, Failure> call() => _storeRepository.readState();
}
