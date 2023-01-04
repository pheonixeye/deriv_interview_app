import 'dart:convert';

import 'package:deriv_interview_app/websockets/manager.dart';
import 'package:deriv_interview_app/websockets/manager_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketCubit extends Cubit<WS> {
  SocketCubit() : super(WS()) {
    sendMarketsRequest();
  }

  Stream<dynamic> get expStream => state.ioWebSocketChannel.stream;

  WebSocketSink get expSink => state.ioWebSocketChannel.sink;

  void sendMarketsRequest() => expSink.add(jsonEncode({
        "active_symbols": "full",
        "product_type": "basic",
      }));

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    //TODO: handle this error - emit error state - probably need to upgrade to a bloc
  }
}

class SocketCubit2 extends Cubit<WS2> {
  SocketCubit2() : super(WS2());

  Stream<dynamic> get expStream => state.ioWebSocketChannel.stream;

  WebSocketSink get expSink => state.ioWebSocketChannel.sink;

  void sendSymbolsRequest(String symbol) => expSink.add(jsonEncode({
        "ticks": symbol,
        "subscribe": 1,
      }));
}
