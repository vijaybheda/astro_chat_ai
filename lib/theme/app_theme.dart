import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'font_family.dart';

class ThemeColor {
  ThemeData getThemeData({required bool isDark}) {
    return ThemeData(
      primaryColor: ThemeColors.primaryColor,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: ThemeColors.lightPrimaryColor),
      scaffoldBackgroundColor: ThemeColors.backgroundColor,
      fontFamily: FontFamily.fontFamilyName,
      canvasColor: ThemeColors.backgroundColor,
      iconTheme: IconThemeData(color: ThemeColors.black10),
      inputDecorationTheme: getInputDecorationTheme(isDark: isDark),
      sliderTheme: const SliderThemeData(
        thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 5, disabledThumbRadius: 5),
      ),
      radioTheme: RadioThemeData(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          fillColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return ThemeColors.primaryColor;
            }
            return ThemeColors.black20;
          })),
      textTheme: GoogleFonts.getTextTheme(FontFamily.fontFamilyName),
      scrollbarTheme: const ScrollbarThemeData().copyWith(
        thumbColor: MaterialStateProperty.all(Colors.black.withOpacity(0.24)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(ThemeColors.primaryColor),
          foregroundColor:
              MaterialStateProperty.all<Color>(ThemeColors.whiteColor),
          padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          elevation: MaterialStateProperty.all<double>(0),
          enableFeedback: true,
        ),
      ),
    );
  }

  InputDecorationTheme getInputDecorationTheme({
    required bool isDark,
  }) {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.all(14),
      errorMaxLines: 2,
      filled: true,
      fillColor: ThemeColors.black10,
      disabledBorder: getTextFieldBorder(isDark: isDark),
      errorBorder: getTextFieldBorder(isDark: isDark).copyWith(
        borderSide: const BorderSide(color: ThemeColors.grey, width: 1),
      ),
      enabledBorder: getTextFieldBorder(isDark: isDark),
      isDense: true,
      focusedBorder: getTextFieldBorder(isDark: isDark),
      border: getTextFieldBorder(isDark: isDark),
      errorStyle: getErrorStyle(isDark: isDark),
      hintStyle: getHintText(isDark: isDark),
      labelStyle: getHintText(isDark: isDark),
      focusColor: ThemeColors.black10,
      alignLabelWithHint: false,
    );
  }

  OutlineInputBorder getTextFieldBorder({
    required bool isDark,
  }) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: ThemeColors.black10, width: 1),
      borderRadius: BorderRadius.circular(8),
      gapPadding: 0,
    );
  }

  TextStyle getHintText({
    required bool isDark,
  }) {
    return TextStyle(
      color: ThemeColors.black10,
    );
  }

  TextStyle getErrorStyle({
    required bool isDark,
  }) {
    return const TextStyle(color: ThemeColors.grey);
  }
}
