import 'package:multiple_result/multiple_result.dart';
import 'package:rest_now_app/domain/repository/remote/api_repository.dart';

class MakePayUseCase {
  final ApiRepository _apiRepository;

  MakePayUseCase({
    required ApiRepository apiRepository,
  }) : _apiRepository = apiRepository;

  Future<Result<void, Exception>> call() => _apiRepository.makePay();
}
