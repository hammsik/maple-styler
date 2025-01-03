import 'package:flutter/material.dart';

class CustomScrollbarWrapper extends StatelessWidget {
  final CustomScrollView child;
  // final int itemCount;
  final ScrollController scrollController;

  const CustomScrollbarWrapper({
    required this.child,
    // required this.itemCount,
    required this.scrollController,
    super.key,
  });

  // double calculateThumbHeight() {
  //   const double maxThumbHeight = 100.0; // 최대 스크롤바 길이
  //   const double minThumbHeight = 30.0; // 최소 스크롤바 길이
  //   const double baseLength = 100.0; // 기본 길이
  //   const double factor = -0.04667; // 줄어드는 비율

  //   double thumbHeight = baseLength - factor * (itemCount - 500);
  //   return thumbHeight.clamp(minThumbHeight, maxThumbHeight);
  // }

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbColor: const Color.fromARGB(255, 137, 137, 137),
      interactive: true,
      controller: scrollController,
      thumbVisibility: true,
      minThumbLength: 40,
      mainAxisMargin: 12,
      thickness: 18,
      radius: const Radius.circular(20),
      child: child,
    );
  }
}
