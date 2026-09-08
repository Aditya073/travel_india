class NetworkConstants {
  NetworkConstants._();

  // the API "Uri.parse"
  static const String overpassUrl = 'https://overpass.private.coffee/api/interpreter';
      
      // 'https://overpass-api.de/api/interpreter';
  // https://overpass.kumi.systems/api/interpreter
  // https://overpass-api.de/api/interpreter

   // Maximum time allowed to establish a connection.
  static const Duration connectTimeout =
      Duration(seconds: 10);

  // Maximum time allowed for the complete request.
  static const Duration receiveTimeout =
      Duration(seconds: 30);

  // Number of retry attempts.
  static const int maxRetries = 2;

  // Minimum time between Overpass requests from this app instance.
  static const Duration requestDelay =
      Duration(seconds: 2);

  // How long API results remain cached.
  static const Duration cacheDuration =
      Duration(minutes: 30);
}