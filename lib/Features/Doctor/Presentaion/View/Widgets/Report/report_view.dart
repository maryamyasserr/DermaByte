import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/add_test_body.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/disease_report.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/personal_info_section.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/button.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});
  static TextEditingController testName = TextEditingController();
  static List<String> allTestsRequested = [];

  @override
  Widget build(BuildContext context) {
    ReportModel report =
        BlocProvider.of<MyPatientReportCubit>(context).getPatientReport;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Flexible(
                    child: SizedBox(
                  height: 60,
                )),
                Text(
                  "${report.patient?.firstName ?? ""}'s report",
                  style: Styels.textStyle24_600(context).copyWith(fontSize: 28),
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
                const Expanded(flex: 2, child: SizedBox()),
                Align(
                  alignment: Alignment.center,
                  child: MyButton(
                      horizontal: MediaQuery.of(context).size.width * 0.25,
                      textButton: "Request a test",
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AddTestBody();
                            });
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
