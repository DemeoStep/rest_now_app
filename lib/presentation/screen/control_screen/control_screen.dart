import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_now_app/app/localization/generated/l10n.dart';
import 'package:rest_now_app/data/model/failure.dart';
import 'package:rest_now_app/presentation/screen/control_screen/bloc/control_screen_cubit.dart';

class ControlScreen extends StatelessWidget {
  const ControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: BlocConsumer<ControlScreenCubit, ControlScreenState>(
              listener: (context, state) {
                if (state is ControlScreenSuccess) {
                  final massageState = state.data.state
                      ? S.of(context).started
                      : S.of(context).stopped;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(S.of(context).massageState(massageState)),
                    ),
                  );
                }
                if (state is ControlScreenFailure) {
                  final processString = state.data.state
                      ? S.of(context).stopMassage
                      : S.of(context).startMassage;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                          '${S.of(context).processError(processString.toLowerCase())}:\n\n${state.failure.getLocalizedMessage(context)}'),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is ControlScreenLoading) {
                  return const CircularProgressIndicator();
                }

                return ElevatedButton(
                  onPressed: () =>
                      context.read<ControlScreenCubit>().switchMassage(),
                  child: state.data.state
                      ? Text(S.of(context).stopMassage)
                      : Text(S.of(context).startMassage),
                );
              },
            ),
          ),
          Positioned(
            top: MediaQuery.paddingOf(context).top,
            left: 10,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
        ],
      ),
    );
  }
}
