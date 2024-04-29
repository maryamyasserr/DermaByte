import 'package:dermabyte/Core/Widgets/custom_appBar.dart';

import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Features/Profile/Data/Models/scan.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Disease/disease_body_section.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Disease/disease_header_section.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Scan%20Cubit/scan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiseaseBody extends StatelessWidget {
  const DiseaseBody({super.key});

  @override
  Widget build(BuildContext context) {
    ScanModel scan = BlocProvider.of<ScanCubit>(context).currentScan!;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const CustomAppBar(title: "History"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            DiseaseHeaderSection(
              scanDate: scan.scanDate,
              diseaseName: scan.dieseaseName,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            DiseaseBodySection(
              diseaseName: scan.dieseaseName,
            )
          ],
        ),
      ),
    );
  }
}
