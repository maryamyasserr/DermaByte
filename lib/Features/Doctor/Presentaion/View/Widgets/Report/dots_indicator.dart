import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Consults/custom_dot_indicator.dart';
import 'package:flutter/material.dart';

class DotsIndicatorDoctor extends StatelessWidget {
  const DotsIndicatorDoctor(
      {super.key, required this.currentPageIndex, required this.count});
  final int currentPageIndex;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          count,
          (index) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CustomDotIndicator(isActive: index == currentPageIndex),
              )),
    );
  }
}
