import 'package:dermabyte/Core/Widgets/empty.dart';
import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Core/utils/url_launcher.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Reservation_Cubit/my_reservation_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/patient_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PatientsDay extends StatelessWidget {
  const PatientsDay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyReservationCubit, MyReservationState>(
      builder: (context, state) {
        if (state is MyReservationSuccess) {
          if (state.reservation == null || state.reservation!.isEmpty) {
            return Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Choose Date",
                                style: Styels.textStyle24_600(context).copyWith(
                                    decoration: TextDecoration.underline)),
                            DropdownButton<DateTime>(
                                icon: const Icon(Icons.filter_list_alt),
                                dropdownColor:
                                    const Color.fromARGB(144, 206, 241, 236),
                                elevation: 0,
                                underline: const SizedBox(),
                                items:
                                    BlocProvider.of<MyReservationCubit>(context)
                                        .myDates
                                        .map((e) {
                                  return DropdownMenuItem(
                                      value: e,
                                      child:
                                          Text(DateFormat.yMMMd().format(e)));
                                }).toList(),
                                onChanged: (value) async {
                                  await BlocProvider.of<MyReservationCubit>(
                                          context)
                                      .getMyReservations(
                                          completed: 'false',
                                          reviwed: 'true',
                                          token: BlocProvider.of<AuthCubit>(
                                                  context)
                                              .doctorModel!
                                              .token);
                                  await BlocProvider.of<MyReservationCubit>(
                                          context)
                                      .getSelectedDate(value!);
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 10,
                  child: Align(
                      alignment: Alignment.center,
                      child: EmptyWidget(text: "no Appoinments for this day")),
                ),
              ],
            );
          } else {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              DateFormat.yMMMd()
                                  .format(state.reservation![0].date!),
                              style: Styels.textStyle24_600(context).copyWith(
                                  decoration: TextDecoration.underline)),
                          DropdownButton<DateTime>(
                              icon: const Icon(Icons.filter_list_alt),
                              dropdownColor:
                                  const Color.fromARGB(144, 206, 241, 236),
                              elevation: 0,
                              underline: const SizedBox(),
                              items:
                                  BlocProvider.of<MyReservationCubit>(context)
                                      .myDates
                                      .map((e) {
                                return DropdownMenuItem(
                                    value: e,
                                    child: Text(DateFormat.yMMMd().format(e)));
                              }).toList(),
                              onChanged: (value) async {
                                await BlocProvider.of<MyReservationCubit>(
                                        context)
                                    .getMyReservations(
                                        completed: 'false',
                                        reviwed: 'true',
                                        token:
                                            BlocProvider.of<AuthCubit>(context)
                                                .doctorModel!
                                                .token);
                                BlocProvider.of<MyReservationCubit>(context)
                                    .getSelectedDate(value!);
                              }),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Expanded(
                      child: ListView.builder(
                          itemCount: state.reservation!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.01),
                              child: PatientCard(
                                show: true,
                                hour: state.reservation![index].date!.hour,
                                minutes: state.reservation![index].date!.minute,
                                textButton: 'Start',
                                cardTitle:
                                    "${state.reservation![index].patient!.firstName} ${state.reservation![index].patient!.lastName}",
                                cardSubTitle:
                                    "${state.reservation![index].patient?.firstName ?? ""} had an scan and the result was ${state.reservation![index].scan?[0].diseaseName ?? ""}......",
                                imageCard: state
                                    .reservation![index].patient?.profilePic,
                                onPressed: () async {
                                  // if (BlocProvider.of<MyReservationCubit>(
                                  //             context)
                                  //         .compareDates(
                                  //             DateTime.now(),
                                  //             state
                                  //                 .reservation![index].date!) ==
                                  //     true) {
                                  //   await cUrlLauncher(
                                  //       context: context,
                                  //       url: state
                                  //           .reservation![index].meetingUrl);
                                  // } else {
                                  //   failedAlert(context,
                                  //       "appointment has not come yet");
                                  // }
                                   await cUrlLauncher(
                                        context: context,
                                        url: state
                                            .reservation![index].meetingUrl);
                                },
                                diagnose: () {
                                  BlocProvider.of<MyPatientReportCubit>(context)
                                          .setId =
                                      state.reservation![index].report![index]
                                          .id!;
                                  if (BlocProvider.of<MyPatientReportCubit>(
                                              context)
                                          .getPatientReport ==
                                      null) {
                                    failedAlert(context, "Some Thing Is Wrong");
                                  } else {
                                    BlocProvider.of<MyReservationCubit>(context)
                                            .reservationid =
                                        state.reservation![index].id;
                                    GoRouter.of(context)
                                        .push(AppRoutes.kPatientView);
                                  }
                                },
                                onTap: () {
                                  BlocProvider.of<MyPatientReportCubit>(context)
                                          .setId =
                                      state.reservation![index].report![index]
                                          .id!;
                                  print(state
                                      .reservation![index].report![index].id!);
                                  if (BlocProvider.of<MyPatientReportCubit>(
                                              context)
                                          .getPatientReport ==
                                      null) {
                                    failedAlert(context, 'Something is Wrong');
                                  } else {
                                    print(BlocProvider.of<MyPatientReportCubit>(
                                            context)
                                        .getPatientReport!
                                        .id);
                                    GoRouter.of(context)
                                        .push(AppRoutes.kReportView);
                                  }
                                },
                              ),
                            );
                          }))
                ]);
          }
        } else if (state is MyReservationFailure) {
          return ErrWidget(
              onTap: () async {
                BlocProvider.of<MyReservationCubit>(context).getMyReservations(
                    token:
                        BlocProvider.of<AuthCubit>(context).doctorModel!.token,
                    reviwed: 'true',
                    completed: 'false');
                BlocProvider.of<MyPatientReportCubit>(context)
                    .getMyPatientsReport(
                        token: BlocProvider.of<AuthCubit>(context)
                            .doctorModel!
                            .token);
              },
              errMessage: state.errMessage);
        } else {
          return const Center(
            child: LoadingIndicator(color: AppColors.kPrimaryColor),
          );
        }
      },
    );
  }
}
