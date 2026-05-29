/*
1. State name
2. Display image
3. 
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CardModel {
  final String? stateName;
  final Image? displayImage;

  CardModel({required this.stateName, required this.displayImage});

  factory CardModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return CardModel(
      stateName: data['stateName'] ?? '',
      displayImage: data['displayImage'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "stateName": stateName,
      "displayImage": displayImage,
    };
  }
}
