import 'dart:developer' as developer;

class Log {
  static void log(String message, {String name = '', Object? error, StackTrace? stackTrace}) {
    developer.log(
      message,
      name: "MyLOG",
      error: error,
      stackTrace: stackTrace,
    );
  }
}
