import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key, required this.radius});
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
    
      decoration: const BoxDecoration(
          color: AppColors.kPrimaryColor, shape: BoxShape.circle),
      child: CircleAvatar(
        backgroundColor: const Color(0xffB9EEE8),
        radius: radius,
        child: SvgPicture.asset(Assets.kProfileAvatar),
      ),
    );
  }
}
