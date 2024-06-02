import 'package:dermabyte/Core/Widgets/confirmation_alert.dart';
import 'package:dermabyte/Core/Widgets/done_alert.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Reservation_Cubit/my_reservation_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Update_Report/update_report_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Diagnose/patient_text_filed_report.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/button.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PatientView extends StatefulWidget {
  const PatientView({
    super.key,
  });

  static TextEditingController diagnosesController = TextEditingController();
  static TextEditingController treatmentPlanController =
      TextEditingController();

  @override
  State<PatientView> createState() => _PatientViewState();
}

class _PatientViewState extends State<PatientView> {
  @override
  void initState() {
    PatientView.diagnosesController.clear();
    PatientView.treatmentPlanController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ReportModel report =
        BlocProvider.of<MyPatientReportCubit>(context).getPatientReport!;
    return BlocConsumer<UpdateReportCubit, UpdateReportState>(
      listener: (context, state) {
        if (state is UpdatePatientReportStateSuccess) {
          showDoneAlert(context);
        } else if (state is UpdatePatientReportStateFailure) {
          failedAlert(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                child: Column(
                  children: [
                    Text("Patient’s diagnoses and treatment",
                        style: Styels.textStyle24_600(context)
                            .copyWith(fontSize: 28)),
                    const SizedBox(height: 42),
                    AspectRatio(
                        aspectRatio: 342 / 165,
                        child: PatientTextFieldReport(
                          controller: PatientView.diagnosesController,
                          maxLines: 3,
                          hintText: "Diagnoses",
                        )),
                    const SizedBox(height: 32),
                    AspectRatio(
                      aspectRatio: 342 / 165,
                      child: PatientTextFieldReport(
                        controller: PatientView.treatmentPlanController,
                        maxLines: 3,
                        hintText: "Treatment plan",
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Expanded(child: SizedBox()),
                    // Buttons(),
                    MyButton(
                        isLoading: BlocProvider.of<UpdateReportCubit>(context)
                            .isLoading,
                        horizontal: 100,
                        textButton: "Send Report",
                        onPressed: () {
                          if (PatientView.diagnosesController.text.isEmpty) {
                            failedAlert(context, "No Diagnoses Provided");
                          } else if (PatientView
                              .treatmentPlanController.text.isEmpty) {
                            failedAlert(context, "No Treatment Plan Provided");
                          } else {
                            confirmationDialog(
                                context: context,
                                onPressed: () async {
                                  GoRouter.of(context).pop();
                                  FocusScope.of(context).unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  await BlocProvider.of<UpdateReportCubit>(
                                          context)
                                      .updateReport(
                                          token: BlocProvider.of<AuthCubit>(
                                                  context)
                                              .doctorModel!
                                              .token,
                                          id: report.id!,
                                          body: {
                                            "medicine": [
                                              (PatientView
                                                  .diagnosesController.text)
                                            ],
                                            'treatmentPlan': [
                                              (PatientView
                                                  .treatmentPlanController.text)
                                            ]
                                          },
                                          context: context);

                                  BlocProvider.of<MyReservationCubit>(context)
                                      .deletePatientReservation(
                                    id: BlocProvider.of<MyReservationCubit>(
                                            context)
                                        .reservationid!,
                                    token: BlocProvider.of<AuthCubit>(context)
                                        .doctorModel!
                                        .token,
                                  );
                                  await BlocProvider.of<MyReservationCubit>(
                                          context)
                                      .getMyReservations(
                                          token: BlocProvider.of<AuthCubit>(
                                                  context)
                                              .doctorModel!
                                              .token,
                                          reviwed: "true",
                                          completed: "false");
                                });
                          }
                        }),
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
