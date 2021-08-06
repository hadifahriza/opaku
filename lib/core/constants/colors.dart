import 'package:flutter/material.dart';

const Color kWhite = Color(0xFFFFFFFF);
const Color kBlack = Color(0xFF010101);
const Color kRed = Color(0xFFFF7530);
const Color kOrange = Color(0xFFFED480);

MaterialColor customPrimaryColor = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: kWhite.withAlpha(0),
    100: kWhite.withAlpha(20),
    200: kWhite.withAlpha(40),
    300: kWhite.withAlpha(60),
    400: kWhite.withAlpha(80),
    500: kWhite,
    600: kWhite.withAlpha(120),
    700: kWhite.withAlpha(140),
    800: kWhite.withAlpha(160),
    900: kWhite.withAlpha(180),
  },
);