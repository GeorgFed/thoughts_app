class NetworkException implements Exception {
  final String? title;
  final String message;

  NetworkException({
    required this.message,
    this.title,
  });

  @override
  String toString() => '$title: $message}';
}
