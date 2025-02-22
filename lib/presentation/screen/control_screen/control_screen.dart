import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/control_screen_cubit.dart';

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
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Success'),
                    ),
                  );
                }
                if (state is ControlScreenFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Error'),
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
                      ? Text('Stop massage')
                      : Text('Start massage'),
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
