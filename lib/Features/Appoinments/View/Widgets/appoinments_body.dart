import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Appoinments/View/Widgets/custom_card.dart';
import 'package:dermabyte/Features/Appoinments/View/Widgets/header_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppoinmentsBody extends StatelessWidget {
  const AppoinmentsBody({super.key});

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
            const CustomAppBar(title: 'Appoinments'),
            const HeaderText(
                text: "Follow up with your ongoing and future appointments."),
            const SizedBox(height: 32),
            CustomCard(
              iconCard: Assets.kFollowUpIcon,
              cardTitle: "Follow Up!",
              cardSubTitle:
                  "Follow up with your last appointments, doctor has requested.",
              textButton: "View",
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.kFollowUp);
              },
            ),
            const SizedBox(height: 24),
            CustomCard(
              iconCard: Assets.kWallBlock,
              cardTitle: "Upcoming appoinment!",
              cardSubTitle: "Doctor Mohamed has scheduled an appointment on..",
              textButton: "View",
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.kUpcoming);
              },
            )
          ],
        ),
      ),
    );
  }
}
