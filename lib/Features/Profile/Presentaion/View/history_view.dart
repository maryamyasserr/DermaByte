import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/History/history_body.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body:  HistoryBody(),
      ),
    );
  }
}
