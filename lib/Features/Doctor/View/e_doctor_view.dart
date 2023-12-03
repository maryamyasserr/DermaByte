import 'package:dermabyte/Features/Doctor/View/Widgets/e_doctor_body.dart';
import 'package:flutter/material.dart';

class DoctorView extends StatelessWidget {
  const DoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: EdoctorBody(),
      
    );
  }
}