import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TestLabPhoto extends StatelessWidget {
  const TestLabPhoto({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
          color: AppColors.kPrimaryColor, shape: BoxShape.circle),
      child: CircleAvatar(
        backgroundColor: const Color(0xffB9EEE8),
        radius: 50,
        child: SvgPicture.asset(Assets.kProfileAvatar,fit: BoxFit.cover,),
      ),
    );
  }
}