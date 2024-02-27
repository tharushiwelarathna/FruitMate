import 'package:flutter/material.dart';
import 'package:fruitmate_app/controller/home_controller.dart';
import 'package:fruitmate_app/util/app_colors.dart';
import 'package:fruitmate_app/util/app_images.dart';
import 'package:fruitmate_app/view/login/login.dart';
import 'package:fruitmate_app/view/register/register.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: SafeArea(
        child: Scaffold(
          body: GetBuilder<HomeController>(
            init: HomeController(),
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
                    const SizedBox(height: 30),
                    const Text(
                      'Welcome to FruitMate',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 50,
                        fontFamily: "Artifika",
                        fontWeight: FontWeight.bold,
                        color: AppColors.green, // Use the custom color
                        letterSpacing: 1.5, // Set the text spacing
                      ),
                    ),
                    const SizedBox(height: 160),
                    // Add your "Create an Account" button here
                    ElevatedButton(
                      onPressed: () => Get.to(() => const Logup()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.buttonColor, // Change button color
                      ),
                      child: const Text('Create an Account'),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        const SizedBox(width: 5),
                        // Add your "Login" button here
                        TextButton(
                          onPressed: () => Get.to(() => const Login()),
                          child: const Text('Login'),
                        ),
                      ],
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
