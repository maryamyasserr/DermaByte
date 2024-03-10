import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/doctor_profile_item.dart';
import 'package:dermabyte/Features/Profile/Data/Models/profile_item_model.dart';

import 'package:flutter/material.dart';

class DoctorProfileItems extends StatelessWidget {
  DoctorProfileItems({super.key});

  final List<ProfileItemModel> items = [
    ProfileItemModel(title: 'Address', route: AppRoutes.kAddress),
    ProfileItemModel(title: 'Account', route: AppRoutes.kAccount),
    ProfileItemModel(title: 'Address', route: AppRoutes.kAddress),
    ProfileItemModel(title: 'Credit Card', route: AppRoutes.kCreditCard),
    ProfileItemModel(title: 'History', route: AppRoutes.kHistory),
    ProfileItemModel(title: 'Setting', route: AppRoutes.kSettings),
    ProfileItemModel(title: 'Log Out', route: "")
    // "Help":AppRoutes.kHelp,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((e) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: DoctorProfileItem(
            profileItemModel: e,
          ),
        );
      }).toList(),
    );
  }
}
