import 'package:deriv_interview_app/models/active_symbol.dart';
import 'package:equatable/equatable.dart';

class Markets extends Equatable {
  final List<String> markets;

  const Markets({required this.markets});

  factory Markets.fromSymbols(List<ActiveSymbol> symbols) {
    List<String> m = symbols.map((e) => e.market).toList();
    Set<String> mSet = m.toSet();
    return Markets(markets: mSet.toList());
  }

  @override
  List<Object?> get props => [markets];
}
