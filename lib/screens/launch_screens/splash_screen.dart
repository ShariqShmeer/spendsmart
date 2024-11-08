import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendsmart/res/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Images.appLogo,
              width: 109.w,
              height: 115.h,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            Text(
              'Spend Smart',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
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
