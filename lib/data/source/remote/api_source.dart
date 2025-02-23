import 'package:http/http.dart';

abstract class ApiSource {
  Future<Response> makePay();
  Future<Response> switchMassage({required bool state});
}
