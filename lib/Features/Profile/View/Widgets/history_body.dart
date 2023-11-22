import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:flutter/material.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(title: "History"),
        
      ],
    );
  }
}