import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color primaryColor = Color(0xFFdd2c00);
final Color primaryLightColor = Color(0xFFff6434);
final Color primaryDarkColor = Color(0xFFa30000);

final Color secondaryColor = Color(0xFFffb300);
final Color secondaryLightColor = Color(0xFFffe54c);
final Color secondaryDarkColor = Color(0xFFffe54c);

final Color primaryTextcolor = Color(0xFF0a0a0a);

final TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.roboto(
    fontSize: 96,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  headline2: GoogleFonts.roboto(
    fontSize: 60,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  headline3: GoogleFonts.roboto(
    fontSize: 48,
    fontWeight: FontWeight.w400,
  ),
  headline4: GoogleFonts.roboto(
    fontSize: 34,
    fontWeight: FontWeight.bold,
    color: primaryColor,
    letterSpacing: 0.25,
  ),
  headline5: GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: primaryTextcolor,
  ),
  headline6: GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    color: primaryTextcolor.withOpacity(0.3),
  ),
  subtitle1: GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: primaryTextcolor,
    letterSpacing: 0.15,
  ),
  subtitle2: GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w900,
    letterSpacing: 0.1,
  ),
  bodyText1: GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyText2: GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  button: GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
    color: Colors.white,
  ),
  caption: GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),
  overline: GoogleFonts.openSans(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  ),
);
