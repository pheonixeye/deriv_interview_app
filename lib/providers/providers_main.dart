import 'package:deriv_interview_app/cubits/markets_cubit.dart';
import 'package:deriv_interview_app/cubits/socket_cubit.dart';
import 'package:deriv_interview_app/cubits/symbol_selector_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final providers = [
  BlocProvider<SocketCubit>(
    create: (context) => SocketCubit(),
  ),
  BlocProvider<MarketsCubit>(
    create: (context) => MarketsCubit(context),
  ),
  BlocProvider<SymbolSelectorCubit>(
    create: (context) => SymbolSelectorCubit(),
  ),
];
