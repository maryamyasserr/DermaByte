import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Profile/Data/Models/profile_item_model.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Profile/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemsListView extends StatelessWidget {
  const ItemsListView({super.key});

 
  @override
  Widget build(BuildContext context) {
     final List<ProfileItemModel> items = [
    ProfileItemModel(title: 'Account', onTap: (){}),
    ProfileItemModel(title: 'My Schedule',
     onTap:() {
              GoRouter.of(context).push(AppRoutes.kMySchedule);
            }
       ),
    ProfileItemModel(title: 'My Free Times', onTap: () {
              GoRouter.of(context).push(AppRoutes.kMyFreeTimes);
            }),
    ProfileItemModel(title: 'Setting', onTap: (){}),
    ProfileItemModel(title: 'Log Out', onTap: (){})
  ];
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
