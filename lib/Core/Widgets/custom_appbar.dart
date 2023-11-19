import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.onTap});

  final String title;
  final void Function()? onTap;

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
              GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset(Assets.kBellIcon)),
              const SizedBox(width: 25),
              GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset(Assets.kProfileIcon))
            ],
          )
        ],
      ),
    );
  }
}
