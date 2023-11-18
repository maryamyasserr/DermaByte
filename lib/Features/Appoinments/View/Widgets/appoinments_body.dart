import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Features/Appoinments/View/Widgets/custom_card.dart';
import 'package:dermabyte/Features/Appoinments/View/Widgets/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppoinmentsBody extends StatelessWidget {
  const AppoinmentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.kBackground),
          fit: BoxFit.cover
        )),
      child: Column(
        children: [
         const CustomAppBar(title: 'Appoinments'),
         const HeaderText(text: "Follow up with your ongoing and future appointments."),
          SizedBox(height: MediaQuery.of(context).size.height*0.04),
          const CustomCard(
            iconCard: 'assets/images/followUp.svg',
            cardTitle: "Follow Up!",
            cardSubTitle: "Follow up with your last appointments, doctor has requested....",
            textButton: "View",
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          const CustomCard(
            iconCard: 'assets/images/wallClock.svg',
            cardTitle: "Upcoming appoinment!",
            cardSubTitle: "Doctor Mohamed has scheduled an appointment on ....",
            textButton: "View",
          )
      
        ],
      ),
    );
  }
}