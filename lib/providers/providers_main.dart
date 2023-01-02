import 'package:deriv_interview_app/cubits/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final providers = [
  BlocProvider<CounterCubit>(
    create: (BuildContext context) => CounterCubit(),
  ),
];
