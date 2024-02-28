import 'package:dermabyte/Features/Lab/View/Widget/e_lab_profile/e_lab_listview_items.dart';
import 'package:dermabyte/Features/Lab/View/Widget/e_lab_profile/profile_header_section.dart';
import 'package:flutter/material.dart';

class ElabProfile extends StatelessWidget {
  const ElabProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.15,
          right: MediaQuery.of(context).size.width * 0.04,
          left: MediaQuery.of(context).size.width * 0.04),
      child: Column(
        children: [
          const ElabProfileHeaderSection(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          const ElabItemsListView(),
          const Divider(
            thickness: 0.7,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
