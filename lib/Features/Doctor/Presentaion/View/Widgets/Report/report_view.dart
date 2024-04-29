import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/add_test_body.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/disease_report.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/patient_medication.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/patient_test_requestd.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/patient_test_results.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/patient_treatment_plane.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/personal_info_section.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/button.dart';
import 'package:dermabyte/Features/Profile/Data/Models/report_model/report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});
  static TextEditingController testName = TextEditingController();
  static List<String> allTestsRequested = [];

  @override
  Widget build(BuildContext context) {
    ReportModel? report =
        BlocProvider.of<MyPatientReportCubit>(context).getPatientReport;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
          child: report == null
              ? const ErrWidget(errMessage: "Something is wrong")
              : Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.03),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Text(
                        "${report.patient?.firstName ?? ""}'s report",
                        style: Styels.textStyle24_600(context)
                            .copyWith(fontSize: 28),
                      ),
                      const SizedBox(height: 8),
                      const Divider(
                        color: Colors.black,
                      ),
                      const SizedBox(height: 16),
                      const PersonalInfoSection(),
                      const Divider(
                        color: Colors.black,
                      ),
                      const SizedBox(height: 16),
                      DiseaseReport(
                        diseaseName: report.scan?.diseaseName ?? "",
                      ),
                      const SizedBox(height: 32),
                      report.tests!.isEmpty
                          ? const SizedBox()
                          : const PatientTestRequested(),
                      const SizedBox(height: 24),
                      report.testResult!.isEmpty
                          ? const SizedBox()
                          : const PatientTestResult(),
                      const SizedBox(height: 24),
                      report.medicine!.isEmpty
                          ? const SizedBox()
                          : const PatientMedications(),
                      const SizedBox(height: 24),
                      report.treatmentPlan == null
                          ? const SizedBox()
                          : const PatientTreatmentPlan(),
                      const SizedBox(height: 64),
                      Align(
                        alignment: Alignment.center,
                        child: MyButton(
                            isLoading: false,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.25,
                            textButton: "Request a test",
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AddTestBody();
                                  });
                            }),
                      ),
                      const SizedBox(height: 16)
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
