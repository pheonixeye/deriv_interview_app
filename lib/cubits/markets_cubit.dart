import 'dart:convert';

import 'package:deriv_interview_app/cubits/socket_cubit.dart';
import 'package:deriv_interview_app/models/market.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketsCubit extends Cubit<List<Market>> {
  MarketsCubit(this.context) : super([]) {
    occupyList();
  }
  final BuildContext context;

  void occupyList() {
    context.read<SocketCubit>().expStream.listen((event) {
      final decoded = jsonDecode(event);
      state.addAll(Market.mList(decoded['active_symbols']));
      emit(state);
    });
  }
}
