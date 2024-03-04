import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Tests/test_view_body.dart';
import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: TestViewBody(),
      ),
    );
  }
}
