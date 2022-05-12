import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color purple = const Color(0xff6045E2);
  static Color green = const Color(0xff2ECC71);
  static Color red = const Color(0xffFF1800);
  static Color black = const Color(0xff121212);
  static Color white = const Color(0xffFFFFFF);
  static Color grey = const Color(0xffC8C8C8);

  static TextStyle kHeading4 = GoogleFonts.inter(
    fontSize: 30,
    fontWeight: FontWeight.w700,
  );

  static TextStyle kHeading5 = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
  );

  static TextStyle kHeading6 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );

  static TextStyle kSubtitle = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );

  static TextStyle kBodyText = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  static final kColorScheme = ColorScheme(
    primary: purple,
    primaryVariant: purple,
    secondary: const Color(0xffC0B2FF),
    secondaryVariant: const Color(0xffC0B2FF),
    surface: white,
    background: white,
    error: Colors.red,
    onPrimary: white,
    onSecondary: Colors.white,
    onSurface: Colors.black87,
    onBackground: Colors.white,
    onError: Colors.white,
    brightness: Brightness.light,
  );
}
