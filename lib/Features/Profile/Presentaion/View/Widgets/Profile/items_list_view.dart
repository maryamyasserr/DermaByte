import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Profile/Data/Models/profile_item_model.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Profile/profile_item.dart';
import 'package:flutter/material.dart';

class ItemsListView extends StatelessWidget {
  const ItemsListView({super.key});

  static List<ProfileItemModel> items = [
    ProfileItemModel(title: 'Address', route: AppRoutes.kAddress),
    ProfileItemModel(title: 'Account', route: AppRoutes.kAccount),
    ProfileItemModel(title: 'Address', route: AppRoutes.kAddress),
    ProfileItemModel(title: 'Credit Card', route: AppRoutes.kCreditCard),
    ProfileItemModel(title: 'Setting', route: AppRoutes.kSettings),
    ProfileItemModel(title: 'Log Out', route: "")
    // "Help":AppRoutes.kHelp,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((e) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ProfileItem(
            profileItemModel: e,
          ),
        );
      }).toList(),
    );
  }
}
