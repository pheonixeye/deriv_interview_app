import 'package:deriv_interview_app/cubits/symbols_cubit.dart';
import 'package:deriv_interview_app/models/market_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketsCubit extends Cubit<Markets?> {
  MarketsCubit(this.context) : super(null) {
    makeMarkets();
  }
  late Markets markets;
  final BuildContext context;
  void makeMarkets() {
    final symbols = context.read<SymbolsCubit>().state;
    markets = Markets.fromSymbols(symbols!);
    emit(markets);
  }
}
