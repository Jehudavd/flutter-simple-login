import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  var loginState = StateLogin.initial;
  var username = '';
  var phone = '';
  var messageError = '';

  void processLogin(
      String valueUsername, String valuePassword, String valuePhone) {
    if (valueUsername == 'Admin' && valuePassword == 'Admin') {
      username = valueUsername;
      phone = valuePhone;
      loginState = StateLogin.success;
    } else {
      messageError = 'Username dan password salah. Ulangi!!!';
      loginState = StateLogin.error;
    }
    notifyListeners();
  }
}

enum StateLogin { initial, success, error }