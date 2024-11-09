import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendsmart/res/app_colors.dart';
import 'package:spendsmart/res/app_size.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: textTheme,
        primaryColor: AppColors.primary,
        primaryColorDark: AppColors.text,
        scaffoldBackgroundColor: AppColors.bg,
        cardTheme: lightCardTheme,
        highlightColor: AppColors.inverse,
        cardColor: AppColors.bg,
        inputDecorationTheme: lightInputDecorationTheme,
        dividerColor: AppColors.text.withOpacity(0.2),
        appBarTheme: appBarThemeLight,
        textButtonTheme: textButtonTheme,
        elevatedButtonTheme: elevatedButtonTheme,
        chipTheme: chipThemeLight,
        dividerTheme: dividerTheme,
        dialogTheme: dialogThemeLight,
        iconTheme: iconThemeLight,
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: textTheme,
        primaryColor: AppColors.primaryDark,
        primaryColorDark: AppColors.textDark,
        scaffoldBackgroundColor: AppColors.bgDark,
        cardTheme: darkCardTheme,
        highlightColor: AppColors.inverseDark,
        cardColor: AppColors.bgDark,
        inputDecorationTheme: darkInputDecorationTheme,
        dividerColor: AppColors.textDark.withOpacity(0.2),
        appBarTheme: appBarThemeDark,
        textButtonTheme: textButtonTheme,
        elevatedButtonTheme: elevatedButtonTheme,
        chipTheme: chipThemeDark,
        dividerTheme: dividerTheme,
        dialogTheme: dialogThemeDark,
        iconTheme: iconThemeDark,
      );

  static const ColorScheme lightColorScheme = ColorScheme.light(
    brightness: Brightness.light,
    primary: AppColors.primary,
    error: AppColors.error,
    surface: AppColors.bg,
    onSurface: AppColors.text,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    shadow: AppColors.shadow,
    inversePrimary: AppColors.inverse,
    surfaceTint: AppColors.primary,
  );
  static const ColorScheme darkColorScheme = ColorScheme.dark(
    brightness: Brightness.dark,
    primary: AppColors.primaryDark,
    error: AppColors.errorDark,
    surface: AppColors.bgDark,
    onSurface: AppColors.textDark,
    secondary: AppColors.secondaryDark,
    onSecondary: AppColors.onSecondaryDark,
    shadow: AppColors.shadowDark,
    inversePrimary: AppColors.inverseDark,
    surfaceTint: AppColors.primaryDark,
  );
  static TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.roboto(
      fontWeight: FontWeight.w700,
      fontSize: 28.sp,
      letterSpacing: 0.15,
      height: 1.2,
    ),
    displayMedium: GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      fontSize: 18.sp,
      letterSpacing: 0.15,
      height: 1.4,
    ),
    displaySmall: GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      letterSpacing: 0.1,
      height: 1.3,
    ),
    bodyLarge: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      letterSpacing: 0.5,
      height: 1.5,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      letterSpacing: 0.25,
      height: 1.4,
    ),
    bodySmall: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      letterSpacing: 0.4,
      height: 1.3,
    ),
    labelLarge: GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      letterSpacing: 0.5,
    ),
    labelMedium: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      letterSpacing: 0.4,
    ),
    labelSmall: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      fontSize: 10.sp,
      letterSpacing: 0.2,
    ),
  );
  // Card Theme
  static CardTheme lightCardTheme = CardTheme(
    color: AppColors.bg,
    elevation: 10.h,
    margin: EdgeInsets.all(8.sp),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.defaultRadius.sp),
    ),
  );
  static CardTheme darkCardTheme = CardTheme(
    color: AppColors.bgDark,
    elevation: 10.h,
    margin: EdgeInsets.all(8.sp),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.sp),
    ),
  );

  // Input Decoration Theme
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.bg,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.defaultRadius.sp),
      borderSide: BorderSide(color: AppColors.text, width: 2.sp),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.defaultRadius.sp),
      borderSide: BorderSide(color: AppColors.primary, width: 2.sp),
    ),
    labelStyle: const TextStyle(color: AppColors.text),
    hintStyle: TextStyle(color: AppColors.text.withOpacity(0.6)),
  );
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.bgDark,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.defaultRadius.sp),
      borderSide: BorderSide(color: AppColors.textDark, width: 2.sp),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.defaultRadius.sp),
      borderSide: BorderSide(color: AppColors.primaryDark, width: 2.sp),
    ),
    labelStyle: const TextStyle(color: AppColors.textDark),
    hintStyle: TextStyle(color: AppColors.textDark.withOpacity(0.6)),
  );

  // Divider Theme
  static const DividerThemeData dividerTheme = DividerThemeData(
    color: AppColors.shadow,
    thickness: 1,
    space: 32,
  );

  // AppBar Theme
  static AppBarTheme appBarThemeLight = AppBarTheme(
    backgroundColor: AppColors.primary,
    titleTextStyle: TextStyle(
      color: AppColors.text,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(color: AppColors.text),
  );

  static AppBarTheme appBarThemeDark = AppBarTheme(
    backgroundColor: AppColors.primaryDark,
    titleTextStyle: TextStyle(
      color: AppColors.textDark,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(color: AppColors.textDark),
  );

  // Button Themes
  static final TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primary,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );

  static final ElevatedButtonThemeData elevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: AppColors.onSecondary,
      backgroundColor: AppColors.primary,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.defaultBtnRadius.sp)),
    ),
  );

  // Chip Theme
  static final ChipThemeData chipThemeLight = ChipThemeData(
    backgroundColor: AppColors.bg,
    labelStyle: const TextStyle(color: AppColors.text),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.defaultBtnRadius.sp)),
  );

  static final ChipThemeData chipThemeDark = ChipThemeData(
    backgroundColor: AppColors.bgDark,
    labelStyle: const TextStyle(color: AppColors.textDark),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.defaultBtnRadius.sp)),
  );

  // Dialog Theme
  static DialogTheme dialogThemeLight = DialogTheme(
    backgroundColor: AppColors.bg,
    titleTextStyle: TextStyle(
        color: AppColors.text, fontSize: 18.sp, fontWeight: FontWeight.w600),
    contentTextStyle: TextStyle(color: AppColors.text, fontSize: 16.sp),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.defaultRadius.sp)),
  );

  static DialogTheme dialogThemeDark = DialogTheme(
    backgroundColor: AppColors.bgDark,
    titleTextStyle: TextStyle(
        color: AppColors.textDark,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600),
    contentTextStyle: TextStyle(color: AppColors.textDark, fontSize: 16.sp),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.defaultRadius.sp)),
  );

  // Icon Theme
  static IconThemeData iconThemeLight = IconThemeData(
    color: AppColors.text,
    size: 24.sp,
  );

  static IconThemeData iconThemeDark = IconThemeData(
    color: AppColors.textDark,
    size: 24.sp,
  );
}
