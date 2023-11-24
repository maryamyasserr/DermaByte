import 'package:dermabyte/Features/E-Lab/View/Widget/requests_body.dart';
import 'package:flutter/material.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: RequestsBody(),
      ),
    );
  }
}