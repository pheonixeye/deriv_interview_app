import 'dart:convert';

import 'package:deriv_interview_app/models/tick.dart';
import 'package:deriv_interview_app/repo/repo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class PriceCubit extends HydratedCubit<TickRes?> {
  PriceCubit(this.context) : super(null) {
    hydrate();
  }
  final BuildContext context;
  final repo = RepoCubit();

  void followPrice(String symbol) {
    repo.sendRequest({
      "ticks": symbol,
      "subscribe": 1,
    }, RequestType.Fetch);
    repo.state.streamController.stream.listen((event) {
      try {
        final decoded = jsonDecode(event);
        final tick = TickRes.fromJson(decoded);
        emit(tick);
        print(tick);
      } catch (e) {
        emit(null);
        print('error');
      }
    });
  }

  void unfollowPrice() {
    if (state != null) {
      repo.sendRequest(
        {"forget": state!.tick.id},
        RequestType.Forget,
      );
    }
  }

  @override
  TickRes? fromJson(Map<String, dynamic> json) {
    return TickRes.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TickRes? state) {
    return state?.toJson();
  }
}
