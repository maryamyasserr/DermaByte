import 'package:dermabyte/Features/E-Lab/View/Widget/e_lab_body.dart';
import 'package:flutter/material.dart';

class ELabView extends StatelessWidget {
  const ELabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: ElabBody()
    );
  }
}