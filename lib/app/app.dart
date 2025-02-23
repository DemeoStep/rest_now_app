import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_now_app/app/localization/generated/l10n.dart';
import 'package:rest_now_app/presentation/screen/control_screen/bloc/control_screen_cubit.dart';
import 'package:rest_now_app/presentation/screen/control_screen/control_screen.dart';
import 'package:rest_now_app/presentation/screen/payment_screen/bloc/payment_screen_cubit.dart';
import 'package:rest_now_app/presentation/screen/payment_screen/payment_screen.dart';

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
      //locale: locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
