import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Profile/Data/Models/report_model/report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientMedications extends StatelessWidget {
  const PatientMedications({
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
              Text(
                "Medications",
                style: Styels.textStyle24_600(context),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: report.medicine!.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "- ${report.medicine?[index] ?? ""}",
                        style: Styels.textStyle18_400(context),
                      ),
                    );
                  }))
            ],
          );
  }
}
