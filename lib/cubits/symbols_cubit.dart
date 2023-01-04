import 'dart:convert';

import 'package:deriv_interview_app/models/active_symbol.dart';
import 'package:deriv_interview_app/repo/repo_cubit.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SymbolsCubit extends Cubit<List<ActiveSymbol>?> {
  SymbolsCubit() : super(null) {
    fetchSymbols();
  }

  void fetchSymbols() {
    final repo = RepoCubit();
    repo.sendRequest(
      {
        "active_symbols": "full",
        "product_type": "basic",
      },
      RequestType.Fetch,
    );
    repo.state.streamController.stream.listen((event) {
      final decoded = jsonDecode(event);
      final List<ActiveSymbol> symbols =
          ActiveSymbol.sList(decoded['active_symbols']);
      emit(symbols);
    });
  }
}
