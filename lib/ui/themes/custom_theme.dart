import 'package:flutter/material.dart';

@immutable
class CustomTheme extends ThemeExtension<CustomTheme> {
  const CustomTheme({
    required this.success,
    required this.info,
    required this.warning,
    required this.danger,
    required this.test,
  });

  final Color? success;
  final Color? info;
  final Color? warning;
  final Color? danger;
  final Color? test;

  @override
  CustomTheme copyWith({
    Color? success,
    Color? info,
    Color? warning,
    Color? danger,
    Color? test,
  }) {
    return CustomTheme(
      success: success ?? this.success,
      info: info ?? this.info,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      test: test ?? this.test,
    );
  }

  @override
  CustomTheme lerp(ThemeExtension<CustomTheme>? other, double t) {
    if (other is! CustomTheme) {
      return this;
    }

    return CustomTheme(
      success: Color.lerp(success, other.success, t),
      info: Color.lerp(info, other.info, t),
      warning: Color.lerp(warning, other.warning, t),
      danger: Color.lerp(danger, other.danger, t),
      test: Color.lerp(test, other.test, t),
    );
  }

  @override
  String toString() => 'CustomTheme('
      'success: $success, info: $info, warning: $info, danger: $danger, test: $test'
      ')';

  /// ****************************************************************
  /// Light Theme
  /// ****************************************************************
  static const light = CustomTheme(
    success: Color(0xff28a745),
    info: Color(0xff17a2b8),
    warning: Color(0xffffc107),
    danger: Color(0xffdc3545),
    test: Colors.white,
  );

  /// ****************************************************************
  /// Dark Theme
  /// ****************************************************************
  static const dark = CustomTheme(
    success: Color(0xff00bc8c),
    info: Color(0xff17a2b8),
    warning: Color(0xfff39c12),
    danger: Color(0xffe74c3c),
    test: Colors.black,
  );
}
