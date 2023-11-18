import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:flutter/material.dart';

class AppoinmentsBody extends StatelessWidget {
  const AppoinmentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(title: 'Appoinments',)
      ],
    );
  }
}