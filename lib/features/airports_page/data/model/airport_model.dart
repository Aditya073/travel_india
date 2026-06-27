import 'dart:convert';

import 'package:flutter/foundation.dart';

class AirportModel {
  final String name;
  final double lat;
  final double lng;
  final String iata;
  final String icao;

  AirportModel({
    required this.name,
    required this.lat,
    required this.lng,
    required this.iata,
    required this.icao,
  });

  factory AirportModel.fromJson(Map<String, dynamic> json) {
    final tags = json['tags'] ?? {};
    final latlng = json['center'] ?? {};

    return AirportModel(
      name: tags['name'] ?? 'Unknown',
      lat: latlng['lat'] ?? json['lat'] ,
      lng: latlng['lon'] ?? json['lon'] ,
      iata: tags['iata'] ?? ' ',
      icao: tags['icao'] ?? ' ',
    );
  }
}
