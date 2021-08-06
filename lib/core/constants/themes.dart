import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final customTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: GoogleFonts.openSansTextTheme(),
  // primaryColorDark: const Color(0xFF0097A7),
  // primaryColorLight: const Color(0xFFB2EBF2),
  primaryColor: kWhite,
  accentColor: kRed,
  focusColor: kBlack,
  scaffoldBackgroundColor: kWhite,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
);