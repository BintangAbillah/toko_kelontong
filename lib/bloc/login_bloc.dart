import 'dart:async';

import '../model/login_model.dart';


class LoginBloc {

  // STREAM CONTROLLER
  final StreamController<bool> _loadingController =
      StreamController<bool>();

  Stream<bool> get loadingStream =>
      _loadingController.stream;

  // LOGIN FUNCTION
  Future<bool> login(LoginModel loginData) async {

    _loadingController.sink.add(true);

    await Future.delayed(
      const Duration(seconds: 2),
    );

    _loadingController.sink.add(false);

    // SIMULASI LOGIN
    if (loginData.email == "admin@gmail.com" &&
        loginData.password == "123456") {

      return true;
    }

    return false;
  }

  // DISPOSE
  void dispose() {
    _loadingController.close();
  }
}