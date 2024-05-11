import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Consults/medication.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Consults/test_requsted.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Consults/test_result.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Consults/treatment_plan.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Consults/uploaded_test.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Reports%20Cubit/reports_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsultsBodySection extends StatelessWidget {
  const ConsultsBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    ReportModel consultaion =
        BlocProvider.of<ReportCubit>(context).currentConsultation!;
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          consultaion.tests!.isEmpty ? const SizedBox() : const TestRequested(),
          const SizedBox(height: 16),
          consultaion.medicine!.isEmpty
              ? const SizedBox()
              : const Medications(),
          const SizedBox(height: 16),
          consultaion.treatmentPlan!.isEmpty
              ? const SizedBox()
              : const TreatmentPlan(),
          const SizedBox(height: 16),
          consultaion.testResult!.isEmpty
              ? const SizedBox()
              : const TestResult(),
          consultaion.uploadedTest!.isEmpty
              ? const SizedBox()
              : const UploadedTestReportPatient(),
        ],
      ),
    );
  }
}
