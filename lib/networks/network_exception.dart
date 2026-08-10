class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => message;
}

class ServerException extends NetworkException {
  ServerException(super.message);
}

class NetworkTimeoutException extends NetworkException {
  NetworkTimeoutException(super.message);
}

class RateLimitException extends NetworkException {
  RateLimitException(super.message);
}

class BadRequestException extends NetworkException {
  BadRequestException(super.message);
}