import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Appoinments/Presentaion/View/Widgets/attack_field.dart';

import 'package:dermabyte/Features/Appoinments/Presentaion/View/Widgets/header_text.dart';
import 'package:dermabyte/Features/Profile/Data/Models/patient_consults_model/patient_consults_model.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Reports%20Cubit/reports_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestedTestsBody extends StatelessWidget {
  const RequestedTestsBody({super.key, this.testName, this.testsCounts});

  final List<dynamic>? testName;
  final int? testsCounts;

  @override
  Widget build(BuildContext context) {
    ReportModel report = BlocProvider.of<ReportCubit>(context).patientReport;

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
      child: Column(
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
                "Dr ${report.dermatologist?.firstName ?? ""} requested a ${testsCounts!} tests",
                style: Styels.textStyle18_600(context).copyWith(fontSize: 22),
              ),
            ),
          ),
          const SizedBox(height: 20),
          AttachedField(
            title: "Add Your Lab Tests",
            onTap: () {
              // showModalBottomSheet(
              //     context: context,
              //     builder: (context) {
              //       if (tests.isNotEmpty) {
              //         return SizedBox(
              //             height: MediaQuery.sizeOf(context).height * 0.7,
              //             width: MediaQuery.sizeOf(context).width,
              //             child: ListView.builder(
              //                 physics: const BouncingScrollPhysics(),
              //                 itemCount: tests.length,
              //                 itemBuilder: (context, index) {
              //                   return CustomCard(
              //                       iconCard: Assets.kAlphaScan,
              //                       cardTitle: tests[index].testName ?? "",
              //                       cardSubTitle:
              //                           "the test did on ${tests[index].testDate.day}/ ${tests[index].testDate.month}/ ${tests[index].testDate.year}",
              //                       textButton: "");
              //                 }));
              //       } else {
              //         return const Center(
              //             child: Text("You have never done tests before"));
              //       }
              //     });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'or',
                  style: Styels.textStyle18_400(context).copyWith(fontSize: 24),
                )),
          ),
          AttachedField(
            title: "Upload External Tests",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
