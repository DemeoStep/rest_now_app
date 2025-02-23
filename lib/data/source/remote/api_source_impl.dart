import 'dart:convert';

import 'package:rest_now_app/app/consts.dart';

import 'api_source.dart';
import 'package:http/http.dart' as http;

class ApiSourceImpl implements ApiSource {
  final String usersUrl = '${Consts.apiBaseUrl}/posts';

  @override
  Future<http.Response> makePay() async {
    final response = await http.get(Uri.parse(usersUrl));

    return response;
  }

  @override
  Future<http.Response> switchMassage({required bool state}) async {
    final body = {
      'title': 'foo',
      'body': 'bar',
      'userId': 1,
    };

    final response =
        await http.post(Uri.parse(usersUrl), body: jsonEncode(body));

    return response;
  }
}
