import 'package:dermabyte/Features/Appoinments/View/Widgets/upcoming_body.dart';
import 'package:flutter/material.dart';

class UpComingView extends StatelessWidget {
  const UpComingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: UpComingBody()
      ),
    );
  }
}