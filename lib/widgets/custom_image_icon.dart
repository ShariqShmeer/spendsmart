import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageIcon extends StatelessWidget {
  final String imgPath;
  final double? size;

  const CustomImageIcon({super.key, required this.imgPath, this.size});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imgPath,
      color: Theme.of(context).colorScheme.onSurface,
      height: size ?? 24.sp,
      width: size ?? 24.sp,
    );
  }
}
