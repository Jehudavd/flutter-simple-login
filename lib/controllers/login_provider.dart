import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var loginState = StateLogin.initial;
  var username = '';
  var phone = '';
  var messageError = '';
  bool obscurePassword = true;

  void processLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (usernameController.text == 'Admin' &&
          passwordController.text == 'Admin') {
        username = usernameController.text;
        phone = phoneController.text;
        loginState = StateLogin.success;
      } else {
        messageError = 'Username dan password salah. Ulangi!!!';
        loginState = StateLogin.error;
      }
    } else {
      showAlertError(context);
    }

    notifyListeners();
  }

  void actionObscurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }
}

enum StateLogin { initial, success, error }

showAlertError(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Periksa kelengkapan datamu!'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'))
        ],
      );
    },
  );
}