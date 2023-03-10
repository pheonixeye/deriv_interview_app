import 'package:deriv_interview_app/constant/deriv.dart';
import 'package:web_socket_channel/io.dart';

//singelton class
class WS {
  late IOWebSocketChannel ioWebSocketChannel;

  void connect() {
    try {
      ioWebSocketChannel = IOWebSocketChannel.connect(uri);
    } catch (e) {
      rethrow;
    }
  }

  static final WS _instance = WS._internal();

  WS._internal() {
    connect();
  }

  factory WS() => _instance;
}
