import 'package:logger/logger.dart';

class CustomLogPrinter extends LogPrinter {
  final String className;

  CustomLogPrinter(this.className)

  // @override
  // void log(Level level, message, error, StackTrace stackTrace) {
  //   var color = PrettyPrinter.levelColors[level];
  //   var emoji = PrettyPrinter.levelEmojis[level];
  //   println(color('$emoji $className - $message'));
  // }


  @override
  List<String> log(LogEvent event) {
    
  }}