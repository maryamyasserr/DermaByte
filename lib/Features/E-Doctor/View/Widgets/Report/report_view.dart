import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-Doctor/View/Widgets/Report/disease_report.dart';
import 'package:dermabyte/Features/E-Doctor/View/Widgets/Report/personal_info_section.dart';
import 'package:dermabyte/Features/E-Doctor/View/Widgets/button.dart';
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
                vertical: MediaQuery.of(context).size.height * 0.05,
                horizontal: MediaQuery.of(context).size.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mohamed's report",
                  style: Styels.textStyle24_600.copyWith(fontSize: 28),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                const Divider(
                  color: Colors.black,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const PersonalInfoSection(),
                const Divider(
                  color: Colors.black,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const DiseaseReport(),
                SizedBox(height: MediaQuery.of(context).size.height*0.1),
                Align(
                  alignment: Alignment.center,
                  child: MyButton(
                    horizontal: MediaQuery.of(context).size.width*0.3, textButton: "Confirm", onPressed: (){}),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
