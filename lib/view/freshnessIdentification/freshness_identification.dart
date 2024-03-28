import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fruitmate_app/controller/freshness_identification_controller.dart';
import 'package:fruitmate_app/view/freshnessIdentification/more_details.dart';
import 'package:get/get.dart';

import '../../util/app_colors.dart';
import '../../util/app_widgets.dart';

class FreshnessIdentification extends StatelessWidget {
  final Uint8List annotatedImage;
  final List<dynamic> boundingBoxes;
  FreshnessIdentification(
      {super.key, required this.annotatedImage, required this.boundingBoxes});

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
          weight: FontWeight.w600,
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
                children: [
                  Center(
                    child: Container(
                      width: height * 0.4,
                      height: height * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 207, 119, 119)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.memory(
                        annotatedImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: boundingBoxes.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            AppWidgets.regularText(
                              text:
                                  "Identified object: ${boundingBoxes[index][4]}",
                              size: 16,
                              color: AppColors.black,
                              alignment: TextAlign.left,
                              weight: FontWeight.w400,
                            ),
                            const SizedBox(height: 3),
                            AppWidgets.regularText(
                              text:
                                  "Freshness Accuracy: ${(boundingBoxes[index][5] * 100).roundToDouble()}%",
                              size: 14,
                              color: AppColors.black,
                              alignment: TextAlign.left,
                              weight: FontWeight.w400,
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => MoreDetails(
                          annotatedImage: annotatedImage,
                          boundingBoxes: boundingBoxes));
                    },
                    child: Container(
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
                  ),
                  const SizedBox(height: 70),
                ],
              ),
            );
          }),
    );
  }
}
