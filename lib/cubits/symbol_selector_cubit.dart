import 'package:deriv_interview_app/models/market.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SymbolSelectorCubit extends Cubit<Market?> {
  SymbolSelectorCubit() : super(null);

  void select(Market? value) {
    if (state == null) {
      emit(value);
    } else {
      emit(state);
    }
  }
}
