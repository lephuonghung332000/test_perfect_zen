/// Handling error from a local data source, for example a SQLite, SharedPref,
/// etc...
///
class CacheException implements Exception {
  /// Error message when fail
  final String message;

  /// Error code
  final int code;

  ///
  CacheException({
    required this.message,
    required this.code,
  });
}

/// Handling cache when cache is null, or cache not found
class NotFoundCacheException extends CacheException {
  /// Error message when fail
  final String message;

  /// Error code
  final int code;

  ///
  NotFoundCacheException({
    required this.message,
    required this.code,
  }) : super(
          code: code,
          message: message,
        );
}
