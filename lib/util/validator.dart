import 'package:get/get.dart';

String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Please enter a email';
  } else if (!GetUtils.isEmail(email)) {
    return 'Please enter a valid email';
  } else {
    return null;
  }
}

String? validatePasswordLogin(String? password) {
  if (password == null || password.isEmpty) {
    return 'Please enter a password';
  } else {
    return null;
  }
}
