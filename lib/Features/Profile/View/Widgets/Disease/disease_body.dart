import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/Disease/disease_body_section.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/Disease/disease_header_section.dart';
import 'package:flutter/material.dart';

class DiseaseBody extends StatelessWidget {
  const DiseaseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const CustomAppBar(title: "History"),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          const DiseaseHeaderSection(),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          const DiseaseBodySection()
        ],
      ),
    );
  }
}