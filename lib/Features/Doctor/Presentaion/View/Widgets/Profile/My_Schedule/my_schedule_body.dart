import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My_Schedule/schedule_day.dart';
import 'package:flutter/material.dart';

class MyScheduleBody extends StatelessWidget {
  const MyScheduleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 30),
            Center(
                child: Text("My Schedule", style: Styels.textStyle40(context))),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(r"Session Cost : 100 $",
                    style: Styels.textStyle20_700(context)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit,
                        color: AppColors.kPrimaryColor, size: 24))
              ],
            ),
            const Divider(
              color: AppColors.kPrimaryColor,
              height: 20,
            ),
            ScheduleDay(
              day: 'Friday',
              deleteDay: (){},
              startTime: '10 Am',
              endTime: '4 pm',
              updateStartTime: (){},
              updateEndTime: (){},

            )
          ],
        ),
      ),
    );
  }
}


