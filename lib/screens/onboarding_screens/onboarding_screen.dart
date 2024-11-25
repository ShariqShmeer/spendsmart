import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spendsmart/res/app_screens.dart';
import 'package:spendsmart/res/images.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  Duration animationDuration = const Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      topWidget: Center(
        child: AnimatedSwitcher(
          duration: animationDuration,
          child: Hero(
            tag: 'splashToOnboard',
            child: Text(
              key: ValueKey(currentPage),
              currentPage == 0
                  ? 'Welcome to Spend Smart'
                  : 'Are you ready to take control of your finance?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ),
      ),
      roundedBodyWidget: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (pageNumber) {
                currentPage = pageNumber;
                setState(() {});
              },
              children: [
                _page(imageSrc: Images.onboarding1),
                _page(imageSrc: Images.onboarding2),
              ],
            ),
          ),
          AnimatedSwitcher(
            duration: animationDuration,
            child: Row(
              key: ValueKey(currentPage),
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                2,
                (index) => currentPage == index
                    ? Icon(
                        Icons.circle,
                        size: 10.sp,
                      )
                    : Icon(
                        Icons.circle_outlined,
                        size: 10.sp,
                      ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
            child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).pushReplacementNamed(Screens.auth);
                    },
                    child: const Text('Get Started'))),
          )
        ],
      ),
    );
  }

  Widget _page({required String imageSrc}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 140.h,
          backgroundColor:
              Theme.of(context).colorScheme.onSecondary.withOpacity(0.6),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: 40.h,
          ),
          child: Image.asset(
            height: 340.h,
            width: 340.h,
            imageSrc,
          ),
        ),
      ],
    );
  }
}
