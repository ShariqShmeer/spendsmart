import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendsmart/utils/extensions/integer_extensions.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget(
      {super.key,
      this.imagePath,
      required this.name,
      required this.email,
      required this.number,
      this.onTap});

  final String? imagePath;
  final String name;
  final String email;
  final String number;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    String avatarName = name.split(' ').length > 1
        ? name.split(' ').first.substring(0, 1) +
            name.split(' ').last.substring(0, 1)
        : name.split(' ').first.substring(0, 1);
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 60.r,
                backgroundColor: theme.colorScheme.secondary,
                backgroundImage:
                    imagePath != null ? AssetImage(imagePath!) : null,
                child: imagePath != null
                    ? null
                    : Text(
                        avatarName,
                        style: theme.textTheme.headlineLarge,
                      ),
              ),
              Positioned(
                bottom: 10.sp,
                right: 5.sp,
                child: GestureDetector(
                  onTap: onTap,
                  child: CircleAvatar(
                    radius: 11.r,
                    child: Icon(
                      Icons.edit,
                      size: 15.r,
                    ),
                  ),
                ),
              ),
            ],
          ),
          10.wSpace,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                style: theme.textTheme.displayLarge,
              ),
              Text(
                email,
                style: theme.textTheme.bodyLarge,
              ),
              Text(
                number,
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
