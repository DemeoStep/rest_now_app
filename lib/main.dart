import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_now_app/app/app.dart';
import 'package:rest_now_app/app/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi(GetIt.instance);
  runApp(const MyApp());
}
