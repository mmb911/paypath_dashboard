import 'package:flutter/material.dart';
import 'package:pay_mobile_web_admin/core/utils/color_constants.dart';

class ThemeManager {
  final lightTheme = ThemeData(
    fontFamily: 'Comfortaa',
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: primaryAppColor,
      background: scaffoldBackgroundColor,
      brightness: Brightness.light,
      error: errorColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: scaffoldBackgroundColor,
      surfaceTintColor: transparentColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryAppColor,
      ),
    ),
  );

  // final darkTheme = ThemeData(
  //     //To be implemented later if decided
  //     );
}
