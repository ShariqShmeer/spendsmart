import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTileWidget extends StatelessWidget {
  const CustomTileWidget(
      {super.key,
      this.leading,
      required this.title,
      this.subTitle,
      this.onTap,
      this.trailing});
  final Widget? leading;
  final Widget? trailing;
  final String title;
  final String? subTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    double tileHeight = 70.0;
    final theme = Theme.of(context);
    return Container(
      height: tileHeight.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.colorScheme.shadow, width: 2.sp),
        ),
      ),
      child: Material(
        color: Colors
            .transparent, // To ensure the Material doesn't override the Container's style
        child: InkWell(
          overlayColor: WidgetStatePropertyAll(
              theme.colorScheme.primary.withOpacity(0.1)),
          onTap: onTap,
          child: Row(
            children: [
              if (leading != null)
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
              if (trailing != null)
                Expanded(
                  flex: 2,
                  child: trailing ?? const SizedBox.shrink(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
