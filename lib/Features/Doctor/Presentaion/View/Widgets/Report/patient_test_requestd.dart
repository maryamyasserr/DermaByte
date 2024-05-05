import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientTestRequested extends StatelessWidget {
  const PatientTestRequested({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ReportModel report =
        BlocProvider.of<MyPatientReportCubit>(context).getPatientReport!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Test requested.",
          style: Styels.textStyle24_600(context),
        ),
        const SizedBox(height: 10),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: report.tests!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "- ${report.tests?[index].testName!.join(',') ?? ""} Test",
                  style: Styels.textStyle18_400(context),
                ),
              );
            }),
      ],
    );
  }
}
