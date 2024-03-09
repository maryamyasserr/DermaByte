import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/requested_tests_body.dart';
import 'package:flutter/material.dart';

class RequestedTestsView extends StatelessWidget {
  const RequestedTestsView({super.key, required this.testData});

  final TestData testData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RequestedTestsBody(
          testName: testData.test,
          testsCounts: testData.testCount,
        ),
      ),
    );
  }
}

class TestData {
  final List<dynamic>? test;
  final int testCount;

  TestData({required this.test, required this.testCount});
}
