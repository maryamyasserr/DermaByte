import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Appoinments/custom_dot_indicator.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({super.key, required this.currentPageIndex});
  final int currentPageIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          7,
          (index) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CustomDotIndicator(isActive: index == currentPageIndex),
              )),
    );
  }
}
