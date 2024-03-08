import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordObscureText = true;

  void showPassword() {
    passwordObscureText = !passwordObscureText;
    update();
  }
}
