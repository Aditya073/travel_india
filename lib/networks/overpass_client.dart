import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:travel_india/networks/network_constants.dart';
import 'package:travel_india/networks/network_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
    200 → success
    400 → bad request
    429 → rate limited
    500 → server error
    502 → gateway error
    503 → service unavailable
    504 → timeout/gateway timeout
  */

class OverpassClient {
  final http.Client client;

  DateTime? _lastRequestTime;

  OverpassClient({http.Client? client}) : client = client ?? http.Client();

  Future<Map<String, dynamic>> query(String query) async {
    // check the cash data first
    final cachedData = await _getCachedData(query);

    if (cachedData != null) {
      return cachedData;
    }

    // checking for rate limit
    await _waitForRateLimit();

    // making the request with a retry
    Object? lastError;

    for (int attempt = 0; attempt <= NetworkConstants.maxRetries; attempt++) {
      try {
        // set the last req time to now
        _lastRequestTime = DateTime.now();

        final response = await client
            .post(
              Uri.parse(NetworkConstants.overpassUrl),
              headers: {
                'Content-Type': 'application/x-www-form-urlencoded',

                'Accept': 'application/json',

                // Identify your application.
                'User-Agent':
                    'TravelIndiaApp/1.0 '
                    '(contact: your-email@example.com)',
              },
              body: {'data': query},
            )
            .timeout(NetworkConstants.receiveTimeout);

        // Success
        if (response.statusCode == 200) {
          final decoded = jsonDecode(response.body);

          if (decoded is! Map<String, dynamic>) {
            throw NetworkException('Invalid response from Overpass API.');
          }

          // Save successful response to cache
          await _saveToCache(query, decoded);

          return decoded;
        }

        // Error for rate limit
        if (response.statusCode == 429) {
          if (attempt < NetworkConstants.maxRetries) {
            // Overpass recommends waiting before retrying.
            await Future.delayed(Duration(seconds: 30 * (attempt + 1)));

            continue;
          }

          throw RateLimitException(
            'Too many requests. Please try again later.',
          );
        }

        // SERVER ERRORS
        if (response.statusCode == 500 ||
            response.statusCode == 502 ||
            response.statusCode == 503 ||
            response.statusCode == 504) {
          lastError = ServerException(
            'Overpass server is temporarily unavailable.',
          );

          if (attempt < NetworkConstants.maxRetries) {
            await Future.delayed(Duration(seconds: 2 * (attempt + 1)));

            continue;
          }

          throw lastError;
        }

        // bad req
        if (response.statusCode == 400) {
          throw BadRequestException('Invalid Overpass query.');
        }

        // OTHER STATUS CODES
        throw ServerException(
          'Overpass API failed with status '
          '${response.statusCode}.',
        );
      } on TimeoutException {
        lastError = NetworkTimeoutException('Overpass request timed out.');

        if (attempt < NetworkConstants.maxRetries) {
          await Future.delayed(Duration(seconds: 2 * (attempt + 1)));

          continue;
        }

        throw lastError;
      } on RateLimitException {
        rethrow;
      } on BadRequestException {
        rethrow;
      } on ServerException {
        rethrow;
      } on NetworkException {
        rethrow;
      } catch (e) {
        lastError = NetworkException('Network error: $e');

        if (attempt < NetworkConstants.maxRetries) {
          await Future.delayed(Duration(seconds: 2 * (attempt + 1)));

          continue;
        }

        throw lastError;
      }
    }

    throw NetworkException('Unable to fetch data from Overpass.');
  }

  // ======================================================
  // Rate limit function
  // ======================================================
  Future<void> _waitForRateLimit() async {
    if (_lastRequestTime == null) {
      return;
    }

    final elapsed = DateTime.now().difference(_lastRequestTime!);

    final remaining = NetworkConstants.requestDelay - elapsed;

    if (remaining > Duration.zero) {
      await Future.delayed(remaining);
    }
  }

  // ======================================================
  // CACHE function
  // ======================================================
  Future<Map<String, dynamic>?> _getCachedData(String query) async {
    final prefs = await SharedPreferences.getInstance();

    final cacheKey = _getCacheKey(query);

    final cached = prefs.getString(cacheKey);

    if (cached == null) {
      return null;
    }

    try {
      final decoded = jsonDecode(cached) as Map<String, dynamic>;

      final timestamp = decoded['_cachedAt'] as int?;

      final data = decoded['_data'] as Map<String, dynamic>?;

      if (timestamp == null || data == null) {
        await prefs.remove(cacheKey);
        return null;
      }

      final cacheTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

      final age = DateTime.now().difference(cacheTime);

      // Cache expired.
      if (age > NetworkConstants.cacheDuration) {
        await prefs.remove(cacheKey);
        return null;
      }

      print('************************* cache hit ********************************');
      return data;
    } catch (_) {
      await prefs.remove(cacheKey);
      return null;
    }
  }

  Future<void> _saveToCache(String query, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();

    final cacheKey = _getCacheKey(query);

    final cacheObject = {
      '_cachedAt': DateTime.now().millisecondsSinceEpoch,
      '_data': data,
    };

    await prefs.setString(cacheKey, jsonEncode(cacheObject));
  }

  // ======================================================
  // CACHE KEY
  // ======================================================
  String _getCacheKey(String query) {
    final bytes = utf8.encode(query);

    final digest = sha256.convert(bytes);

    return 'overpass_cache_${digest.toString()}';
  }

  // ======================================================
  // CLEANUP
  // ======================================================
  void dispose() {
    client.close();
  }
}
