class TickRes {
  final Tick tick;

  TickRes({required this.tick});

  factory TickRes.fromJson(dynamic json) {
    return TickRes(tick: json['tick']);
  }
}

class Tick {
  final double bid;

  Tick({required this.bid});

  factory Tick.fromJson(dynamic json) {
    return Tick(
      bid: json['ask'],
    );
  }
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