import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Schedule/schedule_body.dart';
import 'package:flutter/material.dart';


class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ScheduleBody(),
      ),
    );
  }
}
