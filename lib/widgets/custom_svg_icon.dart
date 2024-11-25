import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgIcon extends StatelessWidget {
  final String imgPath;
  final double? size;

  const CustomSvgIcon({super.key, required this.imgPath, this.size});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      width: size ?? 25.sp,
      height: size ?? 25.sp,
      imgPath,
      colorFilter: ColorFilter.mode(
        Theme.of(context).colorScheme.onSurface,
        BlendMode.srcIn,
      ),
    );
  }
}
