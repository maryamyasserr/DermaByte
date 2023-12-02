import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/E-Doctor/View/Widgets/Profile/doctor_profile_header.dart';
import 'package:dermabyte/Features/E-Doctor/View/Widgets/Profile/doctor_profile_item.dart';
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return DoctorProfileItem(
                      onTap: () {}, item: items.keys.elementAt(index));
                }),
          )
        ],
      ),
    );
  }
}
