import 'package:multiple_result/multiple_result.dart';
import 'package:rest_now_app/data/model/failure.dart';
import 'package:rest_now_app/data/model/operation_status.dart';
import 'package:rest_now_app/domain/entity/state_entity.dart';

abstract class StoreRepository {
  Result<StateEntity, Failure> readState();

  Result<OperationStatus, Failure> updateState(StateEntity state);
}
