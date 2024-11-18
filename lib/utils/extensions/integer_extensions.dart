import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension IntigerExtensions on int {
  Widget get hSpace => SizedBox(
        height: h,
      );
  Widget get wSpace => SizedBox(
        width: w,
      );
}
