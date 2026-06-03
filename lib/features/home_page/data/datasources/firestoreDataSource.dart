import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_india/features/home_page/data/models/card_model.dart';

class Firestoredatasource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<CardModel>> getCardData() async {
    try {
      final snapshot = await firestore.collection("card").get();

      if (snapshot.docs.isEmpty) {
        throw Exception("No card data found");
      }

      print("Data From {Firestore}");
      print(snapshot..toString());

      return snapshot.docs.map((doc) => CardModel.fromFirestore(doc)).toList();
    } catch (e) {
      print("Firestore error: $e");
      rethrow;
    }
  }
}
