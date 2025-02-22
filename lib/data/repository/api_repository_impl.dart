import 'dart:developer';

import 'package:multiple_result/multiple_result.dart';
import 'package:rest_now_app/data/source/remote/api_source.dart';
import 'package:rest_now_app/domain/repository/remote/api_repository.dart';

class ApiRepositoryImpl implements ApiRepository {
  final ApiSource _apiSource;

  ApiRepositoryImpl({required ApiSource apiSource}) : _apiSource = apiSource;

  @override
  Future<Result<void, Exception>> makePay() async {
    try {
      final result = await _apiSource.makePay();

      if (result.statusCode >= 400) {
        return Error(Exception('Error'));
      }

      log(result.body);

      return const Success(null);
    } catch (e) {
      return Error(e as Exception);
    }
  }

  @override
  Future<Result<void, Exception>> switchMassage({
    required bool state,
  }) async {
    try {
      final result = await _apiSource.switchMassage(state: state);

      if (result.statusCode >= 400) {
        return Error(Exception('Error'));
      }

      log(result.body);

      return const Success(null);
    } catch (e) {
      return Error(e as Exception);
    }
  }
}
