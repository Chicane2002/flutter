import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p14_bloc_demo/screens/ink.dart';

import 'counter without cubit/counterforcubit.dart';
import 'cubit/counter_cubit.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CounterAppCubit(),
    child: MaterialApp(
      home: CounterAppCubit(),
      //InkDemo(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
