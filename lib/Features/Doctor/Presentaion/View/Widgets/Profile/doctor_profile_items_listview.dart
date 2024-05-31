import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/doctor_profile_item.dart';
import 'package:dermabyte/Features/Profile/Data/Models/profile_item_model.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorProfileItems extends StatelessWidget {
  DoctorProfileItems({super.key});

  final List<ProfileItemModel> items = [
    ProfileItemModel(title: 'Account', route: ""),
    ProfileItemModel(title: 'My Schedule', route: AppRoutes.kMySchedule),
    ProfileItemModel(title: 'My Free Times', route: AppRoutes.kMyFreeTimes),
    ProfileItemModel(title: 'Setting', route: ""),
    ProfileItemModel(title: 'Log Out', route: "")
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((e) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: DoctorProfileItem(
            profileItemModel: e,
            onTap: () {
              GoRouter.of(context).push(e.route);
            },
          ),
        );
      }).toList(),
    );
  }
}
