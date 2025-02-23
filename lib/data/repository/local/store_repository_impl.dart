import 'dart:convert';

import 'package:multiple_result/multiple_result.dart';
import 'package:rest_now_app/data/mappers/state_mapper.dart';
import 'package:rest_now_app/data/model/failure.dart';
import 'package:rest_now_app/data/model/operation_status.dart';
import 'package:rest_now_app/data/model/state_model.dart';
import 'package:rest_now_app/domain/entity/state_entity.dart';
import 'package:rest_now_app/domain/repository/local/store_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreRepositoryImpl implements StoreRepository {
  StateEntity _state = StateEntity.empty();

  final mapper = StateMapper();

  final SharedPreferences _prefs;

  StoreRepositoryImpl(SharedPreferences prefs) : _prefs = prefs;

  @override
  Result<StateEntity, Failure> readState() {
    try {
      if (_state != StateEntity.empty()) {
        return Success(_state);
      }

      final data = _prefs.getString('state');

      if (data != null) {
        _state = mapper.fromModel(StateModel.fromJson(jsonDecode(data)));
        return Success(_state);
      }

      return Error(StorageFailure());
    } catch (e) {
      return Error(StorageFailure());
    }
  }

  @override
  Result<OperationStatus, Failure> updateState(StateEntity state) {
    try {
      _state = state;

      final data = mapper.toModel(_state);

      _prefs.setString('state', jsonEncode(data.toJson()));
      return Success(OperationStatus.success);
    } catch (e) {
      return Error(StorageFailure());
    }
  }
}
