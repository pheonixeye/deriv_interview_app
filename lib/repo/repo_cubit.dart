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
    state.sendRequest(requestData: requestData);
    switch (type) {
      case RequestType.Fetch:
        state.addStreamToController();
        break;
      case RequestType.Forget:
        state.removeFromStreamController();

        break;
    }
  }
}

enum RequestType {
  Fetch,
  Forget,
}
