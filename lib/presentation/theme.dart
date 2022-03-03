import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const purple = Color.fromRGBO(81, 23, 172, 1);
  static const green = Color.fromRGBO(32, 208, 196, 1);
  static const shadow = Color.fromRGBO(187, 187, 187, 1);
  static const lightShadow = Color.fromRGBO(187, 187, 187, .2);
  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const onSurface = Color.fromRGBO(48, 55, 72, 1);
}
class AppColorsDark {
  static const purple = Color.fromRGBO(81, 23, 172, 1);
  static const green = Color.fromRGBO(32, 208, 196, 1);
  static const background = Color.fromRGBO(23, 25, 26, 1);
  static const onSurface = Color.fromRGBO(36, 38, 39, 1);
}

class Default {
  static const padding = 15.0;
  static const radius = 10.0;
  static const duration = Duration(milliseconds: 300);
}

const appGradienst = [
  AppColors.purple,
  AppColors.green
];

class AppTheme {

  static final _defaultAppbarTheme = AppBarTheme(
    centerTitle: true,
    toolbarHeight: 70,
    titleTextStyle: GoogleFonts.poppins().copyWith(fontWeight: FontWeight.w800, fontSize: 16),
  );


  static final _defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Default.radius),
    borderSide:  const BorderSide(
      color: AppColors.purple,
      width: 2,
      style: BorderStyle.solid
    ),
  );

  
  static final _defaultCardTheme = CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Default.radius)),
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: Default.padding),
      elevation: 4,
  );

  static const _pageTransitionsTheme = PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
  });

  static final _elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Default.radius)),
        ),
      )
    );



  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: _defaultAppbarTheme.copyWith(
      backgroundColor: AppColors.white,
      titleTextStyle: _defaultAppbarTheme.titleTextStyle?.copyWith(color: AppColors.purple),
      shadowColor: AppColors.lightShadow,
      iconTheme: const IconThemeData(color: AppColors.purple)
    ),
    colorScheme: ThemeData.light().colorScheme.copyWith(
      primary: AppColors.purple,
      secondary: AppColors.green,
      background: AppColors.white,
      onBackground: Colors.black,
      shadow: AppColors.lightShadow,
      error: Colors.red,
      onError: Colors.white
    ),
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: AppColors.purple,
      displayColor: AppColors.purple,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: _defaultBorder,
      enabledBorder: _defaultBorder.copyWith(borderSide: _defaultBorder.borderSide.copyWith(color: AppColors.lightShadow)),
      prefixIconColor: AppColors.purple,
    ),
    elevatedButtonTheme: _elevatedButtonTheme,
    cardTheme: _defaultCardTheme.copyWith(shadowColor: AppColors.lightShadow),
    toggleableActiveColor: AppColors.purple,
    disabledColor: AppColors.lightShadow,
    pageTransitionsTheme: _pageTransitionsTheme
  );


  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: _defaultAppbarTheme.copyWith(
      backgroundColor: AppColors.purple,
    ),
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ThemeData.dark().colorScheme.copyWith(
      primary: AppColors.purple,
      secondary: AppColors.green,
      background: Colors.black,
      shadow: AppColors.lightShadow,
      error: Colors.red,
      onError: Colors.white
    ),
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
    elevatedButtonTheme: _elevatedButtonTheme,
    cardTheme:_defaultCardTheme.copyWith(color: AppColorsDark.onSurface),
    toggleableActiveColor: AppColors.green,
    disabledColor: AppColors.shadow,
    pageTransitionsTheme: _pageTransitionsTheme
  );

}
