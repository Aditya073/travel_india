import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_india/features/home_page/data/models/card_model.dart';

class Firestoredatasource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<CardModel> getCardData() async {
    try {
      final doc = await firestore.collection("card").doc().get();

      print("Data From Firestore");
      print(doc.data.toString());
      if (!doc.exists) {
        throw Exception("card data not found in Firestore");
      }

      return CardModel.fromFirestore(doc);
    } catch (e) {
      print("Firestore error: $e");
      rethrow;
    }
  }
}
