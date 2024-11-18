import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spendsmart/res/app_size.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.navigationShell})
      : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // int activeIndex = 0;
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  List<IconData> icons = [
    Icons.home,
    Icons.analytics,
    Icons.list_alt,
    Icons.category,
    Icons.person,
  ];

  Tween<double> tween = Tween<double>(begin: 1.0, end: 1.5);
  bool animationCompleted = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          widget.navigationShell,
          Positioned(
            bottom: 20.sp,
            child: Container(
              clipBehavior: Clip.none,
              constraints: const BoxConstraints(
                maxWidth: 374,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.sp),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(AppSize.defaultRadius.r),
              ),
              child: TweenAnimationBuilder(
                  key: ValueKey(widget.navigationShell.currentIndex),
                  tween: tween,
                  duration:
                      Duration(milliseconds: animationCompleted ? 2000 : 200),
                  curve: animationCompleted
                      ? Curves.elasticOut
                      : Curves.easeOut, // Using bounce out curve
                  onEnd: () {
                    setState(() {
                      animationCompleted = true;
                      tween = Tween(begin: 1.5, end: 1.0);
                    });
                  },
                  builder: (context, value, child) {
                    // print(['value', value]);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(icons.length, (i) {
                        return Transform(
                          alignment: Alignment.bottomCenter,
                          transform: Matrix4.identity()
                            ..scale(i == widget.navigationShell.currentIndex
                                ? value + 0.1
                                : 1.0)
                            ..translate(
                                0.0,
                                i == widget.navigationShell.currentIndex
                                    ? 80.0 * (1 - value)
                                    : 0.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                animationCompleted = false;
                                tween = Tween(begin: 1.0, end: 1.5);
                                // activeIndex = i;
                                // widget.onDestinationSelected(i);
                                _goBranch(i);
                              });
                              // animate();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(
                                    AppSize.defaultBtnRadius.r),
                              ),
                              child: Icon(
                                icons[i],
                                color: i == widget.navigationShell.currentIndex
                                    ? theme.colorScheme.surface
                                    : theme.colorScheme.secondary,
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
