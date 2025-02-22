import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_now_app/app/di.dart';
import 'package:rest_now_app/presentation/screen/control_screen/bloc/control_screen_cubit.dart';
import 'package:rest_now_app/presentation/screen/control_screen/control_screen.dart';
import 'package:rest_now_app/presentation/screen/payment_screen/bloc/payment_screen_cubit.dart';
import 'package:rest_now_app/presentation/screen/payment_screen/payment_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi(GetIt.instance);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RestNow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider(
              create: (context) => GetIt.I.get<PaymentScreenCubit>(),
              child: const PaymentScreen(),
            ),
        '/control': (context) => BlocProvider(
              create: (context) => GetIt.I.get<ControlScreenCubit>(),
              child: const ControlScreen(),
            ),
      },
    );
  }
}
