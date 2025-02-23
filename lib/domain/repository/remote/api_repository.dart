import 'package:multiple_result/multiple_result.dart';
import 'package:rest_now_app/data/model/failure.dart';
import 'package:rest_now_app/data/model/operation_status.dart';

abstract class ApiRepository {
  Future<Result<OperationStatus, Failure>> makePay();

  Future<Result<OperationStatus, Failure>> switchMassage({
    required bool state,
  });
}
