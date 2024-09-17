import 'package:logger/logger.dart';
import 'package:nebx_utilities/src/services/interfaces/illogger.dart';

class LoggerImplementation implements ILogger {
  late final Logger _logger;

  LoggerImplementation() {
    final printer = PrettyPrinter(
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      stackTraceBeginIndex: 1,
    );

    _logger = Logger(
      level: Level.all,
      filter: null,
      // null to use the default LogFilter (-> only log in debug mode)
      printer: printer, // Use the PrettyPrinter to format and print log
    );
  }

  @override
  void error({required String message}) {
    _logger.e(message);
  }

  @override
  void debug({required String message}) {
    _logger.d(message);
  }
}
