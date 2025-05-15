import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF4361EE);
  static const Color primaryLightColor = Color(0xFF4895EF);
  static const Color secondaryColor = Color(0xFF3F37C9);
  static const Color dangerColor = Color(0xFFF72585);
  static const Color successColor = Color(0xFF4CC9F0);
  static const Color warningColor = Color(0xFFF8961E);
  static const Color darkColor = Color(0xFF212529);
  static const Color lightColor = Color(0xFFF8F9FA);
  static const Color grayColor = Color(0xFF6C757D);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const double borderRadius = 12.0;
  static const BoxShadow boxShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.08),
    offset: Offset(0, 4),
    blurRadius: 20,
  );
  static const Duration transitionDuration = Duration(milliseconds: 300);
  static const Curve transitionCurve = Curves.ease;

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(primary: primaryColor, secondary: secondaryColor),
    scaffoldBackgroundColor: const Color(0xFFF5F7FB),
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: darkColor),
      headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: darkColor),
      headlineSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: darkColor),
      bodyLarge: TextStyle(fontSize: 16.0, color: darkColor),
      bodyMedium: TextStyle(fontSize: 14.0, color: grayColor),
      bodySmall: TextStyle(fontSize: 12.0, color: grayColor),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: whiteColor,
      ),
      iconTheme: IconThemeData(color: whiteColor),
    ),
    cardTheme: CardTheme(
      color: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16.0),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: whiteColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        side: const BorderSide(color: primaryColor),
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: primaryColor),
      ),
      labelStyle: const TextStyle(color: darkColor, fontWeight: FontWeight.w500),
      hintStyle: const TextStyle(color: grayColor),
    ),
    iconTheme: const IconThemeData(color: darkColor),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.dark(primary: primaryColor, secondary: secondaryColor),
    scaffoldBackgroundColor: darkColor,
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: whiteColor),
      headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: whiteColor),
      headlineSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: whiteColor),
      bodyLarge: TextStyle(fontSize: 16.0, color: whiteColor),
      bodyMedium: TextStyle(fontSize: 14.0, color: grayColor),
      bodySmall: TextStyle(fontSize: 12.0, color: grayColor),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: secondaryColor,
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: whiteColor,
      ),
      iconTheme: IconThemeData(color: whiteColor),
    ),
    cardTheme: CardTheme(
      color: const Color(0xFF303030),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16.0),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryLightColor,
      foregroundColor: whiteColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryLightColor,
        foregroundColor: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        side: const BorderSide(color: primaryLightColor),
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Color(0xFF505050)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: primaryLightColor),
      ),
      labelStyle: const TextStyle(color: whiteColor, fontWeight: FontWeight.w500),
      hintStyle: const TextStyle(color: grayColor),
    ),
    iconTheme: const IconThemeData(color: whiteColor),
  );
}