import 'package:deriv_interview_app/constant/deriv.dart';
import 'package:web_socket_channel/io.dart';

class WS {
  late IOWebSocketChannel ioWebSocketChannel;

  void connect() {
    ioWebSocketChannel = IOWebSocketChannel.connect(uri);
  }

  static WS get instance => WS._internal();

  WS._internal() {
    connect();
  }
}
