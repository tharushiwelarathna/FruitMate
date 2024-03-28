import 'package:flutter/material.dart';
import 'package:fruitmate_app/controller/home_controller.dart';
import 'package:fruitmate_app/util/app_colors.dart';
import 'package:fruitmate_app/util/app_images.dart';
import 'package:get/get.dart';

import '../../util/app_widgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Container(
          color: AppColors.white,
          child: SafeArea(
            child: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppWidgets.regularText(
                      text: 'Welcome to FruitMate!',
                      size: 32.0,
                      color: AppColors.green,
                      weight: FontWeight.w600,
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      AppImages.appIcon,
                      scale: 1.5,
                    ),
                    AppWidgets.regularText(
                        text: 'Upload a Clear Picture of Fruit\'s Image',
                        size: 22.0,
                        color: AppColors.black,
                        weight: FontWeight.w600,
                        alignment: TextAlign.center),
                    const SizedBox(height: 40),
                    controller.loader
                        ? Column(
                            children: [
                              const SizedBox(height: 40),
                              CircularProgressIndicator(
                                  color: AppColors.signinbtn),
                            ],
                          )
                        : Column(
                            children: [
                              ElevatedButton(
                                  onPressed: () => controller.uploadImage(true),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.signinbtn,
                                  ),
                                  child: SizedBox(
                                    child: Center(
                                      child: AppWidgets.regularText(
                                          text: 'Take Photo from Camera',
                                          size: 18.0,
                                          color: AppColors.white,
                                          weight: FontWeight.w400,
                                          alignment: TextAlign.center),
                                    ),
                                    width: 200,
                                  )),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                  onPressed: () =>
                                      controller.uploadImage(false),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.signinbtn,
                                  ),
                                  child: SizedBox(
                                    child: Center(
                                      child: AppWidgets.regularText(
                                          text: 'Upload Image from Gallery',
                                          size: 18.0,
                                          color: AppColors.white,
                                          weight: FontWeight.w400,
                                          alignment: TextAlign.center),
                                    ),
                                    width: 200,
                                  )),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
