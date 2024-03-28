import 'package:cloud_firestore/cloud_firestore.dart';

class Fruit {
  String description;
  List<String> nutritionalFacts;
  List<String> ripenessIndicators;
  List<String> storageTips;

  Fruit({
    required this.description,
    required this.nutritionalFacts,
    required this.ripenessIndicators,
    required this.storageTips,
  });

  factory Fruit.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return Fruit(
        description: data['description'] ?? "",
        nutritionalFacts: data["nutritionalFacts"] != null
            ? List<String>.from(data["nutritionalFacts"])
            : [],
        ripenessIndicators: data["ripenessIndicators"] != null
            ? List<String>.from(data["ripenessIndicators"])
            : [],
        storageTips: data["storageTips"] != null
            ? List<String>.from(data["storageTips"])
            : []);
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'nutritionalFacts': nutritionalFacts,
      'ripenessIndicators': ripenessIndicators,
      'storageTips': storageTips,
    };
  }
}
