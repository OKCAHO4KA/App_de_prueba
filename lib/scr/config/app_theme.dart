import 'package:flutter/material.dart';

class AppTheme {
  final String hintText = '';
  final myTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: const Color(0xffF3F4F6),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Color(0xffFEFEFE),
        titleTextStyle: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black)),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      fillColor: Color(0xffFEFEFE),
      filled: true,
      hintStyle: TextStyle(
          color: Color(0xffC3C3C3), fontWeight: FontWeight.w400, fontSize: 16),
    ),
  );
  // final Color colorButton = const Color(0xff4631D2);
  final TextStyle textStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontFamily: 'Manrope');

  final TextStyle textStyleExit = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Color(0xffEC3A4D),
      fontFamily: 'Manrope');

  final TextStyle textStyleName = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: 'Manrope');
}
