import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_now_app/presentation/screen/payment_screen/bloc/payment_screen_cubit.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<PaymentScreenCubit, PaymentScreenState>(
          listener: (context, state) {
            if (state is PaymentScreenSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Payment Success'),
                ),
              );
              Navigator.of(context).pushNamed('/control');
            } else if (state is PaymentScreenFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Payment Failed'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is PaymentScreenLoading) {
              return const CircularProgressIndicator();
            }
            return ElevatedButton(
              onPressed: () => context.read<PaymentScreenCubit>().pay(),
              child: Text('Pay'),
            );
          },
        ),
      ),
    );
  }
}
