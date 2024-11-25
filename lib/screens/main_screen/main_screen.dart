import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spendsmart/bloc/key_board_track_bloc/key_board_track_bloc.dart';
import 'package:spendsmart/res/app_size.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.navigationShell})
      : super(key: key ?? const ValueKey<String>('MainScreen'));
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    context.read<KeyBoardTrackBloc>().updateKeyboardVisibility(context);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          navigationShell,
          if (!(MediaQuery.viewInsetsOf(context).bottom > 0))
            Positioned(
              bottom: 25.sp,
              child: AppBottomNav(
                currentIndex: navigationShell.currentIndex,
                onDestinationSelected: (int index) {
                  navigationShell.goBranch(
                    index,
                    initialLocation: index == navigationShell.currentIndex,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class AppBottomNav extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  const AppBottomNav(
      {super.key,
      required this.currentIndex,
      required this.onDestinationSelected});

  @override
  State<AppBottomNav> createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
  List<IconData> icons = [
    Icons.home,
    Icons.analytics,
    Icons.list_alt,
    Icons.category,
    Icons.person,
  ];

  Tween<double> tween = Tween<double>(begin: 1.0, end: 1.2);
  bool animationCompleted = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      clipBehavior: Clip.none,
      constraints: const BoxConstraints(
        maxWidth: 374,
      ),
      padding: EdgeInsets.all(AppSize.defaultPadding.sp),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(
            (AppSize.defaultBtnRadius + AppSize.defaultPadding).r),
      ),
      child: TweenAnimationBuilder(
          key: ValueKey(widget.currentIndex),
          tween: tween,
          duration: Duration(milliseconds: animationCompleted ? 2000 : 200),
          curve: animationCompleted ? Curves.elasticOut : Curves.easeOut,
          // Using bounce out curve
          onEnd: () {
            setState(() {
              animationCompleted = true;
              tween = Tween(begin: 1.2, end: 1.0);
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
                    ..scale(i == widget.currentIndex ? value + 0.2 : 1.0)
                    ..translate(0.0,
                        i == widget.currentIndex ? 50.0 * (1.1 - value) : 0.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        animationCompleted = false;
                        tween = Tween(begin: 1.0, end: 1.2);
                        // activeIndex = i;
                        // widget.onDestinationSelected(i);
                        widget.onDestinationSelected(i);
                      });
                      // animate();
                    },
                    child: Container(
                      padding: EdgeInsets.all(AppSize.defaultPadding.sp),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius:
                            BorderRadius.circular(AppSize.defaultBtnRadius.r),
                      ),
                      child: Icon(
                        icons[i],
                        color: i == widget.currentIndex
                            ? theme.colorScheme.surface
                            : theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                );
              }),
            );
          }),
    );
  }
}
