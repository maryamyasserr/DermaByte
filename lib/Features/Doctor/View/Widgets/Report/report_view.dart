import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/View/Widgets/Report/disease_report.dart';
import 'package:dermabyte/Features/Doctor/View/Widgets/Report/personal_info_section.dart';
import 'package:dermabyte/Features/Doctor/View/Widgets/button.dart';
import 'package:flutter/material.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Flexible(child: SizedBox(height: 60,)),
                Text(
                  "Mohamed's report",
                  style: Styels.textStyle24_600(context).copyWith(fontSize: 28),
                ),
                const SizedBox(height: 8),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(height: 16),
                const PersonalInfoSection(),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(height: 16),
                const DiseaseReport(),
                const SizedBox(height: 60),
                Align(
                  alignment: Alignment.center,
                  child: MyButton(
                    horizontal: MediaQuery.of(context).size.width*0.34, textButton: "Confirm", onPressed: (){}),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
