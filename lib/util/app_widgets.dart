import 'package:flutter/material.dart';
import 'package:fruitmate_app/util/app_colors.dart';
import 'package:get/get.dart';

class AppWidgets {
  static showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: "Close",
        textColor: AppColors.green,
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
