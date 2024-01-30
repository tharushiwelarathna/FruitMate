import 'package:flutter/material.dart';
import 'package:fruitmate_app/controller/login_controller.dart';
import 'package:fruitmate_app/util/app_colors.dart';
import 'package:fruitmate_app/util/app_images.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: SafeArea(
        child: Scaffold(
          body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.appIcon,
                      scale: 2,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
