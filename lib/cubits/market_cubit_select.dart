import 'package:flutter_bloc/flutter_bloc.dart';

class MarketCubitSelect extends Cubit<String?> {
  MarketCubitSelect() : super(null);

  void selectMarket(String? value) {
    emit(value);
  }
}
