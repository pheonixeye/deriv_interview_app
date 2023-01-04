import 'package:deriv_interview_app/models/active_symbol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedSymbolCubit extends Cubit<ActiveSymbol?> {
  SelectedSymbolCubit(this.context) : super(null);

  final BuildContext context;
  void selectSymbol(ActiveSymbol? symbol) {
    emit(symbol);
  }
}
