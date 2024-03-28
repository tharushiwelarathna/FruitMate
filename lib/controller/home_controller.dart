import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as p;

import '../util/app_widgets.dart';
import '../util/server.dart';
import '../view/freshnessIdentification/freshness_identification.dart';

class HomeController extends GetxController {
  String imagePath = "";
  bool loader = false;
  Server server = Server();

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
        uploadImageServer(imagePath);
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
        uploadImageServer(imagePath);
      }
    } catch (e) {
      AppWidgets.showSnackBar("An error occurred when picking a file");
    }
  }

  uploadImageServer(path) async {
    loader = true;
    update();
    await server
        .multipartRequest("http://192.168.8.100:5000/detect", path)
        .then((response) async {
      if (response != null && response.statusCode == 200) {
        loader = false;
        update();

        Map<String, dynamic> responseData = {};

        if (response is http.Response) {
          responseData = jsonDecode(response.body);
        } else if (response is http.StreamedResponse) {
          List<int> bodyBytes = await response.stream.toBytes();
          responseData = jsonDecode(utf8.decode(bodyBytes));
        }

        Uint8List decodedImage = base64Decode(responseData['annotated_image']);

        List<dynamic> boundingBoxes = responseData['bounding_boxes'];
        Uint8List annotatedImage = decodedImage;

        if (boundingBoxes.isEmpty) {
          AppWidgets.showSnackBar("Image doesn't contain a fruit");
        } else {
          Get.to(
            () => FreshnessIdentification(
                annotatedImage: annotatedImage, boundingBoxes: boundingBoxes),
          );
        }
      } else {
        loader = false;
        update();
        AppWidgets.showSnackBar("An error occurred when uploading file");
      }
    });
  }
}
