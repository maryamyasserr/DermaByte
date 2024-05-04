import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/doctor_item.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Profile/items_list_view.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Profile/profile_header_section.dart';
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
        child: ListView(
          children: [
            const CustomAppBar(title: ""),
            const ProfileHeaderSection(),
            const SizedBox(
              height: 32,
            ),
            const ItemsListView(),
            const SizedBox(height: 7),
            const Divider(
              thickness: 0.7,
              color: Colors.black,
            ),
            const SizedBox(height: 16),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Doctors you have consulted",
                  style: Styels.textStyle18_600(context),
                )),
            const SizedBox(
              height: 12,
            ),
            CarddItem(
              bottomText: '',
              imageCard: null,
              title: "Dr. Luka Modrich",
              subTitle:
                  "An eye doctor to spread magic, creativity and happiness to us",
              textButton: "View",
              onPressed: () {},
            ),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
