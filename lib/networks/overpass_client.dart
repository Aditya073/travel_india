import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_india/networks/network_constants.dart';
import 'package:travel_india/networks/network_exception.dart';

class OverpassClient {
  final http.Client client;

  OverpassClient({http.Client? client}) : client = client ?? http.Client();

  Future<Map<String, dynamic>> query(String query) async {
    try {
      final response = client
          .post(
            Uri.parse(NetworkConstants.overpassUrl),
            headers: {'Content-Type': 'application/x-www-form-urlencoded'
          //  //  *** MANDATORY -> Identifies your app to prevent 406/403 blocks
              // 'User-Agent':
              //     'TravelIndiaApp/1.0 (contact: support@travelindia.com)',
              // 'Accept': 'application/json',
            },
            body: {'data': query},
          )
          .timeout(NetworkConstants.receiveTimeout);

      return _handleResponse(await response);
    } on TimeoutException {
      throw NetworkTimeoutException('Overpass request timed out.');
    } on NetworkException {
      rethrow;
    } catch (e) {
      throw NetworkException('Network error: $e');
    }
  }
  /*
    200 → success
    400 → bad request
    429 → rate limited
    500 → server error
    502 → gateway error
    503 → service unavailable
    504 → timeout/gateway timeout
  */
   Map<String, dynamic> _handleResponse(
    http.Response response,
  ) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body)
            as Map<String, dynamic>;

      case 400:
        throw BadRequestException(
          'Invalid Overpass query.',
        );

      case 429:
        throw RateLimitException(
          'Too many requests. Please try again later.',
        );

      case 500:
      case 502:
      case 503:
      case 504:
        throw ServerException(
          'Overpass server is temporarily unavailable.',
        );

      default:
        throw ServerException(
          'Overpass API failed with status '
          '${response.statusCode}.',
        );
    }
  }

}
