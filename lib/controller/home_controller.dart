import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as p;

import '../util/app_widgets.dart';
import '../view/freshnessIdentification/freshness_identification.dart';

class HomeController extends GetxController {
  String imagePath = "";

  Future<void> uploadImage(bool isCamera) async {
    if (await Permission.camera.isGranted) {
      isCamera ? takePhoto() : pickImageFromGallery();
    } else {
      final hasFilePermission = await requestPermission();
      if (hasFilePermission) {
        isCamera ? takePhoto() : pickImageFromGallery();
      } else {
        AppWidgets.showSnackBar("Permission not granted");
      }
    }
  }

  Future<bool> requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
    ].request();

    if (statuses[Permission.camera] == PermissionStatus.granted &&
        statuses[Permission.storage] == PermissionStatus.granted) {
      return true;
    } else if (statuses[Permission.camera] ==
            PermissionStatus.permanentlyDenied ||
        statuses[Permission.storage] == PermissionStatus.permanentlyDenied) {
      openAppSettings();
      return false;
    } else {
      return false;
    }
  }

  void takePhoto() async {
    try {
      XFile? image = await ImagePicker().pickImage(
          source: ImageSource.camera,
          imageQuality: 50,
          maxHeight: 1000,
          maxWidth: 1000);

      if (image != null) {
        String dir = p.dirname(image.path);
        String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
        String newPath = p.join(dir, 'fruit_$timestamp.jpg');
        File(image.path).renameSync(newPath);

        imagePath = newPath;
        imageCache.clear();
        imageCache.clearLiveImages();
        update();

        Get.to(
          () => FreshnessIdentification(
            imagePath: imagePath,
          ),
        );
      }
    } catch (e) {
      AppWidgets.showSnackBar("An error occurred when taking a picture");
    }
  }

  void pickImageFromGallery() async {
    try {
      XFile? image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 50,
          maxHeight: 1000,
          maxWidth: 1000);
      if (image != null) {
        String dir = p.dirname(image.path);
        String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
        String newPath = p.join(dir, 'fruit_$timestamp.jpg');
        File(image.path).renameSync(newPath);

        imagePath = newPath;
        imageCache.clear();
        imageCache.clearLiveImages();
        update();

        Get.to(
          () => FreshnessIdentification(
            imagePath: imagePath,
          ),
        );
      }
    } catch (e) {
      AppWidgets.showSnackBar("An error occurred when picking a file");
    }
  }
}
