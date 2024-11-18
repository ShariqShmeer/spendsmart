import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendsmart/res/app_theme.dart';
import 'package:spendsmart/routing/routing.dart';
import 'package:spendsmart/screens/launch_screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  void changeTheme(ThemeMode themeMode) {
    if (Theme.of(context).brightness == Brightness.light) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // or any color for light theme
          systemNavigationBarIconBrightness: Brightness.dark,

          /// or any color for light theme
          statusBarIconBrightness:
              Brightness.dark, // For dark icons in light theme
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // or any color for dark theme
          statusBarIconBrightness: Brightness.light, // For
          systemNavigationBarIconBrightness:
              Brightness.light, // For light icons in dark theme
        ),
      );
    }
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ScreenUtilInit(
        designSize: Size(constraints.maxWidth, constraints.maxWidth),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: goRouter,
            title: 'Spend Smart',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            themeAnimationDuration: const Duration(seconds: 1),
            themeAnimationCurve: Curves.easeIn,
          );
        },
        child: const SplashScreen(),
      );
    });
  }
}
