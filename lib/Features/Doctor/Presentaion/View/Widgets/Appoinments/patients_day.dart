import 'package:dermabyte/Core/Widgets/empty.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
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
        if (state is MyAppoinmentsSuccess) {
          if (state.appoinments.isEmpty) {
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
                                onChanged: (value) {
                                  BlocProvider.of<MyReservationCubit>(context)
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
                                  .format(state.appoinments[0].date!),
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
                              onChanged: (value) {
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
                          itemCount: state.appoinments.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.01,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.01),
                              child: PatientCard(
                                show: true,
                                hour: state.appoinments[index].date!.hour,
                                minutes: state.appoinments[index].date!.minute,
                                textButton: 'Start',
                                cardTitle:
                                    "${state.appoinments[index].patient!.firstName} ${state.appoinments[index].patient!.lastName}",
                                cardSubTitle:
                                    "${state.appoinments[index].patient?.firstName ?? ""} had an scan and the result was ${state.appoinments[index].scan?.diseaseName ?? ""}",
                                imageCard: state
                                    .appoinments[index].patient?.profilePic,
                                onPressed: () {},
                                diagnose: () {
                                                                  if (BlocProvider.of<MyPatientReportCubit>(
                                            context)
                                        .getPatientReport ==
                                    null) {
                                  failedAlert(context, "Some Thing Is Wrong");
                                } else {
                                  BlocProvider.of<MyPatientReportCubit>(context)
                                          .setId =
                                      state.appoinments[index].scan!.id!;

                                  GoRouter.of(context)
                                      .push(AppRoutes.kPatientView);
                                }
                                },
                                onTap: () {
                                   BlocProvider.of<MyPatientReportCubit>(context)
                                        .setId =
                                    state.appoinments[index].scan!.id!;
                           
                                if (BlocProvider.of<MyPatientReportCubit>(
                                            context)
                                        .getPatientReport ==
                                    null) {
                                  failedAlert(context, 'Something is Wrong');
                                } else {
                                  GoRouter.of(context)
                                      .push(AppRoutes.kReportView);
                                }
                                },
                              ),
                            );
                          }))
                ]);
          }
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Choose Date",
                        style: Styels.textStyle24_600(context)
                            .copyWith(decoration: TextDecoration.underline)),
                    DropdownButton<DateTime>(
                        icon: const Icon(Icons.filter_list_alt),
                        dropdownColor: const Color.fromARGB(144, 206, 241, 236),
                        elevation: 0,
                        underline: const SizedBox(),
                        items: BlocProvider.of<MyReservationCubit>(context)
                            .myDates
                            .map((e) {
                          return DropdownMenuItem(
                              value: e,
                              child: Text(DateFormat.yMMMd().format(e)));
                        }).toList(),
                        onChanged: (value) {
                          BlocProvider.of<MyReservationCubit>(context)
                              .getSelectedDate(value!);
                        }),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
