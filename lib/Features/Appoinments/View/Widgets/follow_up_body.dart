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
              image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: Column(
          children: [
            const CustomAppBar(title: "Follow Up!"),
            const HeaderText(
                text: "Follow up with your ongoing and future appointments."),
            const SizedBox(height: 32),
            CustomCard(
              iconCard: Assets.kFollowUpIcon,
              cardTitle: "Dr. Mai",
              cardSubTitle: "Dr. Mai has reviewed your scans and",
              onPressed: () {},
              textButton: "View",
            ),
            const SizedBox(height: 24),
            CustomCard(
              iconCard: Assets.kWallBlock,
              cardTitle: "Dr. Helal",
              cardSubTitle:
                  "Dr. Mai reviewed your scans and it seems like she’ll need more tests",
              onPressed: () {},
              textButton: "View",
            ),
          ],
        ),
      ),
    );
  }
}
