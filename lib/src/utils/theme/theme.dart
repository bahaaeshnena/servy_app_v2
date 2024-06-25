import 'package:flutter/material.dart';

import 'package:servy_app/src/utils/theme/custom_themes/appbar_theme.dart';
import 'package:servy_app/src/utils/theme/custom_themes/buttom_sheet.dart';
import 'package:servy_app/src/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:servy_app/src/utils/theme/custom_themes/chip_theme.dart';
import 'package:servy_app/src/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:servy_app/src/utils/theme/custom_themes/outlined_button.dart';
import 'package:servy_app/src/utils/theme/custom_themes/text_field_theme.dart';
import 'package:servy_app/src/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: const Color(0xff8B93FF),
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBar.lightAppBarTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckboxThemeData,
    bottomSheetTheme: TButttonSheetTheme.lightBottomSheetThemeData,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: const Color(0xff8B93FF),
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TAppBar.darkAppBarTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckboxThemeData,
    bottomSheetTheme: TButttonSheetTheme.darkBottomSheetThemeData,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
