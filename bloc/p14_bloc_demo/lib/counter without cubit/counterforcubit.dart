import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';

class CounterAppCubit extends StatefulWidget {
  const CounterAppCubit({super.key});

  @override
  State<CounterAppCubit> createState() => _CounterAppCubitState();
}

class _CounterAppCubitState extends State<CounterAppCubit> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is CounterAdd) {
          } else if (state is CounterSub) {}
        },
        child: Column(
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text('The current count is: $count');
              },
            ),
            Row(
              children: [
                MaterialButton(
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                    },
                    child: const Text('Increase')),
                MaterialButton(
                    onPressed: () {
                      setState(() {
                        count--;
                      });
                    },
                    child: const Text('Decrease'))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
