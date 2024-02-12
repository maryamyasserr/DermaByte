import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/View/Widgets/Report/personal_info.dart';
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
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        const PersonalInfo(data: "Mohamed Ahmed"),
        const PersonalInfo(data: "20 Years Old"),
        const PersonalInfo(data: "Noticed skin changes since august"),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      ],
    );
  }
}
