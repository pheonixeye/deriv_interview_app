import 'package:deriv_interview_app/cubits/market_cubit_select.dart';
import 'package:deriv_interview_app/cubits/markets_cubit.dart';
import 'package:deriv_interview_app/cubits/custom_symbols_cubit.dart';
import 'package:deriv_interview_app/cubits/price_cubit.dart';
import 'package:deriv_interview_app/cubits/selected_symbol_cubit.dart';
import 'package:deriv_interview_app/cubits/socket_cubit.dart';
import 'package:deriv_interview_app/cubits/symbols_cubit.dart';
import 'package:deriv_interview_app/screens/ticker_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(
    const Root(
      child: MyApp(),
    ),
  );
}

class Root extends StatelessWidget {
  const Root({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SocketCubit(),
        ),
        BlocProvider(
          create: (context) => SocketCubit2(),
        ),
        BlocProvider(
          create: (context) => SymbolsCubit(),
        ),
        BlocProvider(
          create: (context) => MarketsCubit(context),
        ),
        BlocProvider(
          create: (context) => MarketCubitSelect(),
        ),
        BlocProvider(
          create: (context) => CustomSymbolsCubit(context),
        ),
        BlocProvider(
          create: (context) => SelectedSymbolCubit(context),
        ),
        BlocProvider(
          create: (context) => PriceCubit(context),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deriv Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TickerScreen(),
    );
  }
}
