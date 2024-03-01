import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class UpComingBody extends StatelessWidget {
  const UpComingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CustomAppBar(title: "Upcoming"),
          const SizedBox(height: 64),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "The doctor has scheduled an online appointment for you on Tuesday 10/24/2023, at 2:30 PM.",
                    style: Styels.textStyle18_400(context)),
                const SizedBox(height: 64),
                Text(
                    "please click on the call button right 5 minutes before the appointment.",
                    style: Styels.textStyle14_300(context)),
              ],
            ),
          ),
          const SizedBox(height: 74),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.35,
                      vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: AppColors.kPrimaryColor),
              child: Text(
                "Start Call",
                style: Styels.textStyle20_700(context)
                    .copyWith(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
