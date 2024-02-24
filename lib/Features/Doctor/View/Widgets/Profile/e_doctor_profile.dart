import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Doctor/View/Widgets/Profile/doctor_profile_header.dart';
import 'package:dermabyte/Features/Doctor/View/Widgets/Profile/doctor_profile_items_listview.dart';
import 'package:flutter/material.dart';

class EdoctorProfile extends StatelessWidget {
  EdoctorProfile({super.key});

  final Map<String, String> items = {
    "Address": AppRoutes.kAddress,
    "Account": AppRoutes.kAccount,
    "Certifications": AppRoutes.kCreditCard,
    "Help": AppRoutes.kHelp,
    "Setting": AppRoutes.kSettings,
    "Logout":""
  };
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height*0.06,
        horizontal: MediaQuery.of(context).size.width*0.05
      ),
      child: Column(
        children: [
          const DoctorProfileHeader(),
          const SizedBox(height: 32,),
         DoctorProfileItems()
        ],
      ),
    );
  }
}
