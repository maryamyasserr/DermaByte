import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/lab_details_body.dart';
import 'package:flutter/material.dart';

class LabDetailsView extends StatelessWidget {
  const LabDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScanViewBody(),
    );
  }
}
