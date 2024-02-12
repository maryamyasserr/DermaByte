import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 5,
          width: 5,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.kPrimaryColor),
        ),
        const SizedBox(width: 10),
        Text(
          data,
          maxLines: 2,
          style: Styels.textStyle20_300(context),
        )
      ],
    );
  }
}
