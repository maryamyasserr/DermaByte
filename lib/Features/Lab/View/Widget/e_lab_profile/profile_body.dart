import 'package:dermabyte/Features/Lab/View/Widget/e_lab_profile/e_lab_listview_items.dart';
import 'package:dermabyte/Features/Lab/View/Widget/e_lab_profile/profile_header_section.dart';
import 'package:flutter/material.dart';

class ElabProfile extends StatelessWidget {
  const ElabProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height*0.1,
        horizontal: MediaQuery.of(context).size.width*0.04
      ),
      child: Column(
        children: [
          const ElabProfileHeaderSection(),
          SizedBox(height: MediaQuery.of(context).size.height*0.04),
          ElabItemsListView(),
          // SizedBox(height: MediaQuery.of(context).size.height*0.01),
          const Divider(thickness: 0.7,color: Colors.black,)
        ],
      ),
    );
  }
}