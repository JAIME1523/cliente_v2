import 'package:logger/logger.dart';

Logger getLogger(Type type) => Logger(printer: AppLoggerPrinter(type.toString()), level: Level.debug);

class AppLoggerPrinter extends LogPrinter {
  final String className;

  AppLoggerPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.defaultLevelColors[event.level] ?? const AnsiColor.none();
    final emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    final message = event.message;
    return [color('$emoji $className: $message')];
  }
}
