class NetworkConstants {
  NetworkConstants._();

  // the API "Uri.parse"
  static const String overpassUrl =
      'https://overpass-api.de/api/interpreter';

  // https://overpass.kumi.systems/api/interpreter
  // https://overpass-api.de/api/interpreter

  // time out duration for API
  static const Duration connectTimeout =
      Duration(seconds: 10);

  static const Duration receiveTimeout =
      Duration(seconds: 60);

  // static const int maxRetries = 3;
}