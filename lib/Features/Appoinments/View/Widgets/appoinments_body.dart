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
              image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
      child: Column(
        children: [
          const CustomAppBar(title: 'Appoinments'),
          const HeaderText(
              text: "Follow up with your ongoing and future appointments."),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          CustomCard(
            iconCard: 'assets/images/followUp.svg',
            cardTitle: "Follow Up!",
            cardSubTitle:
                "Follow up with your last appointments, doctor has requested....",
            textButton: "View",
            width: MediaQuery.of(context).size.width * 0.37,
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kFollowUp);
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          CustomCard(
            iconCard: 'assets/images/wallClock.svg',
            cardTitle: "Upcoming appoinment!",
            cardSubTitle: "Doctor Mohamed has scheduled an appointment on ....",
            textButton: "View",
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kUpcoming);
            },
            width: MediaQuery.of(context).size.width * 0.37,
          )
        ],
      ),
    );
  }
}
