import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/requested_tests_body.dart';
import 'package:flutter/material.dart';

class RequestedTestsView extends StatelessWidget {
  const RequestedTestsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: RequestedTestsBody(),
      ),
    );
  }
}
