import 'package:dermabyte/Features/E-Doctor/View/Widgets/Profile/doctor_profile_header.dart';
import 'package:flutter/material.dart';

class EdoctorProfile extends StatelessWidget {
  const EdoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DoctorProfileHeader()
      ],
    );
  }
}