import 'package:fruitmate_app/model/fruit.dart';
import 'package:fruitmate_app/repository/fruit_repository.dart';
import 'package:get/get.dart';

class MoreDetailsController extends GetxController {
  List<String> tabs = [
    "Nutritional Facts",
    "Ripeness Indicators",
    "Storage Tips"
  ];

  @override
  void onInit() {
    super.onInit();
    getFruitDetails();
  }

  int current = 0;
  bool isLoading = false;
  final fruitRepo = Get.put(FruitRepository());
  Fruit? response;

  getFruitDetails() async {
    setLoader(true);
    response =
        await fruitRepo.getAllFruitDetails(Get.arguments[0].split(' ')[1]);
    update();
    setLoader(false);
  }

  updateIndex(index) {
    current = index;
    update();
  }

  setLoader(bool value) {
    isLoading = value;
    update();
  }
}
