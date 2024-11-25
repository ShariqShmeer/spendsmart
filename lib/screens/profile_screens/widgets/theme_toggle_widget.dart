import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendsmart/bloc/theme_bloc/theme_bloc.dart';

class ThemeToggle extends StatefulWidget {
  const ThemeToggle({super.key});

  @override
  State<ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  double moonScale = 1.0;
  double sunScale = 1.0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = 85.sp;

    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        AnimatedPositioned(
          top: 0,
          bottom: 0,
          left: !isDark ? 0 : width / 2,
          curve: Curves.elasticInOut,
          duration: const Duration(milliseconds: 1500),
          child: CircleAvatar(
            radius: 20.sp,
            backgroundColor: Theme.of(context).cardColor,
          ),
        ),
        Container(
          width: width,
          height: 40.sp,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).disabledColor),
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _toggleButton(
                  onHover: (hover) =>
                      setState(() => sunScale = hover ? 1.5 : 1.0),
                  onTap: () => context.read<ThemeBloc>().add(
                        const ChangeTheme(
                          themeMode: ThemeMode.light,
                        ),
                      ),
                  child: Icon(
                    Icons.light_mode,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  tween: Tween<double>(begin: 0.3, end: 0)),
              _toggleButton(
                  onHover: (hover) =>
                      setState(() => moonScale = hover ? 1.5 : 1.0),
                  onTap: () => context.read<ThemeBloc>().add(
                        const ChangeTheme(
                          themeMode: ThemeMode.dark,
                        ),
                      ),
                  child: Icon(
                    Icons.dark_mode,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  tween: Tween<double>(begin: -0.8, end: -0.1)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _toggleButton(
      {required void Function(bool)? onHover,
      required void Function()? onTap,
      required Tween<double> tween,
      required Widget child}) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20.sp),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.sp),
        splashColor: Theme.of(context).scaffoldBackgroundColor,
        focusColor: Theme.of(context).scaffoldBackgroundColor,
        highlightColor: Theme.of(context).scaffoldBackgroundColor,
        onHover: onHover,
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 20.sp,
          child: Center(
            child: AnimatedScale(
              duration: const Duration(milliseconds: 200),
              scale: sunScale,
              child: TweenAnimationBuilder(
                key: ObjectKey(sunScale),
                duration: const Duration(milliseconds: 1500),
                curve: Curves.elasticOut,
                tween: tween,
                builder: (context, value, child) {
                  return Transform.rotate(angle: pi * value, child: child);
                },
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
