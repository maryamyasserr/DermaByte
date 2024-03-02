import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Lab/View/Widget/e_lab_profile/e_lab_profile_item.dart';
import 'package:dermabyte/Features/Profile/Data/Models/profile_item_model.dart';
import 'package:flutter/material.dart';

class ElabItemsListView extends StatelessWidget {
  const ElabItemsListView({super.key});

  static List<ProfileItemModel> items = [
    ProfileItemModel(title: 'Address', route: AppRoutes.kAddress),
    ProfileItemModel(title: 'Email', route: AppRoutes.kAccount),
    ProfileItemModel(title: 'Add More Service', route: AppRoutes.kAddress),
    ProfileItemModel(title: 'Help', route: AppRoutes.kHistory),
    ProfileItemModel(title: 'Setting', route: AppRoutes.kSettings),
    ProfileItemModel(title: 'Log Out', route: ""),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((e) => ElabProfileItem(profileItemModel: e)).toList(),
    );
  }
}
