import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rest_now_app/app/localization/generated/l10n.dart';
import 'package:rest_now_app/data/model/failure.dart';
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
                  content: Text(S.of(context).paymentSuccess),
                ),
              );
              Navigator.of(context).pushNamed('/control').then(
                (_) {
                  if (context.mounted) {
                    return context.read<PaymentScreenCubit>().init();
                  }
                },
              );
            } else if (state is PaymentScreenFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                      '${S.of(context).paymentFailed}:\n\n${state.failure.getLocalizedMessage(context)}'),
                ),
              );
            }
          },
          buildWhen: (previous, current) {
            return !(previous is PaymentScreenLoading &&
                current is PaymentScreenSuccess);
          },
          builder: (context, state) {
            if (state is PaymentScreenLoading) {
              return const CircularProgressIndicator();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<PaymentScreenCubit>().pay(),
                  child: Text(S.of(context).pay),
                ),
                Visibility(
                  visible: state.data.lastPaymentDate != DateTime(0),
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                        '${S.of(context).lastPayment}: ${DateFormat('dd MMMM yyy HH:mm').format(state.data.lastPaymentDate)}'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
