import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/snack_bar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/button.dart';
import 'package:dermabyte/Features/Lab/Data/Models/uploadedTestModel.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/add_lab_tests.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/attach_field.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/header_text.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View_Model/Add_Test_Result_Cubit/add_test_result_cubit.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Reports%20Cubit/reports_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http_parser/http_parser.dart';

class RequestedTestsBody extends StatefulWidget {
  const RequestedTestsBody({
    super.key,
  });

  @override
  State<RequestedTestsBody> createState() => _RequestedTestsBodyState();
}

class _RequestedTestsBodyState extends State<RequestedTestsBody> {
  @override
  void initState() {
    BlocProvider.of<AddTestResultCubit>(context).deleteAllTests();
    BlocProvider.of<AddTestResultCubit>(context).indices = [];
    BlocProvider.of<AddTestResultCubit>(context).testsids = [];
    BlocProvider.of<AddTestResultCubit>(context).tests = [];
    BlocProvider.of<AddTestResultCubit>(context).allTestResults = [];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ReportModel report = BlocProvider.of<ReportCubit>(context).patientReport!;
    List<UploadedTestModel> allTestResults =
        BlocProvider.of<AddTestResultCubit>(context).allTestResults;
    return BlocConsumer<AddTestResultCubit, AddTestResultState>(
      listener: (context, state) {
        if (state is AddTestResultFailure) {
          showSnackBar(context, state.errMessage);
        } else if (state is DoneState) {
          GoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
         
          
          child: ListView(
            children: [
              const CustomAppBar(title: "Follow Up!"),
              const HeaderText(
                  text: "Follow up with your ongoing and future appointments."),
              const SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Dr ${report.dermatologist!.firstName ?? ""} requested a ${report.tests!.length} tests",
                    style:
                        Styels.textStyle18_600(context).copyWith(fontSize: 22),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: report.tests!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              report.tests![index].testName!
                                  .join(',')
                                  .toString(),
                              style: Styels.textStyle24_600(context)
                                  .copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          AttachedField(
                            testName: report.tests![index].testName![0],
                            index: index,
                            title: "Upload External Tests",
                            onTap: () async {
                              await BlocProvider.of<AddTestResultCubit>(context)
                                  .uploadExternalTests(index);
                              BlocProvider.of<AddTestResultCubit>(context)
                                  .addAllResults(UploadedTestModel(
                                      testName:
                                          report.tests![index].testName![0],
                                      testsFiles:
                                          BlocProvider.of<AddTestResultCubit>(
                                                  context)
                                              .allUploadedTests[index]));
                            },
                          ),
                        ],
                      ),
                    );
                  }),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    const Expanded(
                        child: Divider(
                      color: Colors.black,
                      thickness: 0.5,
                    )),
                    const SizedBox(width: 8),
                    Text(
                      "or",
                      style: Styels.textStyle20_300(context),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                        child: Divider(
                      color: Colors.black,
                      thickness: 0.5,
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: AddTestResultField(
                    isrequired: true,
                    padding: EdgeInsets.only(right: 15, bottom: 10)),
              ),
              const SizedBox(height: 50),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AddTestButton(
                      text: 'Confirm',
                      onPressed: () async {
                        print(BlocProvider.of<AddTestResultCubit>(context)
                            .allTestResults);
                        if (BlocProvider.of<AddTestResultCubit>(context)
                                .testId
                                .isEmpty &&
                            allTestResults.isEmpty) {
                          failedAlert(context, "Attach Your Result");
                        } else {
                          if (BlocProvider.of<AddTestResultCubit>(context)
                              .testId
                              .isNotEmpty) {
                            await BlocProvider.of<AddTestResultCubit>(context)
                                .addTestResult(
                                    token: BlocProvider.of<AuthCubit>(context)
                                        .patient!
                                        .token,
                                    id: report.id!,
                                    body: {
                                  "testResult":
                                      BlocProvider.of<AddTestResultCubit>(
                                              context)
                                          .testId
                                });
                          }

                          if (allTestResults.isNotEmpty) {
                            FormData formData = FormData();
                            for (int i = 0; i < allTestResults.length; i++) {
                              for (int j = 0;
                                  j < allTestResults[i].testsFiles.length;
                                  j++) {
                                formData.files.add(
                                  MapEntry(
                                    allTestResults[i].testName,
                                    await MultipartFile.fromFile(
                                      allTestResults[i].testsFiles[j].path,
                                      filename: 'test Results$i.jpg',
                                      contentType: MediaType('image', 'jpeg'),
                                    ),
                                  ),
                                );
                              }
                            }
                            await BlocProvider.of<AddTestResultCubit>(context)
                                .uploadTestResultstoDataBase(
                                    id: report.id!,
                                    token: BlocProvider.of<AuthCubit>(context)
                                        .patient!
                                        .token,
                                    body: formData);
                          }
                        }
                      },
                      isLoading: BlocProvider.of<AddTestResultCubit>(context)
                          .isLoading),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
