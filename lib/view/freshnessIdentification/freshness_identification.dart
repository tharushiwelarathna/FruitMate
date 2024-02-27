import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruitmate_app/controller/freshness_identification_controller.dart';
import 'package:get/get.dart';

import '../../util/app_colors.dart';
import '../../util/app_widgets.dart';

class FreshnessIdentification extends StatelessWidget {
  final String imagePath;
  const FreshnessIdentification({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: AppWidgets.regularText(
          text: 'Freshness Identification',
          size: 24.0,
          color: AppColors.black,
          weight: FontWeight.w400,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder<FreshnessIdentificationController>(
          init: FreshnessIdentificationController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: width * 0.6,
                      height: height * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.file(
                        File(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  AppWidgets.regularText(
                    text: "Identified Freshness : Fresh\nAccuracy : 98.02%",
                    size: 20,
                    color: AppColors.black,
                    alignment: TextAlign.center,
                    weight: FontWeight.w400,
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.green,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                      child: SizedBox(
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppWidgets.regularText(
                              text: "More Details",
                              size: 22,
                              color: AppColors.white,
                              weight: FontWeight.w600,
                            ),
                            const SizedBox(width: 10),
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: AppColors.white, size: 20)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
