import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/tab_bar.dart';
import 'package:flutter/material.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const CustomAppBar(title: "History"),
        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
        const Expanded(child: CustomTabBar())
      ],
    );
  }
}
