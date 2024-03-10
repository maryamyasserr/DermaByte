import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/personal_info.dart';
import 'package:flutter/material.dart';

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Personal details",
          style: Styels.textStyle24_600(context),
        ),
        const SizedBox(height: 12),
        const PersonalInfo(data: "Mohamed Ahmed"),
        const PersonalInfo(data: "20 Years Old"),
        const PersonalInfo(data: "Noticed skin changes since august"),
        const SizedBox(height: 18),
      ],
    );
  }
}
