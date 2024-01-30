import 'dart:async';

import 'package:fruitmate_app/view/home/home.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToNextPage();
  }

  void navigateToNextPage() {
    Timer(const Duration(seconds: 2), () {
      Get.offAll(const Home());
    });
  }
}
