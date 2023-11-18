import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Appoinments/View/Widgets/custom_card.dart';
import 'package:dermabyte/Features/Appoinments/View/Widgets/header_text.dart';
import 'package:flutter/material.dart';

class AppoinmentsBody extends StatelessWidget {
  const AppoinmentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(title: 'Appoinments'),
        HeaderText(text: "Follow up with your ongoing and future appointments."),
        CustomCard(
          iconCard: 'assets/images/followUp.svg',
          cardTitle: "Follow Up!",
          cardSubTitle: "Follow up with your last appointments, doctor has requested....",
          textButton: "View",
        )

      ],
    );
  }
}