import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-Doctor/View/Widgets/Home/patient_card.dart';
import 'package:flutter/material.dart';

class EdoctorHome extends StatelessWidget {
  const EdoctorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.08,
        horizontal: MediaQuery.of(context).size.width * 0.03
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today's Schedule",
            style: Styels.textStyle24_600,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                      child: PatientCard(
                          iconCard: Assets.kDoctorAvatar,
                          cardTitle: "Jude Bellengham",
                          cardSubTitle:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                          onPressed: () {}),
                    );
                  }))
        ],
      ),
    );
  }
}
