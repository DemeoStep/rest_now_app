import 'package:multiple_result/multiple_result.dart';
import 'package:rest_now_app/domain/entity/state_entity.dart';

abstract class StoreRepository {
  Result<StateEntity, Exception> readState();

  Result<void, Exception> updateState(StateEntity state);
}
