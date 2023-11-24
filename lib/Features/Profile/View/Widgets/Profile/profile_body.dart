import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
<<<<<<< HEAD:lib/Features/Profile/View/Widgets/Profile_Section/profile_body.dart
import 'package:dermabyte/Features/Profile/View/Widgets/Profile_Section/items_list_view.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/Profile_Section/profile_header_section.dart';

import 'package:dermabyte/Features/Profile/View/Widgets/custom_card.dart';
=======
import 'package:dermabyte/Features/Profile/View/Widgets/custom_card.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/Profile/items_list_view.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/Profile/profile_header_section.dart';
>>>>>>> dev:lib/Features/Profile/View/Widgets/Profile/profile_body.dart
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const CustomAppBar(title: ""),
            const ProfileHeaderSection(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            ItemsListView(),
            const SizedBox(height: 7),
            const Divider(
              thickness: 0.7,
              color: Colors.black,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Doctors you have consulted",
                  style: Styels.textStyle18_600,
                )),
           
           SizedBox(height: MediaQuery.of(context).size.height*0.04),
             FeatureCard(
              iconCard: Assets.kDoctorAvatar,
              cardTitle: "Dr. Luka Modrich",
              cardSubTitle:
                  "An eye doctor to spread magic, creativity and happiness to us",
              textButton: "View",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
