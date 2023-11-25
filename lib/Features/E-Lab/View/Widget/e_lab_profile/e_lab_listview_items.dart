import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/E-Lab/View/Widget/e_lab_profile/e_lab_profile_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ElabItemsListView extends StatelessWidget {
  ElabItemsListView({super.key});

  final Map<String,String> items = {
    "Address": AppRoutes.kAddress,
    "Account":AppRoutes.kAccount,
    "History":AppRoutes.kHistory,
    "Help":AppRoutes.kHelp,
    "Setting":AppRoutes.kSettings
  };
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.36,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ElabProfileItem(
                onTap: () {
                  GoRouter.of(context).push(items.values.elementAt(index));
                },
                item: items.keys.elementAt(index));
          }),
    );
  }
}
