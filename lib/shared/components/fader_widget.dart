import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FaderWidget extends HookWidget {
  final Widget child;
  const FaderWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final controller1 = useAnimationController(
      duration: const Duration(milliseconds: 1000),
    );
    return SlideTransition(
      position:
          Tween<Offset>(begin: const Offset(0, .4), end: const Offset(0, 0))
              .animate(controller1..forward()),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(controller1),
        child: child,
      ),
    );
  }
}
