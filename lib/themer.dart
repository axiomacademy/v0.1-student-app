import 'package:flutter/material.dart';

const primaryColor = const Color(0xFF7938D8);
const primaryColors_100 = const Color(0xFFA378E5);
const secondaryColor = const Color(0xFF491496);
const accentColor = const Color(0xFFDD1155);

ThemeData buildTheme() {
  final ThemeData base = ThemeData.light();
  final TextTheme textBase = buildTextTheme(base.textTheme);
  final FloatingActionButtonThemeData fabBase =
      buildFabTheme(base.floatingActionButtonTheme);

  return base.copyWith(
    primaryColor: primaryColor,
    primaryColorDark: secondaryColor,
    accentColor: accentColor,
    textTheme: textBase,
    cursorColor: primaryColors_100,
    primaryTextTheme:
        textBase.apply(displayColor: primaryColor, bodyColor: primaryColor),
    accentTextTheme:
        textBase.apply(displayColor: accentColor, bodyColor: accentColor),
    floatingActionButtonTheme: fabBase,
  );
}

TextTheme buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline1: base.headline1.copyWith(
        fontFamily: "IBM Plex Sans", fontWeight: FontWeight.w300, fontSize: 96),
    headline2: base.headline2.copyWith(
        fontFamily: "IBM Plex Sans", fontWeight: FontWeight.w300, fontSize: 60),
    headline3: base.headline3.copyWith(
        fontFamily: "IBM Plex Sans", fontWeight: FontWeight.w400, fontSize: 48),
    headline4: base.headline4.copyWith(
        fontFamily: "IBM Plex Sans", fontWeight: FontWeight.w400, fontSize: 34),
    headline5: base.headline5.copyWith(
        fontFamily: "IBM Plex Sans", fontWeight: FontWeight.w500, fontSize: 20),
    button: base.button.copyWith(
        fontWeight: FontWeight.w500, fontSize: 14.0, letterSpacing: 1.25),
  );
}

FloatingActionButtonThemeData buildFabTheme(
    FloatingActionButtonThemeData base) {
  return base.copyWith(
    foregroundColor: Colors.white,
    backgroundColor: primaryColor,
  );
}
