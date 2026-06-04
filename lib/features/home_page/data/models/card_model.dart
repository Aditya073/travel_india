/*
1. State name
2. Display image
3. Description
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CardModel {
  final String? stateName;
  final String? imageUrl;
  final String? description;


  CardModel({required this.stateName, required this.imageUrl, this.description});

  factory CardModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return CardModel(
      stateName: data['stateName'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      description: data['description'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "stateName": stateName,
      "imageUrl": imageUrl,
      "description": description,
    };
  }
}
