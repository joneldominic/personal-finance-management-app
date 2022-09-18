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
    required this.primaryAccent,
    required this.primaryTextColor,
    required this.customGreen,
    required this.customGrey,
    required this.customLightGrey,
    required this.contrastBackgroundColor,
    required this.activeControlColor,
    required this.activeSwitchTrackColor,
    required this.avatarBackgroundColor,
    required this.settingsIconColor,
    required this.actionButtonColor,
  });

  final Color? success;
  final Color? info;
  final Color? warning;
  final Color? danger;
  final Color? scaffoldBackgroundColor;
  final Color? appBarBackgroundColor;
  final Color? primaryAccent;
  final Color? primaryTextColor;
  final Color? customGreen;
  final Color? customGrey;
  final Color? customLightGrey;
  final Color? contrastBackgroundColor;
  final Color? activeControlColor;
  final Color? activeSwitchTrackColor;
  final Color? avatarBackgroundColor;
  final Color? settingsIconColor;
  final Color? actionButtonColor;

  @override
  CustomTheme copyWith({
    Color? success,
    Color? info,
    Color? warning,
    Color? danger,
    Color? scaffoldBackgroundColor,
    Color? appBarBackgroundColor,
    Color? primaryAccent,
    Color? primaryTextColor,
    Color? customGreen,
    Color? customGrey,
    Color? customLightGrey,
    Color? contrastBackgroundColor,
    Color? activeControlColor,
    Color? activeSwitchTrackColor,
    Color? avatarBackgroundColor,
    Color? settingsIconColor,
    Color? actionButtonColor,
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
      primaryAccent: primaryAccent ?? this.primaryAccent,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      customGreen: customGreen ?? this.customGreen,
      customGrey: customGrey ?? this.customGrey,
      customLightGrey: customLightGrey ?? this.customLightGrey,
      contrastBackgroundColor:
          contrastBackgroundColor ?? this.contrastBackgroundColor,
      activeControlColor: activeControlColor ?? this.activeControlColor,
      activeSwitchTrackColor:
          activeSwitchTrackColor ?? this.activeSwitchTrackColor,
      avatarBackgroundColor:
          avatarBackgroundColor ?? this.avatarBackgroundColor,
      settingsIconColor: settingsIconColor ?? this.settingsIconColor,
      actionButtonColor: actionButtonColor ?? this.actionButtonColor,
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
      primaryAccent: Color.lerp(primaryAccent, other.primaryAccent, t),
      primaryTextColor: Color.lerp(primaryTextColor, other.primaryTextColor, t),
      customGreen: Color.lerp(customGreen, other.customGreen, t),
      customGrey: Color.lerp(customGrey, other.customGrey, t),
      customLightGrey: Color.lerp(customLightGrey, other.customLightGrey, t),
      contrastBackgroundColor:
          Color.lerp(contrastBackgroundColor, other.contrastBackgroundColor, t),
      activeControlColor:
          Color.lerp(activeControlColor, other.activeControlColor, t),
      activeSwitchTrackColor:
          Color.lerp(activeSwitchTrackColor, other.activeSwitchTrackColor, t),
      avatarBackgroundColor:
          Color.lerp(avatarBackgroundColor, other.avatarBackgroundColor, t),
      settingsIconColor:
          Color.lerp(settingsIconColor, other.settingsIconColor, t),
      actionButtonColor:
          Color.lerp(actionButtonColor, other.actionButtonColor, t),
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
      'primaryAccent: $primaryAccent, '
      'primaryTextColor: $primaryTextColor, '
      'customGreen: $customGreen, '
      'customGrey: $customGrey, '
      'customLightGrey: $customLightGrey, '
      'contrastBackgroundColor: $contrastBackgroundColor, '
      'activeControlColor: $activeControlColor, '
      'activeSwitchTrackColor: $activeSwitchTrackColor, '
      'avatarBackgroundColor: $avatarBackgroundColor, '
      'settingsIconColor: $settingsIconColor, '
      'actionButtonColor: $actionButtonColor, '
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
    appBarBackgroundColor: Colors.blue,
    primaryAccent: Color(0xfff03b8a),
    primaryTextColor: Colors.black,
    customGreen: Color(0xff74fe07),
    customGrey: Color(0xff6a6a6a),
    customLightGrey: Color(0xff6a6a6a),
    contrastBackgroundColor: Colors.white,
    activeControlColor: Colors.blue,
    activeSwitchTrackColor: Color(0xff90CAF9),
    avatarBackgroundColor: Color(0xffD3D3D3),
    settingsIconColor: Color(0xff4285F4),
    actionButtonColor: Color(0xff333333),
  );

  /// ****************************************************************
  /// Dark Theme
  /// ****************************************************************
  static const dark = CustomTheme(
    success: Color(0xff12af18),
    info: Color(0xff17a2b8),
    warning: Color(0xfff39c12),
    danger: Color(0xffe74c3c),
    scaffoldBackgroundColor: Color(0xff1d1d1d),
    appBarBackgroundColor: Color(0xff2F2F2F),
    primaryAccent: Color(0xfff03b8a),
    primaryTextColor: Colors.white,
    customGreen: Color(0xff74fe07),
    customGrey: Color(0xff6a6a6a),
    customLightGrey: Color(0xffc0c0c0),
    contrastBackgroundColor: Color(0xff424242),
    activeControlColor: Color(0xff1E88E5),
    activeSwitchTrackColor: Color(0xff64B5F6),
    avatarBackgroundColor: Color(0xff333333),
    settingsIconColor: Color(0xff4285F4),
    actionButtonColor: Colors.white,
  );
}
