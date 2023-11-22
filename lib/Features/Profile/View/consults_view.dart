import 'package:dermabyte/Features/Profile/View/Widgets/consults_body.dart';
import 'package:flutter/material.dart';

class ConsultsView extends StatelessWidget {
  const ConsultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ConsultsBody(),
      ),
    );
  }
}