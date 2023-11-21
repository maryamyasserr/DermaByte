// ignore_for_file: file_names
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 9, right: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: Styels.textStyle24_600,
          ),
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                  
                  },
                  child: SvgPicture.asset(Assets.kBellIcon)),
              const SizedBox(width: 25),
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.kProfile);
                    isPressed = true;
                    setState(() {});
                  },
                  child: isPressed
                      ? SvgPicture.asset(Assets.kProfileIcon)
                      : const Icon(Icons.person,
                          color: OurColors.kPrimaryColor, size: 40))
            ],
          )
        ],
      ),
    );
  }
}
