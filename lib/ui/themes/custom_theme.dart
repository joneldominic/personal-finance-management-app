import 'package:flutter/material.dart';

@immutable
class CustomTheme extends ThemeExtension<CustomTheme> {
  const CustomTheme({
    required this.success,
    required this.info,
    required this.warning,
    required this.danger,
    required this.scaffoldBackgroundColor,
    required this.appBarBackgroundColor,
  });

  final Color? success;
  final Color? info;
  final Color? warning;
  final Color? danger;
  final Color? scaffoldBackgroundColor;
  final Color? appBarBackgroundColor;

  @override
  CustomTheme copyWith({
    Color? success,
    Color? info,
    Color? warning,
    Color? danger,
    Color? scaffoldBackgroundColor,
    Color? appBarBackgroundColor,
  }) {
    return CustomTheme(
      success: success ?? this.success,
      info: info ?? this.info,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      scaffoldBackgroundColor:
          scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
      appBarBackgroundColor:
          appBarBackgroundColor ?? this.appBarBackgroundColor,
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
      scaffoldBackgroundColor:
          Color.lerp(scaffoldBackgroundColor, other.scaffoldBackgroundColor, t),
      appBarBackgroundColor:
          Color.lerp(appBarBackgroundColor, other.appBarBackgroundColor, t),
    );
  }

  @override
  String toString() => 'CustomTheme('
      'success: $success, '
      'info: $info, '
      'warning: $info, '
      'danger: $danger, '
      'scaffoldBackgroundColor: $scaffoldBackgroundColor, '
      'appBarBackgroundColor: $appBarBackgroundColor, '
      ')';

  /// ****************************************************************
  /// Light Theme
  /// ****************************************************************
  static const light = CustomTheme(
    success: Color(0xff28a745),
    info: Color(0xff17a2b8),
    warning: Color(0xffffc107),
    danger: Color(0xffdc3545),
    scaffoldBackgroundColor: Color(0xffd3d3d3),
    appBarBackgroundColor: Color(0xff2F2F2F),
  );

  /// ****************************************************************
  /// Dark Theme
  /// ****************************************************************
  static const dark = CustomTheme(
    success: Color(0xff00bc8c),
    info: Color(0xff17a2b8),
    warning: Color(0xfff39c12),
    danger: Color(0xffe74c3c),
    scaffoldBackgroundColor: Color(0xff1d1d1d),
    appBarBackgroundColor: Color(0xff2F2F2F),
  );
}
