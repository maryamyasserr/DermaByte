import 'package:dermabyte/Features/E-Doctor/View/Widgets/e_doctor_body.dart';
import 'package:flutter/material.dart';

class EdoctorView extends StatelessWidget {
  const EdoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: EdoctorBody(),
      
    );
  }
}