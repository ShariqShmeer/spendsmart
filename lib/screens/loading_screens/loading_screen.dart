import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spendsmart/widgets/lottie_loading_done_failed_widget.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LottieLoadingDoneFailedWidget(
        isSuccess: true,
        afterCompleteAnimation: () {
          Future.delayed(const Duration(milliseconds: 800), () {
            GoRouter.of(context).pop();
          });
        },
      ),
    );
  }
}
