import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/personal_info.dart';
import 'package:dermabyte/Features/Profile/Data/Models/report_model/report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    ReportModel report =
        BlocProvider.of<MyPatientReportCubit>(context).getPatientReport!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Personal details",
          style: Styels.textStyle24_600(context),
        ),
        const SizedBox(height: 12),
        PersonalInfo(
            data: "${report.patient!.firstName} ${report.patient!.lastName}"),
        PersonalInfo(data: "${report.patient!.age} Years Old"),
        //  PersonalInfo(data:  "${report.scan!.scanDate}"),
        const SizedBox(height: 18),
      ],
    );
  }
}
