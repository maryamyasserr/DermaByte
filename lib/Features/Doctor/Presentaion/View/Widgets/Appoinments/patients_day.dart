import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/patient_card.dart';
import 'package:flutter/material.dart';

class PatientsDay extends StatelessWidget {
  const PatientsDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text("Monday",
            style: Styels.textStyle24_600(context)
                .copyWith(decoration: TextDecoration.underline)),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
      Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.01,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  child: PatientCard(
                    cardTitle: "Ahmed Mohamed",
                    cardSubTitle:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                    iconCard: Assets.kAvatar,
                    start: () {},
                    diagnose: () {},
                    onTap: () {},
                  ),
                );
              }))
    ]);
  }
}
