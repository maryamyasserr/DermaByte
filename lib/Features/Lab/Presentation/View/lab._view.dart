import 'package:dermabyte/Features/Lab/Presentation/View/Widget/lab_body.dart';
import 'package:flutter/material.dart';

class LabView extends StatelessWidget {
  const LabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: LabBody());
  }
}
