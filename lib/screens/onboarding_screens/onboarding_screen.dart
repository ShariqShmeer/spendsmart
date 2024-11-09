import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendsmart/res/images.dart';
import 'package:spendsmart/screens/auth_screens/login_screen.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  Duration animationDuration = const Duration(milliseconds: 300);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      topWidget: Center(
        child: AnimatedSwitcher(
          duration: animationDuration,
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
      roundedBodyWidget: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (pageNumber) {
                print('Your was on page $currentPage');
                print('Your ore on page $pageNumber');
                currentPage = pageNumber;
                print(' value of currentPage $currentPage');
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
                        size: 15.sp,
                      )
                    : Icon(
                        Icons.circle_outlined,
                        size: 15.sp,
                      ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
            child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
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
          radius: 60.h,
          backgroundColor:
              Theme.of(context).colorScheme.onSecondary.withOpacity(0.6),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: 20.h,
          ),
          child: Image.asset(
            height: 140.h,
            width: 140.h,
            imageSrc,
          ),
        ),
      ],
    );
  }
}
