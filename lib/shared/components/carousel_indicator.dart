import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {
  final int length;
  final int currentIndex;
  final Widget activeWidget;
  final Widget? inactiveWidget;
  final double spacing;

  const CarouselIndicator({
    Key? key,
    required this.length,
    required this.currentIndex,
    required this.activeWidget,
    this.inactiveWidget,
    required this.spacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        length,
        (index) => Padding(
          padding: EdgeInsets.only(right: index != length - 1 ? spacing : 0),
          child: currentIndex == index
              ? activeWidget
              : (inactiveWidget ?? activeWidget),
        ),
      ),
    );
  }
}
