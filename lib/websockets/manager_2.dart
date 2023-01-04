import 'package:deriv_interview_app/constant/deriv.dart';
import 'package:web_socket_channel/io.dart';

//singelton class
class WS2 {
  late IOWebSocketChannel ioWebSocketChannel;

  void connect() {
    try {
      ioWebSocketChannel = IOWebSocketChannel.connect(uri);
    } catch (e) {
      rethrow;
    }
  }

  static final WS2 _instance = WS2._internal();

  WS2._internal() {
    connect();
  }

  factory WS2() => _instance;
}
