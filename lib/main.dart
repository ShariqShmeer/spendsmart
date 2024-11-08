import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendsmart/res/app_theme.dart';
import 'package:spendsmart/screens/launch_screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ScreenUtilInit(
        designSize: Size(constraints.maxWidth, constraints.maxWidth),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Spend Smart',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            themeAnimationDuration: const Duration(seconds: 1),
            themeAnimationCurve: Curves.easeIn,
            home: child,
          );
        },
        child: const SplashScreen(),
      );
    });
  }
}
