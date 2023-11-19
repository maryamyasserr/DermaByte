import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Features/Appoinments/View/Widgets/custom_card.dart';
import 'package:dermabyte/Features/Appoinments/View/Widgets/header_text.dart';
import 'package:flutter/material.dart';

class FollowUpBody extends StatelessWidget {
  const FollowUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.kBackground),
          fit: BoxFit.cover
        )
      ),
      child: Column(
        children: [
          const CustomAppBar(title: "Follow Up!"),
          const HeaderText(text: "Follow up with your ongoing and future appointments."),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          CustomCard(
            iconCard:Assets.kFollowUpIcon,
            cardTitle: "Dr. Mai has scheduled an appointment",
            cardSubTitle: "Dr. Mai has reviewed your scans and",
            onPressed: (){},
            textButton: "View",
            ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          CustomCard(
            iconCard:Assets.kFollowUpIcon,
            cardTitle: "Dr. Mai requested lab tests",
            cardSubTitle: "Dr. Mai reviewed your scans and it seems like she’ll need more tests to conduct her diagnosing process.",
            onPressed: (){},
            textButton: "View",
            ),
        ],
      ),
    );
  }
}