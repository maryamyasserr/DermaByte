import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/Profile/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemsListView extends StatelessWidget {
  ItemsListView({super.key});

  final Map<String,String> items = {
    "Address": AppRoutes.kAddress,
    "Account":AppRoutes.kAccount,
    "Credit Card":AppRoutes.kCreditCard,
    "History":AppRoutes.kHistory,
    // "Help":AppRoutes.kHelp,
    "Setting":AppRoutes.kSettings,
    "Log Out":""
  };
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ProfileItem(
                onTap: () {
                  GoRouter.of(context).push(items.values.elementAt(index));
                },
                item: items.keys.elementAt(index));
          }),
    );
  }
}
