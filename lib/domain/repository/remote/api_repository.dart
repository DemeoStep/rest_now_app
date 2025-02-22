import 'package:multiple_result/multiple_result.dart';

abstract class ApiRepository {
  Future<Result<void, Exception>> makePay();

  Future<Result<void, Exception>> switchMassage({
    required bool state,
  });
}
