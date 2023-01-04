import 'dart:convert';

import 'package:deriv_interview_app/cubits/socket_cubit.dart';
import 'package:deriv_interview_app/models/tick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceCubit extends Cubit<TickRes?> {
  PriceCubit(this.context) : super(null);
  final BuildContext context;

  void followPrice() {
    final socketStream = context.read<SocketCubit2>();
    socketStream.expStream.forEach((element) {
      final decoded = jsonDecode(element);
      final tick = TickRes.fromJson(decoded);
      emit(tick);
      print(tick);
    });
  }

  void unfollowPrice() {}
}
