import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class MCheckboxThemeData {
  MCheckboxThemeData._();

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return MColors.primaryColor;
      } else {
        return Colors.transparent;
      }
    }),
  );

  ///Customizable dark text theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return MColors.primaryColor;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
