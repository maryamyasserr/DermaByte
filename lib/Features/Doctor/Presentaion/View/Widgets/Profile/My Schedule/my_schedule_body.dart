import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My%20Schedule/my_schedule_button.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My%20Schedule/schedule_indo.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My%20Schedule/swithcer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyScheduleBody extends StatelessWidget {
  const MyScheduleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 70),
            Swithcer(back: () {}, next: () {}),
            const SizedBox(height: 60),
            const MySechduleInfo(
              title: 'Total Workdays',
              subTitle: '7 days',
            ),
            const SizedBox(height: 24),
            const MySechduleInfo(
              title: 'Total Sessions today',
              subTitle: "14 session"),
            const Divider(
              height: 50,
              thickness: 0.7,
              color: AppColors.kPrimaryColor,
            ),
            Text('Free Times Today',style: Styels.textStyle20_700(context)),
            const SizedBox(height: 16),
            ScheduleButton(
              text: 'Update',
              onPressed: (){},
              isLoading: false,
            ),
            const SizedBox(height: 16),
              ScheduleButton(
              text: 'Delete',
              onPressed: (){},
              isLoading: false,
            )
          ],
        ),
      ),
    );
  }
}


