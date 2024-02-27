import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/freshness_identification_controller.dart';
import '../../util/app_colors.dart';
import '../../util/app_widgets.dart';

class MoreDetails extends StatelessWidget {
  final String imagePath;
  const MoreDetails({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppWidgets.regularText(
          text: 'More Details',
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
            var height = MediaQuery.of(context).size.height;
            var width = MediaQuery.of(context).size.width;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.regularText(
                    text: "Mango",
                    size: 22,
                    color: AppColors.black,
                    weight: FontWeight.w600,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: width,
                    height: height * 0.2,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.file(
                      File(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          width: width,
                          height: height * 0.05,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: SizedBox(
                                  width: width,
                                  height: height * 0.05,
                                  child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller.tabs.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: index == 0 ? 0 : 20),
                                          child: GestureDetector(
                                            onTap: () =>
                                                controller.updateIndex(index),
                                            child: AppWidgets.regularText(
                                              text: controller.tabs[index],
                                              size: 18,
                                              color: controller.current == index
                                                  ? AppColors.green
                                                  : AppColors.black,
                                              weight:
                                                  controller.current == index
                                                      ? FontWeight.w600
                                                      : FontWeight.w400,
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: controller.current == 0
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      AppWidgets.regularText(
                                        text:
                                            "Identified Freshness : Fresh\nAccuracy : 98.02%",
                                        size: 20,
                                        color: AppColors.black,
                                        weight: FontWeight.w400,
                                      ),
                                    ],
                                  )
                                : controller.current == 1
                                    ? Column(
                                        children: [],
                                      )
                                    : controller.current == 2
                                        ? Column(
                                            children: [],
                                          )
                                        : Column(
                                            children: [],
                                          ))
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
