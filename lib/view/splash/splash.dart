import 'package:flutter/material.dart';
import 'package:fruitmate_app/controller/splash_controller.dart';
import 'package:fruitmate_app/util/app_colors.dart';
import 'package:fruitmate_app/util/app_images.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.white,
        child: SafeArea(
            child: Scaffold(
          body: GetBuilder<SplashController>(
              init: SplashController(),
              builder: (controller) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.appIcon,
                    )
                  ],
                ));
              }),
        )));
  }
}
