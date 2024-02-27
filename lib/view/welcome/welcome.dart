import 'package:flutter/material.dart';
import 'package:fruitmate_app/controller/welcome_controller.dart';
import 'package:fruitmate_app/util/app_colors.dart';
import 'package:fruitmate_app/util/app_images.dart';
import 'package:get/get.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      builder: (controller) {
        return Container(
          color: AppColors.white,
          child: SafeArea(
            child: Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome to FruitMate Freshness Check !',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: AppColors.green,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        AppImages.appIcon,
                        scale: 2,
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        'Upload a Clear Picture of Fruit\'s Image',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => controller.uploadImage(true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors
                              .signinbtn, // Set the desired button color
                        ),
                        child: const Text(
                          'Take Photo from Camera',
                          style: TextStyle(
                            fontSize: 18,
                            color:
                                AppColors.white, // Set the desired text color
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => controller.uploadImage(false),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors
                              .signinbtn, // Set the desired button color
                        ),
                        child: const Text(
                          'Upload Image from Gallery',
                          style: TextStyle(
                            fontSize: 18,
                            color:
                                AppColors.white, // Set the desired text color
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
