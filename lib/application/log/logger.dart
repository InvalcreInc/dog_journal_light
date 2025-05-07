import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// A logger for the Invalcre package.
@immutable
final class AppLogger {
  final Logger _logger;

  AppLogger() : _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  /// Logs a debug message with the given [object].
  /// Only logs if [kDebugMode] is true.
  debug(String object) {
    if (kDebugMode) {
      _logger.d(object);
    }
  }

  /// Logs an error message with the given [error] and [stackTrace].
  /// Only logs if [kDebugMode] is true.
  void error(Object error, StackTrace? stackTrace, {String message = 'ERROR'}) {
    if (kDebugMode) {
      _logger.e(message, error: error, stackTrace: stackTrace);
    }
  }
}
