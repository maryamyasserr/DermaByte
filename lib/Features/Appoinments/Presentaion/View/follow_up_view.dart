import 'package:dermabyte/Features/Appoinments/Presentaion/View/Widgets/follow_up_body.dart';
import 'package:flutter/material.dart';

class FollowUpView extends StatelessWidget {
  const FollowUpView({super.key, });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: FollowUpBody(),
      ),
    );
  }
}
