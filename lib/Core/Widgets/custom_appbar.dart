import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 9, right: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Styels.textStyle24_600,
          ),
           Row(
            children: [
             SvgPicture.asset(Assets.kBellIcon),
              const SizedBox(width: 25),
              SvgPicture.asset(Assets.kProfileIcon)
            ],
          )
        ],
      ),
    );
  }
}
