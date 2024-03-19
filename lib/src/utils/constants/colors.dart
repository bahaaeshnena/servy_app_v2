import 'package:flutter/material.dart';

class TColors {
  TColors._();

//--App Basic Colors
  static const Color primaryColor = Color(0xFF4868FF);
  static const Color secondry = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);

//--Gradient Colors
  static const Gradient linerGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
        Color(0xffff9a9e),
        Color(0xfffad0c4),
        Color(0xfffad0c4),
      ]);

//--Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondry = Color(0xFF6C7570);
  static const Color textWhite = Colors.white;

//--Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

//--Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = TColors.textWhite.withOpacity(0.1);

//--Button Colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondry = Color(0xFF6C7570);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

//--Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondry = Color(0xFFE6E6E6);

//--error and validation Colors
  static const Color error = Color(0xFFD34F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

//--neutral  Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
}
