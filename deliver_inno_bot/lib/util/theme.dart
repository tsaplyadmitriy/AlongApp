import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(

        backgroundColor: Color(0xFFFAFAFA),
        fontFamily: 'Cannonade',
        accentColor: Color(0xFF0A78FF),
      );

  static TextStyle get boldText24 => TextStyle(
        color: Colors.black,
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Cannonade',
      );

  static TextStyle get boldText17 => TextStyle(
        color: Colors.black,
        fontSize: 17.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Cannonade',
      );

  static TextStyle get redText => TextStyle(
        color: Colors.red,
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Cannonade',
      );

  static TextStyle get greyText14lowOpacity => TextStyle(
        color: Colors.black.withOpacity(0.3),
        fontFamily: 'Cannonade',
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
      );
  static TextStyle get greyText17lowOpacity => TextStyle(
        color: Colors.black.withOpacity(0.3),
        fontFamily: 'Cannonade',
        fontWeight: FontWeight.w400,
        fontSize: 17.0,
      );
  static TextStyle get redText17lowOpacity => TextStyle(
        color: Colors.red.withOpacity(0.3),
        fontFamily: 'Cannonade',
        fontWeight: FontWeight.w400,
        fontSize: 17.0,
      );

  static TextStyle get smallBlackText => TextStyle(
        color: Colors.black.withOpacity(0.7),
        fontFamily: 'Cannonade',
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
      );

  static TextStyle get accentText17 => TextStyle(
        color: theme.accentColor,
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        fontFamily: 'Cannonade',
      );

  static TextStyle get accentText17disabled => TextStyle(
        color: theme.accentColor.withOpacity(0.3),
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        fontFamily: 'Cannonade',
      );
  static TextStyle get blackText17 => TextStyle(
        color: Colors.black,
        fontSize: 17.0,
        fontFamily: 'Cannonade',
        fontWeight: FontWeight.w400,
      );

  static ThemeData get darkTheme {
    return ThemeData.dark();
  }
}
