import 'dart:convert';

import 'package:deriv_interview_app/websockets/manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketCubit extends Cubit<WS> {
  SocketCubit() : super(WS.instance) {
    sendMarketsRequest();
  }

  Stream<dynamic> get expStream => state.ioWebSocketChannel.stream;

  WebSocketSink get expSink => state.ioWebSocketChannel.sink;

  void sendMarketsRequest() => expSink.add(jsonEncode({
        "active_symbols": "full",
        "product_type": "basic",
      }));
}
