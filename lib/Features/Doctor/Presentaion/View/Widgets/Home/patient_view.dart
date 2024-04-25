import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/snack_bar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Update_Report/update_report_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Home/patient_text_filed_report.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/button.dart';
import 'package:dermabyte/Features/Profile/Data/Models/report_model/report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientView extends StatelessWidget {
  const PatientView({
    super.key,
  });

  static TextEditingController diagnosesController = TextEditingController();
  static TextEditingController treatmentPlanController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    ReportModel? report =
        BlocProvider.of<MyPatientReportCubit>(context).getPatientReport;
    return report==null?
    ErrWidget(
      onTap: (){},
      errMessage: "Something is wrong")
    :
     BlocConsumer<UpdateReportCubit, UpdateReportState>(
      listener: (context, state) {
        if (state is UpdatePatientReportStateSuccess) {
          showSnackBar(context, "Done");
        } else if (state is UpdatePatientReportStateFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                child: ListView(
                  children: [
                    Text("Patient’s diagnoses and treatment",
                        style: Styels.textStyle24_600(context)
                            .copyWith(fontSize: 28)),
                    const SizedBox(height: 42),
                    AspectRatio(
                        aspectRatio: 342 / 165,
                        child: PatientTextFieldReport(
                          controller: diagnosesController,
                          maxLines: 3,
                          hintText: "Diagnoses",
                        )),
                    const SizedBox(height: 32),
                    AspectRatio(
                      aspectRatio: 342 / 165,
                      child: PatientTextFieldReport(
                        controller: treatmentPlanController,
                        maxLines: 3,
                        hintText: "Treatment plan",
                      ),
                    ),
                    const SizedBox(height: 12),
                    // AspectRatio(
                    //   aspectRatio: 342 / 135,
                    //   child: PatientTextFieldReport(
                    //     controller: TextEditingController(text: ''),
                    //     maxLines: 2,
                    //     hintText: "Test Requested",
                    //   ),
                    // ),
                    const SizedBox(height: 50),
                    // Buttons(),
                    MyButton(
                      isLoading:
                          BlocProvider.of<UpdateReportCubit>(context).isLoading,
                      horizontal: 100,
                      textButton: "Send Report",
                      onPressed: () async {
                        await BlocProvider.of<UpdateReportCubit>(context)
                            .updateReport(
                                token: BlocProvider.of<AuthCubit>(context)
                                    .doctorModel!
                                    .token,
                                id: report.id!,
                                body: {
                                  "medicine": [(diagnosesController.text)],
                                  "treatmentPlan": treatmentPlanController.text,
                                },
                                context: context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyButton(
          isLoading: false,
          horizontal: MediaQuery.of(context).size.width * 0.09,
          textButton: "Edit",
          onPressed: () {},
        ),
        MyButton(
          isLoading: false,
          horizontal: MediaQuery.of(context).size.width * 0.08,
          textButton: "Save",
          onPressed: () {},
        ),
        MyButton(
            isLoading: false,
            horizontal: MediaQuery.of(context).size.width * 0.07,
            textButton: "Delete",
            onPressed: () {}),
      ],
    );
  }
}
