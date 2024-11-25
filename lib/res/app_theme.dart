import 'package:flutter/material.dart';
import 'package:spendsmart/res/app_colors.dart';
import 'package:spendsmart/res/app_size.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme({required double sizeMultiplier}) => ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: textThemeBoth(sizeMultiplier),
        primaryColor: AppColors.primary,
        primaryColorDark: AppColors.text,
        scaffoldBackgroundColor: AppColors.bg,
        cardTheme: lightCardTheme(sizeMultiplier),
        highlightColor: AppColors.inverse,
        cardColor: AppColors.bg,
        inputDecorationTheme: lightInputDecorationTheme(sizeMultiplier),
        dividerColor: AppColors.text.withOpacity(0.2),
        appBarTheme: appBarThemeLight(sizeMultiplier),
        textButtonTheme: textButtonTheme,
        elevatedButtonTheme: elevatedButtonTheme(sizeMultiplier),
        chipTheme: chipThemeLight(sizeMultiplier),
        dividerTheme: dividerTheme,
        dialogTheme: dialogThemeLight(sizeMultiplier),
        iconTheme: iconThemeLight(sizeMultiplier),
        datePickerTheme: datePickerThemeLight(sizeMultiplier),
      );

  // Dark Theme
  static ThemeData darkTheme({required double sizeMultiplier}) => ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: textThemeBoth(sizeMultiplier),
        primaryColor: AppColors.primaryDark,
        primaryColorDark: AppColors.textDark,
        scaffoldBackgroundColor: AppColors.bgDark,
        cardTheme: darkCardTheme(sizeMultiplier),
        highlightColor: AppColors.inverseDark,
        cardColor: AppColors.bgDark,
        inputDecorationTheme: darkInputDecorationTheme(sizeMultiplier),
        dividerColor: AppColors.textDark.withOpacity(0.2),
        appBarTheme: appBarThemeDark(sizeMultiplier),
        textButtonTheme: textButtonTheme,
        elevatedButtonTheme: elevatedButtonTheme(sizeMultiplier),
        chipTheme: chipThemeDark(sizeMultiplier),
        dividerTheme: dividerTheme,
        dialogTheme: dialogThemeDark(sizeMultiplier),
        iconTheme: iconThemeDark(sizeMultiplier),
        datePickerTheme: datePickerThemeDark(sizeMultiplier),
      );

  // Light and Dark Color Schemes
  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: AppColors.primary,
    error: AppColors.error,
    surface: AppColors.bg,
    onSurface: AppColors.text,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    shadow: AppColors.shadow,
    inversePrimary: AppColors.inverse,
  );

  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: AppColors.primaryDark,
    error: AppColors.errorDark,
    surface: AppColors.bgDark,
    onSurface: AppColors.textDark,
    secondary: AppColors.secondaryDark,
    onSecondary: AppColors.onSecondaryDark,
    shadow: AppColors.shadowDark,
    inversePrimary: AppColors.inverseDark,
  );

  // Text Theme
  static TextTheme textThemeBoth(double sizeMultiplier) => TextTheme(
        displayLarge: _textStyle(
          28,
          FontWeight.w700,
          1.2,
          0.15,
          sizeMultiplier,
        ),
        displayMedium: _textStyle(
          18,
          FontWeight.w500,
          1.4,
          0.15,
          sizeMultiplier,
        ),
        displaySmall: _textStyle(
          14,
          FontWeight.w500,
          1.3,
          0.1,
          sizeMultiplier,
        ),
        bodyLarge: _textStyle(
          16,
          FontWeight.w400,
          1.5,
          0.5,
          sizeMultiplier,
        ),
        bodyMedium: _textStyle(
          14,
          FontWeight.w400,
          1.4,
          0.25,
          sizeMultiplier,
        ),
        bodySmall: _textStyle(
          12,
          FontWeight.w400,
          1.3,
          0.4,
          sizeMultiplier,
        ),
        labelLarge: _textStyle(
          14,
          FontWeight.w500,
          null,
          0.5,
          sizeMultiplier,
        ),
        labelMedium: _textStyle(
          12,
          FontWeight.w400,
          null,
          0.4,
          sizeMultiplier,
        ),
        labelSmall: _textStyle(
          10,
          FontWeight.w400,
          null,
          0.2,
          sizeMultiplier,
        ),
      );

  static TextStyle _textStyle(double size, FontWeight weight, double? height,
      double letterSpacing, double sizeMultiplier) {
    return TextStyle(
      fontSize: size * sizeMultiplier,
      fontWeight: weight,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // Card Themes
  static CardTheme lightCardTheme(double sizeMultiplier) =>
      _cardTheme(AppColors.bg, sizeMultiplier);
  static CardTheme darkCardTheme(double sizeMultiplier) =>
      _cardTheme(AppColors.bgDark, sizeMultiplier);

  static CardTheme _cardTheme(Color color, double sizeMultiplier) => CardTheme(
        color: color,
        elevation: 10 * sizeMultiplier,
        margin: EdgeInsets.all(8 * sizeMultiplier),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppSize.defaultRadius * sizeMultiplier),
        ),
      );

  // Input Decoration Themes
  static InputDecorationTheme lightInputDecorationTheme(
          double sizeMultiplier) =>
      _inputDecorationTheme(
          AppColors.bg, AppColors.text, AppColors.primary, sizeMultiplier);
  static InputDecorationTheme darkInputDecorationTheme(double sizeMultiplier) =>
      _inputDecorationTheme(AppColors.bgDark, AppColors.textDark,
          AppColors.primaryDark, sizeMultiplier);

  static InputDecorationTheme _inputDecorationTheme(Color fillColor,
          Color borderColor, Color focusedBorderColor, double sizeMultiplier) =>
      InputDecorationTheme(
        filled: true,
        fillColor: fillColor,
        contentPadding: EdgeInsets.symmetric(
            vertical: 2 * sizeMultiplier, horizontal: 10 * sizeMultiplier),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(AppSize.defaultRadius * sizeMultiplier),
          borderSide: BorderSide(color: borderColor, width: 2 * sizeMultiplier),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(AppSize.defaultRadius * sizeMultiplier),
          borderSide:
              BorderSide(color: focusedBorderColor, width: 2 * sizeMultiplier),
        ),
        labelStyle: TextStyle(color: borderColor),
        hintStyle: TextStyle(color: borderColor.withOpacity(0.6)),
      );

  // AppBar Themes
  static AppBarTheme appBarThemeLight(double sizeMultiplier) =>
      _appBarTheme(AppColors.primary, AppColors.bg, sizeMultiplier);
  static AppBarTheme appBarThemeDark(double sizeMultiplier) =>
      _appBarTheme(AppColors.primaryDark, AppColors.bgDark, sizeMultiplier);

  static AppBarTheme _appBarTheme(
          Color bgColor, Color titleColor, double sizeMultiplier) =>
      AppBarTheme(
        backgroundColor: bgColor,
        titleTextStyle: TextStyle(
          color: titleColor,
          fontSize: 20 * sizeMultiplier,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: titleColor),
        centerTitle: true,
      );

  // Button Themes
  static final TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primary,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );

  static ElevatedButtonThemeData elevatedButtonTheme(double sizeMultiplier) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.onSecondary,
          backgroundColor: AppColors.primary,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                AppSize.defaultBtnRadius * sizeMultiplier),
          ),
        ),
      );

  // Chip Themes
  static ChipThemeData chipThemeLight(double sizeMultiplier) =>
      _chipTheme(AppColors.bg, AppColors.text, sizeMultiplier);
  static ChipThemeData chipThemeDark(double sizeMultiplier) =>
      _chipTheme(AppColors.bgDark, AppColors.textDark, sizeMultiplier);

  static ChipThemeData _chipTheme(
          Color bgColor, Color textColor, double sizeMultiplier) =>
      ChipThemeData(
        backgroundColor: bgColor,
        labelStyle: TextStyle(color: textColor),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppSize.defaultBtnRadius * sizeMultiplier),
        ),
      );

  // Divider Theme
  static const DividerThemeData dividerTheme = DividerThemeData(
    color: AppColors.shadow,
    thickness: 1,
    space: 32,
  );

  // Dialog Themes
  static DialogTheme dialogThemeLight(double sizeMultiplier) =>
      _dialogTheme(AppColors.bg, AppColors.text, sizeMultiplier);
  static DialogTheme dialogThemeDark(double sizeMultiplier) =>
      _dialogTheme(AppColors.bgDark, AppColors.textDark, sizeMultiplier);

  static DialogTheme _dialogTheme(
          Color bgColor, Color textColor, double sizeMultiplier) =>
      DialogTheme(
        backgroundColor: bgColor,
        titleTextStyle: TextStyle(
            color: textColor,
            fontSize: 18 * sizeMultiplier,
            fontWeight: FontWeight.w600),
        contentTextStyle:
            TextStyle(color: textColor, fontSize: 16 * sizeMultiplier),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppSize.defaultRadius * sizeMultiplier),
        ),
      );

  // Icon Themes
  static IconThemeData iconThemeLight(double sizeMultiplier) => IconThemeData(
        color: AppColors.text,
        size: 24 * sizeMultiplier,
      );
  static IconThemeData iconThemeDark(double sizeMultiplier) => IconThemeData(
        color: AppColors.textDark,
        size: 24 * sizeMultiplier,
      );

  // Date Picker Themes
  static DatePickerThemeData datePickerThemeLight(double sizeMultiplier) =>
      _datePickerTheme(
          AppColors.bg, AppColors.primary, AppColors.text, sizeMultiplier);
  static DatePickerThemeData datePickerThemeDark(double sizeMultiplier) =>
      _datePickerTheme(AppColors.bgDark, AppColors.primaryDark,
          AppColors.textDark, sizeMultiplier);

  static DatePickerThemeData _datePickerTheme(Color bgColor, Color headerColor,
          Color textColor, double sizeMultiplier) =>
      DatePickerThemeData(
        backgroundColor: bgColor,
        headerBackgroundColor: headerColor,
        yearStyle: TextStyle(
            color: textColor,
            fontSize: 18 * sizeMultiplier,
            fontWeight: FontWeight.w600),
        dayStyle: TextStyle(color: textColor, fontSize: 16 * sizeMultiplier),
        weekdayStyle: TextStyle(
            color: textColor.withOpacity(0.7), fontSize: 14 * sizeMultiplier),
      );
}
