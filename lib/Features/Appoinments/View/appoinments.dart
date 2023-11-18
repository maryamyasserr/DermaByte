import 'package:dermabyte/Features/Appoinments/View/Widgets/appoinments_body.dart';
import 'package:flutter/material.dart';

class Appoinments extends StatelessWidget {
  const Appoinments({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: AppoinmentsBody(),
      ),
    );
  }
}