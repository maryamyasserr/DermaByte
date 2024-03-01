import 'package:dermabyte/Features/Profile/View/Widgets/Disease/disease_body.dart';
import 'package:flutter/material.dart';

class DiseaseView extends StatelessWidget {
  const DiseaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: DiseaseBody(),
      ),
    );
  }
}
