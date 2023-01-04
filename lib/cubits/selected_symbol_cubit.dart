import 'package:deriv_interview_app/cubits/socket_cubit.dart';
import 'package:deriv_interview_app/models/active_symbol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedSymbolCubit extends Cubit<ActiveSymbol?> {
  SelectedSymbolCubit(this.context) : super(null);

  final BuildContext context;
  void selectSymbol(ActiveSymbol? symbol) {
    emit(symbol);
    print(symbol);
    final socket = context.read<SocketCubit2>();
    if (symbol != null) {
      socket.sendSymbolsRequest(symbol.symbol);
    }
  }
}
