import 'package:http/http.dart' as http;

abstract class ApiSource {
  Future<http.Response> makePay();
  Future<http.Response> switchMassage({required bool state});
}
