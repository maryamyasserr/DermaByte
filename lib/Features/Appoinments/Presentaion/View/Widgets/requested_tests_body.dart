import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Appoinments/Presentaion/View/Widgets/all_patient_tests.dart';
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
          Expanded(
              child: ListView.builder(
                  itemCount: testsCounts,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(testName![index],
                              style: Styels.textStyle20_300(context)
                                  .copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          AttachedField(
                            title: "Add Your Lab Tests",
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return const AllPatientTest();
                                  });
                            },
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'or',
                            style: Styels.textStyle18_400(context)
                                .copyWith(fontSize: 24),
                          ),
                          const SizedBox(height: 16),
                          AttachedField(
                            title: "Upload External Tests",
                            onTap: () {},
                          ),
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
