class ServerException implements Exception {
  final String error;

  ServerException(this.error);

  @override
  String toString() => "Server Exception: $error";
}
