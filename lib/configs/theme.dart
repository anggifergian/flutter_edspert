import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_edspert/configs/constant.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFF3F7F8),
      textTheme: const TextTheme(
        labelLarge: TextStyle(fontSize: 37),
        labelMedium: TextStyle(fontSize: 22),
        labelSmall: TextStyle(fontSize: 16),
        bodyMedium: TextStyle(color: secondaryColor40LightTheme),
      ),
      appBarTheme: const AppBarTheme(
          centerTitle: false,
          backgroundColor: Color(0xFF3A7FD5),
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          toolbarTextStyle: TextStyle(color: textColorLightTheme)),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding),
        fillColor: secondaryColor5LightTheme,
        filled: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: const Size(double.infinity, 48),
              shape: const StadiumBorder(),
              backgroundColor: primaryColor,
              textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600))));
}
