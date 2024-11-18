import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLoadingDoneFailedWidget extends StatefulWidget {
  final double size;
  final bool? isSuccess;
  final void Function()? afterCompleteAnimation;

  const LottieLoadingDoneFailedWidget(
      {super.key,
      this.isSuccess,
      this.size = 150,
      this.afterCompleteAnimation});

  @override
  State<LottieLoadingDoneFailedWidget> createState() =>
      _LottieLoadingDoneFailedWidgetState();
}

class _LottieLoadingDoneFailedWidgetState
    extends State<LottieLoadingDoneFailedWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      if (_controller.isCompleted) {
        widget.afterCompleteAnimation?.call();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.isSuccess == null
          ? Lottie.asset(
              'assets/lottie_animations/loading.json',
              width: widget.size,
              height: widget.size,
              controller: _controller,
              onLoaded: (composition) {
                // Configure the AnimationController with the duration of the
                // Lottie file and start the animation.
                _controller
                  ..duration = composition.duration
                  ..forward()
                  ..repeat();
              },
            )
          : widget.isSuccess == true
              ? Lottie.asset(
                  'assets/lottie_animations/success.json',
                  width: widget.size,
                  height: widget.size,
                  controller: _controller,
                  onLoaded: (composition) {
                    // Configure the AnimationController with the duration of the
                    // Lottie file and start the animation.
                    _controller
                      ..reset()
                      ..duration = composition.duration
                      ..forward();
                  },
                )
              : Lottie.asset(
                  'assets/lottie_animations/failure.json',
                  width: widget.size,
                  height: widget.size,
                  controller: _controller,
                  onLoaded: (composition) {
                    // Configure the AnimationController with the duration of the
                    // Lottie file and start the animation.
                    _controller
                      ..reset()
                      ..duration = composition.duration
                      ..forward();
                  },
                ),
    );
  }
}
