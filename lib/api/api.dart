import 'dart:async';
import 'dart:convert';

import 'package:deriv_interview_app/websockets/manager.dart';

class API {
  final WS socketManager;

  final StreamController _streamController = StreamController.broadcast();
  StreamController get streamController => _streamController;

  API(this.socketManager) {
    initConnection();
  }

  void initConnection() {
    try {
      socketManager.connect();
    } catch (e) {
      rethrow;
    }
  }

  void sendRequest({required Map<String, dynamic> requestData}) {
    socketManager.ioWebSocketChannel.sink.add(jsonEncode(requestData));
  }

  void addStreamToController() {
    _streamController.addStream(socketManager.ioWebSocketChannel.stream);
  }

  void removeFromStreamController() {
    _streamController.stream.drain().whenComplete(() {
      _streamController.close().whenComplete(() {
        print('ss closed...');
      });
    });
  }
}
