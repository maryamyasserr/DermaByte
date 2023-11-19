import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.kBackground),
          fit: BoxFit.cover
        )
      ),
      child: Column(
        children: [
          const CustomAppBar(title: ""),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: OurColors.kPrimaryColor,
                  shape: BoxShape.circle
                ),
                child: CircleAvatar(
                  backgroundColor: const Color(0xffB9EEE8),
                  radius: 40,
                  child: SvgPicture.asset(Assets.kProfileAvatar),
                   ) ,
              ),
              
            ],
          )
        ],
      ),
    );
  }
}
