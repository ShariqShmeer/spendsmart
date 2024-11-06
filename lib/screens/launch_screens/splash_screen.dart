import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendsmart/res/app_colors.dart';
import 'package:spendsmart/res/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Images.appLogo,
              width: 109.w,
              height: 115.h,
              color: AppColors.white,
            ),
            Text(
              'Spend Smart',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
