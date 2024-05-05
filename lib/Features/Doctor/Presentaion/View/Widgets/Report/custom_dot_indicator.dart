import 'package:dermabyte/Core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomDotIndicatorDoctor extends StatelessWidget {
  const CustomDotIndicatorDoctor({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isActive ? 24 : 10,
      height: 10,
      decoration: ShapeDecoration(
        color: isActive ? AppColors.kPrimaryColor : Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
