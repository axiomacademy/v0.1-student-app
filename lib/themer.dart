import 'package:flutter/material.dart';

/// Axiom Primary Color
const primaryColor = Color(0xFF7938D8);

/// Axiom Primary Color Light
const primaryColors_100 = Color(0xFFA378E5);

/// Axiom Secondary Color
const secondaryColor = Color(0xFF491496);

/// Axiom Accent Color
const accentColor = Color(0xFFDD1155);

/// Builds the basic Axiom Theme
ThemeData buildTheme() {
  final base = ThemeData.light();
  final textBase = buildTextTheme(base.textTheme);
  final fabBase = buildFabTheme(base.floatingActionButtonTheme);

  return base.copyWith(
    primaryColor: primaryColor,
    primaryColorDark: secondaryColor,
    accentColor: accentColor,
    textTheme: textBase,
    cursorColor: primaryColors_100,
    highlightColor: Color(0x00FFFFFF),
    splashColor: Color(0x00FFFFFF),
    primaryTextTheme:
        textBase.apply(displayColor: primaryColor, bodyColor: primaryColor),
    accentTextTheme:
        textBase.apply(displayColor: accentColor, bodyColor: accentColor),
    floatingActionButtonTheme: fabBase,
  );
}

/// Builds the basic Axiom text theme
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

/// Builds the basic Axiom FAB theme
FloatingActionButtonThemeData buildFabTheme(
    FloatingActionButtonThemeData base) {
  return base.copyWith(
    foregroundColor: Colors.white,
    backgroundColor: primaryColor,
  );
}
