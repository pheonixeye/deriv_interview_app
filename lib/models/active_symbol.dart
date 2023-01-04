import 'package:equatable/equatable.dart';

class ActiveSymbol extends Equatable {
  final String displayName;
  final String symbol;
  final String market;

  const ActiveSymbol({
    required this.displayName,
    required this.symbol,
    required this.market,
  });

  factory ActiveSymbol.fromJson(dynamic json) {
    return ActiveSymbol(
      displayName: json['display_name'],
      symbol: json['symbol'],
      market: json['market'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'display_name': displayName,
      'symbol': symbol,
      'market': market,
    };
  }

  static List<ActiveSymbol> sList(List<dynamic>? list) {
    if (list == null) return [];
    return list.map((e) => ActiveSymbol.fromJson(e)).toList();
  }

  static List<dynamic> sListToJson(List<ActiveSymbol>? list) {
    if (list == null) return [];
    return list.map((e) => e.toJson()).toList();
  }

  @override
  List<Object?> get props => [displayName, symbol, market];
}
