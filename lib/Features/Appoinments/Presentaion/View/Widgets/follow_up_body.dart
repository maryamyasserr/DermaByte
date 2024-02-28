import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Features/Appoinments/Presentaion/View/Widgets/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
           
          ],
        ),
      ),
    );
  }
}
