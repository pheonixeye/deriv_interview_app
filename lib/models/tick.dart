import 'package:equatable/equatable.dart';

class TickRes extends Equatable {
  final Tick tick;

  const TickRes({required this.tick});

  factory TickRes.fromJson(dynamic json) {
    return TickRes(tick: Tick.fromJson(json['tick']));
  }

  @override
  List<Object?> get props => [tick];
}

class Tick extends Equatable {
  final double bid;

  const Tick({required this.bid});

  factory Tick.fromJson(dynamic json) {
    return Tick(
      bid: json['bid'],
    );
  }

  @override
  List<Object?> get props => [bid];
}
// {
//     "echo_req": {
//         "subscribe": 1,
//         "ticks": "R_50"
//     },
//     "msg_type": "tick",
//     "subscription": {
//         "id": "6f30f431-92a8-9d84-4957-f8dda08258c3"
//     },
//     "tick": {
//         "ask": 213.6809,
//         "bid": 213.6609,
//         "epoch": 1672693542,
//         "id": "6f30f431-92a8-9d84-4957-f8dda08258c3",
//         "pip_size": 4,
//         "quote": 213.6709,
//         "symbol": "R_50"
//     }
// }