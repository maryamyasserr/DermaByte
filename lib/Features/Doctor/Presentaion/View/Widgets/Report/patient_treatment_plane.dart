import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Profile/Data/Models/report_model/report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientTreatmentPlan extends StatelessWidget {
  const PatientTreatmentPlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ReportModel? report =
        BlocProvider.of<MyPatientReportCubit>(context).getPatientReport;
    return report == null
        ? const ErrWidget(errMessage: "Something is wrong")
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Treatment plan", style: Styels.textStyle24_600(context)),
              Text(
                "- ${report.treatmentPlan[0]}",
                style: Styels.textStyle18_400(context),
              ),
            ],
          );
  }
}
