import 'package:multiple_result/multiple_result.dart';
import 'package:rest_now_app/app/http_processor.dart';
import 'package:rest_now_app/data/model/failure.dart';
import 'package:rest_now_app/data/model/operation_status.dart';
import 'package:rest_now_app/data/source/remote/api_source.dart';
import 'package:rest_now_app/domain/repository/remote/api_repository.dart';

class ApiRepositoryImpl with HttpResponseProcessor implements ApiRepository {
  final ApiSource _apiSource;

  ApiRepositoryImpl({required ApiSource apiSource}) : _apiSource = apiSource;

  @override
  Future<Result<OperationStatus, Failure>> makePay() async {
    try {
      final apiResult = await _apiSource.makePay();

      final result = process(apiResult);

      if (result.isError()) {
        final failure = result.tryGetError();

        if (failure != null) {
          return Error(failure);
        }
      }

      return Success(OperationStatus.success);
    } catch (e) {
      return Error(
          AppFailure(exception: e as Exception, message: e.toString()));
    }
  }

  @override
  Future<Result<OperationStatus, Failure>> switchMassage({
    required bool state,
  }) async {
    try {
      final apiResult = await _apiSource.switchMassage(state: state);

      final result = process(apiResult);

      if (result.isError()) {
        final failure = result.tryGetError();

        if (failure != null) {
          return Error(failure);
        }
      }

      return Success(OperationStatus.success);
    } catch (e) {
      return Error(AppFailure(message: e.toString()));
    }
  }
}
