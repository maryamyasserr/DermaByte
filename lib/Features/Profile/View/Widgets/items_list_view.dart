import 'package:dermabyte/Features/Profile/View/Widgets/profile_item.dart';
import 'package:flutter/material.dart';

class ItemsListView extends StatelessWidget {
   ItemsListView({super.key});

    final List<String> items = [
    'Address',
    'Account',
    'Credit Card',
    'History',
    'Settings',
    'Logout'
  ];
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
            height: MediaQuery.of(context).size.height*0.3,
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ProfileItem(item: items[index]);
                }),
          );
  }
}