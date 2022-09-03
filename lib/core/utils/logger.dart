import 'package:logger/logger.dart';

// Info Log - on every public function call with the following format: (functionName | arguments: test)
// Warning Log - warn when expected value is not present or incorrect format
// Error Log - Log the reason not the exception

Logger getSimpleLogger(String className) {
  return Logger(printer: CustomLogPrinter(className), output: ConsoleOutput());
}

class CustomLogPrinter extends PrettyPrinter {
  final String className;

  CustomLogPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    DateTime now = DateTime.now();
    String currTime =
        '${now.hour}:${now.minute}:${now.second}.${now.millisecond}';
    return ['$className ($currTime) - ${event.message}'];
  }
}

class ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    var color = PrettyPrinter.levelColors[event.level];
    var emoji = PrettyPrinter.levelEmojis[event.level];

    for (var line in event.lines) {
      // ignore: avoid_print
      print(color!('$emoji $line'));
    }
  }
}
