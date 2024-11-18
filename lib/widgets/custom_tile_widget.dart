import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTileWidget extends StatelessWidget {
  const CustomTileWidget(
      {super.key,
      required this.leading,
      required this.title,
      this.subTitle,
      this.onTap});
  final Widget leading;
  final String title;
  final String? subTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    double tileHeight = 30.0;
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.colorScheme.shadow, width: 2.sp),
        ),
      ),
      child: SizedBox(
        height: tileHeight.h,
        child: Material(
          color: Colors
              .transparent, // To ensure the Material doesn't override the Container's style
          child: InkWell(
            overlayColor: WidgetStatePropertyAll(
                theme.colorScheme.primary.withOpacity(0.1)),
            onTap: onTap,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Center(child: leading),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleMedium,
                      ),
                      if (subTitle != null)
                        Text(
                          subTitle ?? '',
                          style: theme.textTheme.bodyMedium,
                        ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(child: Icon(Icons.adaptive.arrow_forward)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
