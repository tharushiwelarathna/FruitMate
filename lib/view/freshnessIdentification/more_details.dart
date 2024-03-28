import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fruitmate_app/controller/more_details_controller.dart';
import 'package:get/get.dart';

import '../../util/app_colors.dart';
import '../../util/app_widgets.dart';

class MoreDetails extends StatelessWidget {
  final Uint8List annotatedImage;
  final List<dynamic> boundingBoxes;
  const MoreDetails(
      {super.key, required this.annotatedImage, required this.boundingBoxes});

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
      body: GetBuilder<MoreDetailsController>(
          init: MoreDetailsController(),
          builder: (controller) {
            var height = MediaQuery.of(context).size.height;
            var width = MediaQuery.of(context).size.width;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: controller.isLoading
                  ? Center(
                      child:
                          CircularProgressIndicator(color: AppColors.signinbtn))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppWidgets.regularText(
                          text: "${boundingBoxes[0][4]}",
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
                          child: Image.memory(
                            annotatedImage,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 20),
                        controller.response != null
                            ? AppWidgets.regularText(
                                text: controller.response!.description,
                                size: 18,
                                color: AppColors.black,
                                weight: FontWeight.w400,
                                alignment: TextAlign.justify)
                            : Container(),
                        const SizedBox(height: 10),
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
                                            physics:
                                                const BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller.tabs.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    left: index == 0 ? 0 : 20),
                                                child: GestureDetector(
                                                  onTap: () => controller
                                                      .updateIndex(index),
                                                  child: AppWidgets.regularText(
                                                    text:
                                                        controller.tabs[index],
                                                    size: 20,
                                                    color: controller.current ==
                                                            index
                                                        ? AppColors.green
                                                        : AppColors.black,
                                                    weight:
                                                        controller.current ==
                                                                index
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
                                            Expanded(
                                              child: ListView.builder(
                                                itemCount: controller.response!
                                                    .nutritionalFacts.length,
                                                itemExtent: 40,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return ListTile(
                                                      leading: Icon(
                                                        Icons.circle,
                                                        size: 10,
                                                      ),
                                                      title: AppWidgets.regularText(
                                                          text: controller
                                                                  .response!
                                                                  .nutritionalFacts[
                                                              index],
                                                          size: 18,
                                                          color:
                                                              AppColors.black,
                                                          weight:
                                                              FontWeight.w400));
                                                },
                                              ),
                                            ),
                                          ],
                                        )
                                      : controller.current == 1
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Expanded(
                                                  child: ListView.builder(
                                                    itemCount: controller
                                                        .response!
                                                        .ripenessIndicators
                                                        .length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return index != 0
                                                          ? ListTile(
                                                              leading: Icon(
                                                                Icons.circle,
                                                                size: 10,
                                                              ),
                                                              title: AppWidgets.regularText(
                                                                  text: controller
                                                                          .response!
                                                                          .ripenessIndicators[
                                                                      index],
                                                                  size: 18,
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                  weight:
                                                                      FontWeight
                                                                          .w400))
                                                          : ListTile(
                                                              title: AppWidgets.regularText(
                                                                  text: controller
                                                                          .response!
                                                                          .ripenessIndicators[
                                                                      index],
                                                                  size: 18,
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                  alignment:
                                                                      TextAlign
                                                                          .justify,
                                                                  weight:
                                                                      FontWeight
                                                                          .w400));
                                                    },
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Column(
                                              children: [
                                                Expanded(
                                                  child: ListView.builder(
                                                    itemCount: controller
                                                        .response!
                                                        .storageTips
                                                        .length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return ListTile(
                                                          leading: Icon(
                                                            Icons.circle,
                                                            size: 10,
                                                          ),
                                                          title: AppWidgets.regularText(
                                                              text: controller
                                                                      .response!
                                                                      .storageTips[
                                                                  index],
                                                              size: 18,
                                                              color: AppColors
                                                                  .black,
                                                              weight: FontWeight
                                                                  .w400));
                                                    },
                                                  ),
                                                ),
                                              ],
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
