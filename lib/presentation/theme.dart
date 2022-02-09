import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const purple = Color.fromRGBO(81, 23, 172, 1);
  static const green = Color.fromRGBO(32, 208, 196, 1);
  static const shadow = Color.fromRGBO(187, 187, 187, 1);
  static const lightShadow = Color.fromRGBO(187, 187, 187, .4);
  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const onSurface = Color.fromRGBO(48, 55, 72, 1);
}

class Default {
  static const padding = 20.0;
  static const radius = 10.0;
}

const appGradienst = [
  AppColors.purple,
  AppColors.green
];

class AppTheme {  
  static final _defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Default.radius),
    borderSide:  const BorderSide(
      color: AppColors.purple,
      width: 2,
      style: BorderStyle.solid
    ),
  );



  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      centerTitle: true,
      toolbarHeight: 70,
      titleTextStyle: GoogleFonts.poppins().copyWith(color: AppColors.purple, fontWeight: FontWeight.w800, fontSize: 16),
      shadowColor: AppColors.lightShadow
    ),
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: AppColors.purple,
      displayColor: AppColors.purple
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: _defaultBorder,
      enabledBorder: _defaultBorder.copyWith(borderSide: _defaultBorder.borderSide.copyWith(color: AppColors.lightShadow)),
      prefixIconColor: AppColors.purple,
    ),
  );


  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.purple,
      centerTitle: true,
      toolbarHeight: 70,
      titleTextStyle: GoogleFonts.poppins().copyWith(fontWeight: FontWeight.w800, fontSize: 16)
    ),
    scaffoldBackgroundColor: Colors.black,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: AppColors.green,
      displayColor: AppColors.green
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor:  AppColors.onSurface,
      filled: true,
      focusedBorder: _defaultBorder.copyWith(borderSide: _defaultBorder.borderSide.copyWith(color: Colors.transparent)),
      enabledBorder: _defaultBorder.copyWith(borderSide: _defaultBorder.borderSide.copyWith(color: Colors.transparent)),
      prefixIconColor: AppColors.white,
      hintStyle: GoogleFonts.poppins(
        color: AppColors.white
      )
    ),
  );

}
