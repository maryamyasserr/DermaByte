import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/add_test_body.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/disease_report.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/dots_indicator.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/patient_medication.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/patient_test_requestd.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/patient_test_results.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/patient_treatment_plane.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/personal_info_section.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/uploaded_test.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/button.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportView extends StatefulWidget {
  const ReportView({super.key});
  static TextEditingController testName = TextEditingController();
  static List<String> allTestsRequested = [];

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ReportModel report =
        BlocProvider.of<MyPatientReportCubit>(context).getPatientReport!;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.kBackground), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03),
            child: BlocBuilder<MyPatientReportCubit, MyPatientReportState>(
              builder: (context, state) {
                if (state is MyPatientReportSuccess) {
                  return ListView(
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
                        pageController: pageController,
                        diseaseName: report.scan?[0].diseaseName ?? "",
                      ),
                      const SizedBox(height: 16),
                      DotsIndicatorDoctor(
                        currentPageIndex: currentIndex,
                        count: report.scan!.length,
                      ),
                      const SizedBox(height: 32),
                      report.tests!.isEmpty
                          ? const SizedBox()
                          : const PatientTestRequested(),
                      const SizedBox(height: 24),
                      report.testResult!.isEmpty
                          ? const SizedBox()
                          : const PatientTestResult(),
                      report.uploadedTest!.isEmpty
                          ? const SizedBox()
                          : const UploadedTestReport(),
                      report.medicine!.isEmpty
                          ? const SizedBox()
                          : const PatientMedications(),
                      const SizedBox(height: 24),
                      report.treatmentPlan!.isEmpty
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
                              showModalBottomSheet(
                                isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return const AddTestBody();
                                  });
                            }),
                      ),
                      const SizedBox(height: 16)
                    ],
                  );
                } else if (state is MyPatientReportFailure) {
                  return Center(
                      child: ErrWidget(
                    errMessage: state.errMessage,
                    onTap: () async {
                      await BlocProvider.of<MyPatientReportCubit>(context)
                          .getMyPatientsReport(
                              token: BlocProvider.of<AuthCubit>(context)
                                  .doctorModel!
                                  .token);
                    },
                  ));
                } else {
                  return const Center(
                    child: LoadingIndicator(color: AppColors.kPrimaryColor),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
