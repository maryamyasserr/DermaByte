import 'package:dermabyte/Features/Appoinments/View/appoinments.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DermaByte());
}

class DermaByte extends StatelessWidget {
  const DermaByte({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Appoinments(),
    );
  }
}
