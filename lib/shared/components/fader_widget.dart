import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FaderWidget extends HookWidget {
  final Widget child;
  final int milliSecWait;
  const FaderWidget({
    super.key,
    required this.child,
    this.milliSecWait = 0,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    Future.delayed(
      Duration(milliseconds: milliSecWait),
      () => controller.forward(),
    );
    return SlideTransition(
      position:
          Tween<Offset>(begin: const Offset(0, .2), end: const Offset(0, 0))
              .animate(controller),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(controller),
        child: child,
      ),
    );
  }
}
