
import 'package:flutter/material.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

//-----Creating a custom constructor for Mood of Theme------//
class MAppTheme {
  MAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 12, 141, 169),
    scaffoldBackgroundColor: Colors.white,
    textTheme: MTextTheme.lightTextTheme,
    appBarTheme: MAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: MBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: MElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MTextFormFieldTheme.lightInputDecorationTheme,
  );


  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 12, 141, 169),
    scaffoldBackgroundColor: const Color(0xFF121212),
    textTheme: MTextTheme.darkTextTheme,
    elevatedButtonTheme: MElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: MAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: MBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: MOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MTextFormFieldTheme.darkInputDecorationTheme,
  );
}
