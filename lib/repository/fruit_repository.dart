import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruitmate_app/model/fruit.dart';
import 'package:get/get.dart';

class FruitRepository extends GetxController {
  final db = FirebaseFirestore.instance;

  Future<Fruit?> getAllFruitDetails(String id) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await db.collection("fruits").doc(id).get();

      if (snapshot.exists) {
        return Fruit.fromFirestore(snapshot);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
