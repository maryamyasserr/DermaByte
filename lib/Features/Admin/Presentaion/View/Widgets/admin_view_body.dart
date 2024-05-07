import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/Drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class AdminViewBody extends StatelessWidget {
  const AdminViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 1,
          child: CustomDrawer()),
        Expanded(
          flex: 5,
          child: SizedBox()),

      ],
    );
  }
}