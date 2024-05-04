import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/Widgets/snack_bar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/button.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/attach_field.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/header_text.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View_Model/Add_Test_Result_Cubit/add_test_result_cubit.dart';
import 'package:dermabyte/Features/Profile/Data/Models/report_model/report_model.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Reports%20Cubit/reports_cubit.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Tests%20Cubit/tests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestedTestsBody extends StatelessWidget {
  const RequestedTestsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ReportModel report = BlocProvider.of<ReportCubit>(context).patientReport!;
    return BlocConsumer<AddTestResultCubit, AddTestResultState>(
      listener: (context, state) {
        if (state is AddTestResultFailure) {
          showSnackBar(context, state.errMessage);
        } else if (state is AddTestResultSuccess) {
          showSnackBar(context, "Done");
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
                          // AttachedField(
                          //   index: 0,
                          //   title: "Add Your Lab Tests",
                          //   onTap: () {
                          //     showModalBottomSheet(
                          //         context: context,
                          //         builder: (context) {
                          //           return const AllPatientTest();
                          //         });
                          //   },
                          // ),
                          const SizedBox(height: 16),
                          Text(
                            'or',
                            style: Styels.textStyle20_300(context),
                          ),
                          const SizedBox(height: 16),
                          AttachedField(
                            index: index,
                            title: "Upload External Tests",
                            onTap: () async {
                              await BlocProvider.of<AddTestResultCubit>(context)
                                  .uploadExternalTests(index);
                            },
                          ),
                        ],
                      ),
                    );
                  }),
              const SizedBox(height: 30),
              Center(
                child: AddTestButton(
                    text: 'Confirm',
                    onPressed: () async {
                      await BlocProvider.of<AddTestResultCubit>(context)
                          .addTestResult(
                              token: BlocProvider.of<AuthCubit>(context)
                                  .patient!
                                  .token,
                              id: report.id!,
                              body: {
                            "testResult": [
                              "${BlocProvider.of<TestsCubit>(context).testId}"
                            ]
                          });
                    },
                    isLoading:
                        BlocProvider.of<AddTestResultCubit>(context).isLoading),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
