import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    shadowColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.grey,
    primaryColor: Colors.amber,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFFFFFFF),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );

  static final ThemeData darkTheme = ThemeData(
    shadowColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    primarySwatch: Colors.grey,
    primaryColor: Colors.amber,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF000000),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  static final TextStyle drawerTextStyle = GoogleFonts.anton(
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );

  static final TextStyle mainMenuTextStyle = GoogleFonts.staatliches(
    color: Colors.amber,
    fontSize: 20,
  );
}
