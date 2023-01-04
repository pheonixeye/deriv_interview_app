// ignore_for_file: constant_identifier_names

import 'package:deriv_interview_app/api/api.dart';
import 'package:deriv_interview_app/websockets/manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepoCubit extends Cubit<API> {
  RepoCubit() : super(API(WS())) {
    connect();
  }
  void connect() {
    state.initConnection();
  }

  void sendRequest(Map<String, dynamic> requestData, RequestType type) {
    switch (type) {
      case RequestType.Fetch:
        state.sendRequest(requestData: requestData);
        state.addStreamToController();
        break;
      case RequestType.Forget:
        state.removeFromStreamController();
        state.sendRequest(requestData: requestData);
        break;
    }
  }
}

enum RequestType {
  Fetch,
  Forget,
}
