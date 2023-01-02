import 'package:equatable/equatable.dart';

class Market extends Equatable {
  final String displayName;
  final String symbol;
  final String market;

  const Market({
    required this.displayName,
    required this.symbol,
    required this.market,
  });

  factory Market.fromJson(dynamic json) {
    return Market(
      displayName: json['display_name'],
      symbol: json['symbol'],
      market: json['market'],
    );
  }

  static List<Market> mList(List<dynamic>? list) {
    if (list == null) return [];
    return list.map((e) => Market.fromJson(e)).toList();
  }

  @override
  List<Object?> get props => [displayName, symbol, market];
}
