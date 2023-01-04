import 'package:deriv_interview_app/cubits/market_cubit_select.dart';
import 'package:deriv_interview_app/cubits/symbols_cubit.dart';
import 'package:deriv_interview_app/models/active_symbol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSymbolsCubit extends Cubit<List<ActiveSymbol>> {
  CustomSymbolsCubit(this.context) : super([]);

  final BuildContext context;

  void makeCustomList() {
    final originalSymbols = context.read<SymbolsCubit>().state;
    if (originalSymbols == null) {
      emit([]);
    } else {
      var selectedMarket = context.read<MarketCubitSelect>().state;
      state.clear();
      originalSymbols.map((e) {
        if (e.market == selectedMarket) state.add(e);
      }).toList();
      emit(state);
    }
  }
}
