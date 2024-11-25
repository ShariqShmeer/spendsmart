import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendsmart/res/app_icons.dart';
import 'package:spendsmart/widgets/custom_image_icon.dart';
import 'package:spendsmart/widgets/custom_svg_icon.dart';

class CustomIcon extends StatelessWidget {
  final CustomIcons customIcons;
  final double? size;
  const CustomIcon({super.key, required this.customIcons, this.size});

  @override
  Widget build(BuildContext context) {
    if (customIcons is DefaultIcons) {
      return Icon(
        (customIcons as DefaultIcons).iconData,
        size: size ?? 24.sp,
      );
    } else {
      ImageIcons imageIcons = (customIcons as ImageIcons);
      if (imageIcons.type == CustomIconsType.image) {
        return CustomImageIcon(
          imgPath: imageIcons.imagePath,
          size: size ?? 24.sp,
        );
      } else {
        return CustomSvgIcon(
          imgPath: imageIcons.imagePath,
          size: size ?? 24.sp,
        );
      }
    }
  }
}
