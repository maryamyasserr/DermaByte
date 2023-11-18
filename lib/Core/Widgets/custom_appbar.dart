import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 9, right: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Styels.textStyle24_600,
          ),
          const Row(
            children: [
              Icon(
                FontAwesomeIcons.bell,
                color: Color(0xff0C0B35),
                size: 35,
              ),
              SizedBox(width: 25),
              Icon(
                FontAwesomeIcons.user,
                color: Color(0xff0C0B35),
                size: 35,
              ),
            ],
          )
        ],
      ),
    );
  }
}
