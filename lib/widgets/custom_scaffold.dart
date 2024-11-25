import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScaffold extends StatelessWidget {
  final int roundedBodyPercentage;
  final Widget? topWidget;
  final Widget roundedBodyWidget;
  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;
  final bool addTopSafeArea;
  final bool extendBodyBehindAppBar;
  final Color? backgroundColor;

  const CustomScaffold(
      {super.key,
      this.roundedBodyPercentage = 70,
      required this.topWidget,
      required this.roundedBodyWidget,
      this.appBar,
      this.resizeToAvoidBottomInset,
      this.addTopSafeArea = false,
      this.extendBodyBehindAppBar = false,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: appBar,
      body: SafeArea(
        top: addTopSafeArea,
        right: false,
        left: false,
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (roundedBodyPercentage < 100 && topWidget != null)
              Expanded(
                  flex: 100 - roundedBodyPercentage,
                  child: SizedBox(child: topWidget)),
            Expanded(
              flex: roundedBodyPercentage,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.r))),
                child: roundedBodyWidget,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
