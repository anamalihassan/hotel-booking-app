class DBConnectionException implements Exception {
  String? statusMessage;

  DBConnectionException({
    this.statusMessage = 'An unknown error has occurred.',
  });
}
