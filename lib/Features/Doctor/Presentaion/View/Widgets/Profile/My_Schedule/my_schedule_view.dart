import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My_Schedule/my_schedule_body.dart';
import 'package:flutter/material.dart';

class MySchedule extends StatelessWidget {
  const MySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: MyScheduleBody()));
  }
}