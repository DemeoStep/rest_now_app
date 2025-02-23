import 'package:http/http.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rest_now_app/data/model/failure.dart';

mixin HttpResponseProcessor {
  Result<Response, Failure> process(Response response) {
    if (response.statusCode >= 500) {
      return Error(
        ServerFailure(
          statusCode: response.statusCode,
        ),
      );
    } else if (response.statusCode >= 400) {
      return Error(
        AppFailure(
          statusCode: response.statusCode,
        ),
      );
    }

    return Success(response);
  }
}
