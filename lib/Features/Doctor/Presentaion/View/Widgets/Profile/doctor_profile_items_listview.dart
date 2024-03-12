import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/doctor_profile_item.dart';
import 'package:dermabyte/Features/Profile/Data/Models/profile_item_model.dart';

import 'package:flutter/material.dart';

class DoctorProfileItems extends StatelessWidget {
  DoctorProfileItems({super.key});

  final List<ProfileItemModel> items = [
    ProfileItemModel(title: 'Address', route: ""),
    ProfileItemModel(title: 'Account', route: ""),
    ProfileItemModel(title: 'Address', route: ""),
    ProfileItemModel(title: 'Credit Card', route: ""),
    ProfileItemModel(title: 'History', route: ""),
    ProfileItemModel(title: 'Setting', route: ""),
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
