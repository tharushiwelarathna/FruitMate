import 'package:get/get.dart';

class FreshnessIdentificationController extends GetxController {
  List<String> tabs = [
    "Nutritional Facts",
    "Ripeness Indicators",
    "Storage Tips",
    "Serving Ideas",
  ];

  int current = 0;

  updateIndex(index) {
    current = index;
    update();
  }
}
