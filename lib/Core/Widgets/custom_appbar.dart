// ignore_for_file: file_names
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  // padding: const EdgeInsets.only(top: 50, left: 9, right: 10),
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      width: double.infinity,
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: const Icon(Icons.arrow_back)),
          Text(
            title,
            style: Styels.textStyle24_600(context),
          ),
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.kHistory);
                  },
                  child: const Icon(
                    FontAwesomeIcons.solidFileLines,
                    size: 30,
                    color: AppColors.kPrimaryColor,
                  )),
              const SizedBox(width: 25),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.kProfile);
                },
                child: const Icon(
                  FontAwesomeIcons.solidUser,
                  size: 30,
                  color: AppColors.kPrimaryColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
